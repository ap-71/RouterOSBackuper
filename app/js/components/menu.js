import {backups} from '../pages/backups.js';
import {main} from '../pages/main.js';
import {tunnels} from '../pages/tunnels.js';
import {discovery} from "../pages/discovery.js";
import {routes} from "../router.js";


export let menu = (class_) => {
    let pages_ = [
        ['main', 'Главная'],
        ['backups', 'Резервные копии'],
        ['tunnels', 'Туннели'],
        ['discovery', 'Обнаруженные устройства'],
        // ['test_page', 'Тестовая страница']
    ]
    let nav = document.createElement('ul')
    nav.className = 'nav flex-column'
    pages_.forEach((page_) => {
        let nav_li = document.createElement('li')
        let nav_li_a = document.createElement('a')
        nav_li.className = "nav-item"
        nav_li_a.className = "nav-link"
        nav_li_a.style.cursor = 'pointer'
        nav_li_a.onclick = () => routes(page_[0])
        nav_li_a.innerText = page_[1]
        nav_li.append(nav_li_a)
        nav.append(nav_li)
    })
    $(class_).append(nav)
}

