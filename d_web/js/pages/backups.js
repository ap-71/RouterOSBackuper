import {change_address_line} from "../router.js";
import {get_device} from "../action/getDevice.js";
import {create_card} from "../components/card.js";

export let backups = () => {
    get_device(-1,create_card)
    // $('.app__content').empty()
    // let p = document.createElement('p')
    // p.innerText = 'Информация о резервных копиях'
    // $('.app__content').append(p)
}