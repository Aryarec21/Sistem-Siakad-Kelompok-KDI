<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIAKAD - Dashboard Mahasiswa</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="dashboard.css">
       
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-siakad sticky-top">
        <div class="container-fluid p-0">
            
            <a href="#" class="navbar-brand p-0 m-0">
                <img src="assets1/img/logo-white.png" alt="Logo ITH" class="brand-logo-img">
            </a>
            
            <div class="navbar-nav me-auto ms-4 d-none d-lg-flex align-items-center" style="gap: 15px;">
                <a href="#" class="nav-link nav-link-custom active"><i class="fa fa-home"></i> Dashboard</a>
                
                <div class="nav-item dropdown">
                    <a class="nav-link nav-link-custom dropdown-toggle" href="#" id="siakadDropdownMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-university"></i> SIAKAD
                    </a>
                    <ul class="dropdown-menu shadow-sm mt-2" aria-labelledby="siakadDropdownMenu" style="border-radius: 4px; border: 1px solid #eee;">
                        <li><a class="dropdown-item py-2" href="#" style="font-size: 0.85rem; color: #333;"><i class="fa-solid fa-file-signature me-2 text-muted" style="width: 15px;"></i> KRS</a></li>
                        <li><a class="dropdown-item py-2" href="#" style="font-size: 0.85rem; color: #333;"><i class="fa-solid fa-file-invoice me-2 text-muted" style="width: 15px;"></i> KHS</a></li>
                        <li><a class="dropdown-item py-2" href="#" style="font-size: 0.85rem; color: #333;"><i class="fa-solid fa-graduation-cap me-2 text-muted" style="width: 15px;"></i> Transkrip Nilai</a></li>
                        <li><a class="dropdown-item py-2" href="#" style="font-size: 0.85rem; color: #333;"><i class="fa-solid fa-book-open me-2 text-muted" style="width: 15px;"></i> Matakuliah</a></li>
                        <li><div class="dropdown-divider my-1"></div></li>
                        <li><a class="dropdown-item py-2" href="#" style="font-size: 0.85rem; color: #333;"><i class="fa-solid fa-user-graduate me-2 text-muted" style="width: 15px;"></i> Tugas Akhir</a></li>
                    </ul>
                </div>

                <a href="#" class="nav-link nav-link-custom"><i class="fa fa-wallet"></i> Riwayat Pembayaran</a>
                <a href="#" class="nav-link nav-link-custom"><i class="fa fa-bullhorn"></i> Pengumuman</a>
            </div>

            <div class="user-info d-flex align-items-center ms-auto dropdown">
    <!-- Area Klik (Trigger Dropdown) -->
    <div class="d-flex align-items-center" id="profileMenu" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer;">
        <div class="text-end me-2">
            <div id="userName" class="fw-bold mb-0" style="font-size: 0.85rem; letter-spacing: 0.5px; color: white;">USER</div>
            <div id="userRole" style="font-size: 0.7rem; color: #cbd5e1;">Mahasiswa</div>
        </div>
        <div class="avatar-circle">
            <i class="fa fa-user"></i>
        </div>
    </div>

    <ul class="dropdown-menu dropdown-menu-end shadow border-0 custom-dropdown" aria-labelledby="profileMenu">
        <li class="px-3 py-2 d-md-none text-dark border-bottom mb-2">
            <div class="fw-bold">USER</div>
            <small class="text-muted">Mahasiswa</small>
        </li>
        <li>
            <a class="dropdown-item py-2" href="#">
                <i class="fa-solid fa-id-card me-2 text-primary"></i> Data Diri
            </a>
        </li>
        <li>
            <a class="dropdown-item py-2" href="#">
                <i class="fa-solid fa-user-gear me-2 text-success"></i> Profil
            </a>
        </li>
        <li><hr class="dropdown-divider"></li>
        <li>
            <a class="dropdown-item py-2 text-danger" href="logout.php">
                <i class="fa-solid fa-right-from-bracket me-2"></i> Log Out
            </a>
        </li>
    </ul>
</div>

        </div>
    </nav>

    <div class="container-fluid main-content px-4">
        <div class="row">
            
            <div class="col-lg-7">
                <div class="card-custom">
                    <div class="card-header-custom text-uppercase">
                        Perkembangan Indeks Prestasi Per Semester
                    </div>
                    <div class="card-body p-4">
                        <div style="height: 320px;">
                            <canvas id="chartIPK"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-5">
                
                <div class="card-custom">
                    <div class="card-header-custom text-uppercase">
                        Pengumuman
                    </div>
                    <div class="card-body p-0">
                        <div class="p-3 border-bottom">
                            <div class="d-flex justify-content-between align-items-start">
                                <a href="#" class="text-decoration-none fw-500" style="color: var(--primary-blue); font-size: 0.95rem;">Info Penerima Beasiswa KIP Kuliah ITH</a>
                                <span class="text-muted" style="font-size: 0.75rem;">30/01/2025</span>
                            </div>
                            <p class="small text-muted mb-0 mt-1">Status penetapan penerima Beasiswa KIP Kuliah ITH Tahun 2024...</p>
                        </div>
                        
                        <div class="p-3 border-bottom">
                            <div class="d-flex justify-content-between align-items-start">
                                <a href="#" class="text-decoration-none fw-500" style="color: var(--primary-blue); font-size: 0.95rem;">Pengumuman Akun BNI Wonder KIP-K</a>
                                <span class="text-muted" style="font-size: 0.75rem;">30/01/2025</span>
                            </div>
                            <p class="small text-muted mb-0 mt-1">Undangan aktivasi rekening bagi mahasiswa penerima KIP-K...</p>
                        </div>

                        <div class="p-3 border-bottom">
                            <div class="d-flex justify-content-between align-items-start">
                                <a href="#" class="text-decoration-none fw-500" style="color:#1e60aa; font-size: 0.95rem;">[PENTING!!!!!] Pengumuman Penetapan Mahasiswa Penerima Beasiswa KIP-K Tahap I dan II Tahun 2024</a>
                                <span class="text-muted" style="font-size: 0.75rem;">30/01/2025</span>
                            </div>
                            <p class="small text-muted mb-0 mt-1">Bismillah. Kepada Mahasiswa/i ITH yang namanya telah ditetapkan sebagai penerima PIP KIP Kuliah (SK terlampir), diharapkan untuk bisa hadir pada Hari...</p>
                        </div>

                        <div class="p-3 border-bottom">
                            <div class="d-flex justify-content-between align-items-start">
                                <a href="#" class="text-decoration-none fw-500" style="color:#1e60aa; font-size: 0.95rem;">[Penting] Penggunaan Email Institusi untuk Mahasiswa</a>
                                <span class="text-muted" style="font-size: 0.75rem;">30/01/2025</span>
                            </div>
                            <p class="small text-muted mb-0 mt-1">Bismillah. Mulai semester Ganjil 2023/2024, mahasiswa aktif Institut Teknologi BJ Habibie dapat menggunakan alamat email dengan alamat...</p>
                        </div>

                        <div class="p-3 border-bottom">
                            <div class="d-flex justify-content-between align-items-start">
                                <a href="#" class="text-decoration-none fw-500" style="color:#1e60aa; font-size: 0.95rem;">Tanggal Penting Semester Genap T.A. 2024-2025</a>
                                <span class="text-muted" style="font-size: 0.75rem;">14/09/2025</span>
                            </div>
                            <p class="small text-muted mb-0 mt-1">- Pembayaran UKT: 13 Januari - 13 Februari 2025 - Pengisian KRS secara Online: 20 Januari - 13 Februari 2025 - Perkuliahan Perdana: 17 Februari 2025 - Perubahan...</p>
                        </div>

                        <div class="p-3 text-center">
                            <a href="#" class="text-decoration-none small" style="color: var(--primary-blue);"><i class="fa fa-chevron-down me-1"></i> Lihat semua pengumuman</a>
                        </div>
                    </div>
                </div>

                <div class="card-custom mt-4">
                    <div class="card-header-custom text-uppercase">
                        Kalender Akademik TA 2024/2025 Genap
                    </div>
                    <div class="card-body p-4">
                        <div class="row align-items-start">
                            <div class="col-4">
                                <h6 class="fw-bold mb-0" style="color: #455a64; font-size: 1rem; line-height: 1.4;">
                                    12 Januari 2026 - 19 Juni 2026
                                </h6>
                            </div>
                            
                            <div class="col-8">
                                <ul class="list-unstyled mb-0" style="font-size: 0.85rem; color: #6c757d; line-height: 1.6;">
                                    <li class="mb-1">- Pembayaran UKT: 12 Januari - 13 Februari 2026</li>
                                    <li class="mb-1">- Pengisian KRS Online: 19 Januari - 13 Februari 2026</li>
                                    <li class="mb-1">- Perkuliahan Perdana: 16 Februari 2026</li>
                                    <li class="mb-1">- Perubahan KRS Online: 16 - 27 Februari 2026</li>
                                    <li>- Akhir Perkuliahan: 19 Juni 2026</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div> </div> </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="dashboard.js"></script>
</body>
</html>