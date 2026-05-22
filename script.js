const togglePassword = document.querySelector('#togglePassword');
const passwordField = document.querySelector('#passwordField');

if (togglePassword && passwordField) {
    togglePassword.addEventListener('click', function () {
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        
        passwordField.setAttribute('type', type);
        
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
}