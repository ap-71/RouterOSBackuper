import {get_discovery_device} from "./getDiscoveryDevice.js";
import {create_card} from "../components/card.js";

export let add_device = (id) =>{
    // $('.app__content').innerHTML = ''
    let xhr = new XMLHttpRequest()
    // xhr.withCredentials = true
    // http://127.0.0.1:5000/api/add?ip=172.16.255.1
    xhr.open('GET', new URL(`http://127.0.0.1:5000/api/add?id=${id}`), true)
    xhr.responseType = 'json'
    xhr.setRequestHeader('Access-Control-Allow-Origin', 'http://127.0.0.1:5000')
        // xhr.setRequestHeader('Referer', 'http://127.0.0.1:5000/')
    xhr.send()
    xhr.onload = function() {
        get_discovery_device(-1, create_card, true)
      // if (xhr.status === 200) {
      //   // $('.app__content').empty()
      //     xhr.response.data.forEach((data) => {
      //         console.log(data)
      //
      //       // $('.app__content').append(action(data))
      //     })
      // }
    }
}