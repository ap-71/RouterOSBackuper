import {change_address_line} from "../router.js";

export let tunnels = () => {
    $('.app__content').empty()
    let p = document.createElement('p')
    p.innerText = 'Информация о туннелях'
    $('.app__content').append(p)
}