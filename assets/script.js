const toggleBtn = document.getElementById('theme-toggle');
toggleBtn.addEventListener('click', () => {
    const currentTheme = document.body.getAttribute('data-theme');
    if (currentTheme === 'dark') {
        document.body.removeAttribute('data-theme');
        toggleBtn.textContent = '🌙 Modo Oscuro';
    } else {
        document.body.setAttribute('data-theme', 'dark');
        toggleBtn.textContent = '☀️ Modo Claro';
    }
});

function filterSkills(category) {
    const skills = document.querySelectorAll('#skills-list li');
    skills.forEach(skill => {
        if (category === 'all') {
            skill.style.display = 'list-item';
        } else if (skill.classList.contains(category)) {
            skill.style.display = 'list-item';
        } else {
            skill.style.display = 'none';
        }
    });
}

function handleContact(event) {
    event.preventDefault();
    const name = document.getElementById('name').value;
    const status = document.getElementById('form-status');
    status.style.color = 'green';
    status.textContent = `¡Gracias por tu mensaje, ${name}! Te responderé pronto.`;
    document.getElementById('contact-form').reset();
    return false;
}