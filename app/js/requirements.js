let scripts = [
    '/static/js/app/menu.js',
    '/static/js/app/action/getDevice.js',
    '/static/js/app/card.js',
    '/static/js/app/pages/main.js',
    '/static/js/app/pages/backups.js',
    '/static/js/app/pages/tunnels.js',
    '/static/js/app/app.js'
]

for(let i = 0; i < scripts.length; i++) {
    let script = document.createElement('script');
    script.src = scripts[i];
    document.body.appendChild(script);
}