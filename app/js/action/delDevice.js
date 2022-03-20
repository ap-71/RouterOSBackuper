import {get_discovery_device} from "./getDiscoveryDevice.js";
import {create_card} from "../components/card.js";
import { config } from "../../configuretion.js";

export let del_device = (id) =>{
    let xhr = new XMLHttpRequest()
    xhr.open('GET', new URL(`http://${config.server_api.ip}:${config.server_api.port}/api/delete?id=${id}`), true)
    xhr.responseType = 'json'
    xhr.setRequestHeader('Access-Control-Allow-Origin', `http://${config.server_api.ip}:${config.server_api.port}`)
    xhr.send()
    xhr.onload = function() {
        get_discovery_device(-1, create_card, true)
    }
}