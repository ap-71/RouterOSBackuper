import { config } from "../../configuration.js"

export let get_device = (id=null, action) => {
    $('.app__content').innerHTML = ''
    let xhr = new XMLHttpRequest()
    // xhr.withCredentials = true
    xhr.open('GET', new URL(id === null | id === -1 ? `http://${config.server_api.ip}:${config.server_api.port}/api/get` :`http://${config.server_api.ip}:${config.server_api.port}/api/get?id=` + String(id)), true)
    xhr.responseType = 'json'
    xhr.setRequestHeader('Access-Control-Allow-Origin', `http://${config.server_api.ip}:${config.server_api.port}`)
        // xhr.setRequestHeader('Referer', 'http://127.0.0.1:5000/')
    xhr.send()
    xhr.onload = function() {
      if (xhr.status === 200) {
        $('.app__content').empty()
          xhr.response.data.forEach((data) => {
            $('.app__content').append(action(data))
          })
      }
    }
}