-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 PostgreSQL 18.0 on x86_64-windows, compiled by msvc-19.44.35217, 64-bit
-- OS Server:                    
-- HeidiSQL Versi:               12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- membuang struktur untuk table public.dosen
CREATE TABLE IF NOT EXISTS "dosen" (
	"id_dosen" SERIAL NOT NULL,
	"nidn" VARCHAR(20) NOT NULL,
	"nama_dosen" VARCHAR(100) NOT NULL,
	"gelar" VARCHAR(50) NULL DEFAULT NULL,
	"keahlian" TEXT NULL DEFAULT NULL,
	"no_telp" VARCHAR(15) NULL DEFAULT NULL,
	PRIMARY KEY ("id_dosen"),
	UNIQUE "dosen_nidn_key" ("nidn")
);

-- Membuang data untuk tabel public.dosen: 0 rows
/*!40000 ALTER TABLE "dosen" DISABLE KEYS */;
/*!40000 ALTER TABLE "dosen" ENABLE KEYS */;

-- membuang struktur untuk table public.jadwal
CREATE TABLE IF NOT EXISTS "jadwal" (
	"id_jadwal" SERIAL NOT NULL,
	"id_mk" INTEGER NOT NULL,
	"id_dosen" INTEGER NOT NULL,
	"id_ruangan" INTEGER NOT NULL,
	"hari" VARCHAR(10) NULL DEFAULT NULL,
	"jam_mulai" TIME NOT NULL,
	"jam_selesai" TIME NOT NULL,
	"kelas" VARCHAR(10) NOT NULL,
	PRIMARY KEY ("id_jadwal"),
	CONSTRAINT "jadwal_id_dosen_fkey" FOREIGN KEY ("id_dosen") REFERENCES "dosen" ("id_dosen") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "jadwal_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah" ("id_mk") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "jadwal_id_ruangan_fkey" FOREIGN KEY ("id_ruangan") REFERENCES "ruangan" ("id_ruangan") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "jadwal_hari_check" CHECK (((hari)::text = ANY ((ARRAY['Senin'::character varying, 'Selasa'::character varying, 'Rabu'::character varying, 'Kamis'::character varying, 'Jumat'::character varying, 'Sabtu'::character varying, 'Minggu'::character varying])::text[])))
);

-- Membuang data untuk tabel public.jadwal: 0 rows
/*!40000 ALTER TABLE "jadwal" DISABLE KEYS */;
/*!40000 ALTER TABLE "jadwal" ENABLE KEYS */;

-- membuang struktur untuk table public.jurusan
CREATE TABLE IF NOT EXISTS "jurusan" (
	"kode_jurusan" VARCHAR(10) NOT NULL,
	"nama_jurusan" VARCHAR(100) NOT NULL,
	PRIMARY KEY ("kode_jurusan")
);

-- Membuang data untuk tabel public.jurusan: 2 rows
/*!40000 ALTER TABLE "jurusan" DISABLE KEYS */;
-- membuang struktur untuk table public.khs
CREATE TABLE IF NOT EXISTS "khs" (
	"id_khs" SERIAL NOT NULL,
	"nim" VARCHAR(20) NOT NULL,
	"id_mk" INTEGER NOT NULL,
	"ips" DOUBLE PRECISION NULL DEFAULT 0,
	"sks" INTEGER NULL DEFAULT 0,
	"predikat" VARCHAR(3) NULL DEFAULT 'E',
	PRIMARY KEY ("id_khs"),
	CONSTRAINT "khs_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah" ("id_mk") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "khs_nim_fkey" FOREIGN KEY ("nim") REFERENCES "mahasiswa" ("nim") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Membuang data untuk tabel public.khs: 0 rows
/*!40000 ALTER TABLE "khs" DISABLE KEYS */;
/*!40000 ALTER TABLE "khs" ENABLE KEYS */;

-- membuang struktur untuk table public.krs
CREATE TABLE IF NOT EXISTS "krs" (
	"id_krs" SERIAL NOT NULL,
	"nim" VARCHAR(20) NOT NULL,
	"id_mk" INTEGER NOT NULL,
	PRIMARY KEY ("id_krs"),
	CONSTRAINT "krs_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah" ("id_mk") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "krs_nim_fkey" FOREIGN KEY ("nim") REFERENCES "mahasiswa" ("nim") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Membuang data untuk tabel public.krs: 0 rows
/*!40000 ALTER TABLE "krs" DISABLE KEYS */;
/*!40000 ALTER TABLE "krs" ENABLE KEYS */;

-- membuang struktur untuk table public.mahasiswa
CREATE TABLE IF NOT EXISTS "mahasiswa" (
	"nim" VARCHAR(20) NOT NULL,
	"nama" VARCHAR(100) NOT NULL,
	"alamat" TEXT NULL DEFAULT NULL,
	"status" VARCHAR(20) NULL DEFAULT 'Aktif',
	"foto" TEXT NULL DEFAULT NULL,
	"kode_prodi" VARCHAR(10) NULL DEFAULT NULL,
	"kecamatan" VARCHAR(100) NULL DEFAULT NULL,
	"kota_kabupaten" VARCHAR(100) NULL DEFAULT NULL,
	"provinsi" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("nim"),
	CONSTRAINT "mahasiswa_kode_prodi_fkey" FOREIGN KEY ("kode_prodi") REFERENCES "prodi" ("kode_prodi") ON UPDATE NO ACTION ON DELETE SET NULL,
	CONSTRAINT "mahasiswa_status_check" CHECK (((status)::text = ANY ((ARRAY['Aktif'::character varying, 'Cuti'::character varying, 'Lulus'::character varying])::text[])))
);

-- Membuang data untuk tabel public.mahasiswa: 0 rows
/*!40000 ALTER TABLE "mahasiswa" DISABLE KEYS */;
/*!40000 ALTER TABLE "mahasiswa" ENABLE KEYS */;

-- membuang struktur untuk table public.mata_kuliah
CREATE TABLE IF NOT EXISTS "mata_kuliah" (
	"id_mk" SERIAL NOT NULL,
	"kode_mk" VARCHAR(15) NOT NULL,
	"nama_mk" VARCHAR(100) NOT NULL,
	"sks" INTEGER NOT NULL,
	"semester" INTEGER NOT NULL,
	PRIMARY KEY ("id_mk"),
	UNIQUE "mata_kuliah_kode_mk_key" ("kode_mk")
);

-- Membuang data untuk tabel public.mata_kuliah: 0 rows
/*!40000 ALTER TABLE "mata_kuliah" DISABLE KEYS */;
/*!40000 ALTER TABLE "mata_kuliah" ENABLE KEYS */;

-- membuang struktur untuk table public.prodi
CREATE TABLE IF NOT EXISTS "prodi" (
	"kode_prodi" VARCHAR(10) NOT NULL,
	"nama_prodi" VARCHAR(100) NOT NULL,
	"akreditasi" VARCHAR(2) NOT NULL,
	"kode_jurusan" VARCHAR(10) NULL DEFAULT NULL,
	PRIMARY KEY ("kode_prodi"),
	CONSTRAINT "prodi_kode_jurusan_fkey" FOREIGN KEY ("kode_jurusan") REFERENCES "jurusan" ("kode_jurusan") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Membuang data untuk tabel public.prodi: 3 rows
/*!40000 ALTER TABLE "prodi" DISABLE KEYS */;
-- membuang struktur untuk table public.riwayat_pembayaran
CREATE TABLE IF NOT EXISTS "riwayat_pembayaran" (
	"id_bayar" SERIAL NOT NULL,
	"tgl_bayar" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"jumlah" DOUBLE PRECISION NOT NULL DEFAULT 0,
	"status" SMALLINT NOT NULL,
	PRIMARY KEY ("id_bayar")
);

-- Membuang data untuk tabel public.riwayat_pembayaran: 0 rows
/*!40000 ALTER TABLE "riwayat_pembayaran" DISABLE KEYS */;
/*!40000 ALTER TABLE "riwayat_pembayaran" ENABLE KEYS */;

-- membuang struktur untuk table public.ruangan
CREATE TABLE IF NOT EXISTS "ruangan" (
	"id_ruangan" SERIAL NOT NULL,
	"nama_ruangan" VARCHAR(50) NOT NULL,
	"kapasitas" INTEGER NOT NULL,
	PRIMARY KEY ("id_ruangan"),
	UNIQUE "ruangan_nama_ruangan_key" ("nama_ruangan")
);

-- Membuang data untuk tabel public.ruangan: 0 rows
/*!40000 ALTER TABLE "ruangan" DISABLE KEYS */;
/*!40000 ALTER TABLE "ruangan" ENABLE KEYS */;

-- membuang struktur untuk table public.tagihan
CREATE TABLE IF NOT EXISTS "tagihan" (
	"id_tagihan" SERIAL NOT NULL,
	"nim" VARCHAR(20) NOT NULL,
	"jenis_biaya" VARCHAR(50) NOT NULL,
	"semester" INTEGER NOT NULL,
	"tahun_ajar" VARCHAR(10) NOT NULL,
	"jumlah_tagihan" NUMERIC(12,2) NOT NULL DEFAULT 0,
	"status_tagihan" VARCHAR(20) NULL DEFAULT NULL,
	PRIMARY KEY ("id_tagihan"),
	CONSTRAINT "tagihan_nim_fkey" FOREIGN KEY ("nim") REFERENCES "mahasiswa" ("nim") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "tagihan_status_tagihan_check" CHECK (((status_tagihan)::text = ANY ((ARRAY['Belum Lunas'::character varying, 'Lunas'::character varying])::text[])))
);

-- Membuang data untuk tabel public.tagihan: 0 rows
/*!40000 ALTER TABLE "tagihan" DISABLE KEYS */;
/*!40000 ALTER TABLE "tagihan" ENABLE KEYS */;

-- membuang struktur untuk table public.tugas_akhir
CREATE TABLE IF NOT EXISTS "tugas_akhir" (
	"id_skripsi" SERIAL NOT NULL,
	"nim" VARCHAR(20) NOT NULL,
	"judul" TEXT NOT NULL,
	"pembimbing" VARCHAR(100) NULL DEFAULT NULL,
	"penguji" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("id_skripsi"),
	CONSTRAINT "tugas_akhir_nim_fkey" FOREIGN KEY ("nim") REFERENCES "mahasiswa" ("nim") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Membuang data untuk tabel public.tugas_akhir: 0 rows
/*!40000 ALTER TABLE "tugas_akhir" DISABLE KEYS */;
/*!40000 ALTER TABLE "tugas_akhir" ENABLE KEYS */;

-- membuang struktur untuk table public.user_auth
CREATE TABLE IF NOT EXISTS "user_auth" (
	"id_user" SERIAL NOT NULL,
	"username" VARCHAR(50) NOT NULL,
	"password_hashed" VARCHAR(255) NOT NULL,
	"role" VARCHAR(20) NULL DEFAULT NULL,
	PRIMARY KEY ("id_user"),
	UNIQUE "user_auth_username_key" ("username"),
	CONSTRAINT "user_auth_role_check" CHECK (((role)::text = ANY ((ARRAY['Admin'::character varying, 'Dosen'::character varying, 'Mahasiswa'::character varying])::text[])))
);

-- Membuang data untuk tabel public.user_auth: 0 rows
/*!40000 ALTER TABLE "user_auth" DISABLE KEYS */;
/*!40000 ALTER TABLE "user_auth" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
