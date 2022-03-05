import {get_discovery_device} from "./getDiscoveryDevice.js";
import {create_card} from "../components/card.js";

export let del_device = (id) =>{
    let xhr = new XMLHttpRequest()
    xhr.open('GET', new URL(`http://127.0.0.1:5000/api/delete?id=${id}`), true)
    xhr.responseType = 'json'
    xhr.setRequestHeader('Access-Control-Allow-Origin', 'http://127.0.0.1:5000')
    xhr.send()
    xhr.onload = function() {
        get_discovery_device(-1, create_card, true)
    }
}