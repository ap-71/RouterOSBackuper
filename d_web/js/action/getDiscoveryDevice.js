import { config } from "../../configuration.js"

export let get_discovery_device = (id=null, action, actions=false) => {
    $('.app__content').innerHTML = ''
    let xhr = new XMLHttpRequest()
    // xhr.withCredentials = true
    xhr.open('GET', new URL(id === null | id === -1 ? `http://${config.server_api.ip}:${config.server_api.port}/api/get_discovery` :`http://${config.server_api.ip}:${config.server_api.port}/api/get_discovery?id=` + String(id)), true)
    xhr.responseType = 'json'
    xhr.setRequestHeader('Access-Control-Allow-Origin', `http://${config.server_api.ip}:${config.server_api.port}`)
    xhr.send()
    xhr.onload = function() {
        if (xhr.status === 200) {
            $('.app__content').empty()
            xhr.response.data.forEach((data) => {
                if (data.info.status) {
                    data.info.status = 'online'
                    $('.app__content').append(action(data, actions))
                }
          })
      }
    }
}