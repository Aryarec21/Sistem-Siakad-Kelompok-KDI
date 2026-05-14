
/**
 * User Session Data
 */
const userSession = {
    name: "USER",
    role: "Mahasiswa",
    stats: {
        labels: ['2024/2025 Ganjil', '2024/2025 Genap', '2025/2026 Ganjil', '2025/2026 Genap'],
        values: [3.4, 3.6, 3.3, 3.7]
    }
};

/**
 * Initialize Dashboard Data & GPA Chart
 */
function renderDashboard() {
    document.getElementById('userName').innerText = userSession.name;
    document.getElementById('userRole').innerText = userSession.role;

    const ctx = document.getElementById('chartIPK').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: userSession.stats.labels,
            datasets: [{
                data: userSession.stats.values,
                borderColor: '#455a64',
                backgroundColor: 'rgba(69, 90, 100, 0.05)',
                borderWidth: 2,
                pointBackgroundColor: '#fff',
                pointBorderColor: '#455a64',
                pointRadius: 4,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                y: { min: 0, max: 4, ticks: { stepSize: 0.5 } },
                x: { grid: { display: false } }
            }
        }
    });
}

// Run initializer on load
document.addEventListener('DOMContentLoaded', renderDashboard);
