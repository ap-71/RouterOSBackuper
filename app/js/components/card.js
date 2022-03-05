import {get_file} from "../action/getFile.js";
import {add_device} from "../action/addDevice.js";
import {del_device} from "../action/delDevice.js";

export function create_card(data, actions=false){
    // let container = document.createElement('div')
    // let elements = Object.entries(data.info)
    // let sub_elements = null
    // container.className = "card mb-2"
    // container.id = `device_id-${data.id}`
    // container.append(gen_body(data, elements.map(([k, v], i)=> {
    //         let count_elements = elements.length
    //         k = k.replace('_', ' ')
    //         if (v instanceof Object) {
    //             sub_elements = Object.entries(v).map(([k_, v_], i) => !k_.includes('id') ? [k_, v_] : undefined)
    //                 .filter((v) => { return v !== undefined})
    //             count_elements += sub_elements.length
    //             return sub_elements.map(([k_, v_]) => {
    //                 let a = document.createElement('a')
    //                 a.style.cursor = 'pointer'
    //                 a.style.color = 'blue'
    //                 a.innerText = 'скачать'
    //                 a.onclick = () => get_file(String(v_))
    //                 console.log(v_)
    //                 return gen_card(count_elements, k_, k_ === 'path_to_file' ? a : v_)
    //             })
    //         }
    //         return gen_card(count_elements, k, v)
    //     }), actions))
    // return container
    return gen_card_(data, actions)
}

let gen_img = (data, actions=false) => {
    let img = data.img
    let alt_name = data.info.model
    let div = document.createElement('div')

    let img_ = document.createElement('img')


    img_.className = "img rounded-start"
    img_.style.width = '75px'
    img_.style.marginLeft = '20px'
    img_.style.marginTop = '20px'
    img_.src = img
    img_.alt = alt_name !== undefined ? alt_name : ''
    if(actions){
        div.className = "col-md-2"
        let div_row1 = document.createElement('div')
        let div_row2 = document.createElement('div')
        let div_actions = document.createElement('div')
        let button_add = document.createElement('button')
        let button_del = document.createElement('button')
        let div_img= document.createElement('div')
        let div_action = document.createElement('div')
        div_actions.className = 'col'
        div_row1.className = 'row'
        div_row2.className = 'row mx-auto pt-3'
        div_img.className = 'col-md-12'
        button_add.type = button_del.type = 'button'
        button_add.className = 'btn btn-success'
        button_del.className = 'btn btn-danger'
        button_add.style.width = button_del.style.width = '38px'
        button_del.innerText = '-'
        button_add.innerText = '+'
        button_add.onclick = () => {
            add_device(data.id)
        }
        button_del.onclick = () => {
            del_device(data.id)
        }
        div_actions.append(button_add)
        div_actions.append(button_del)
        div_row2.append(div_actions)
        div_row1.append(div_img)
        div_row2.append(div_action)
        div.append(div_row1)
        div.append(div_row2)
    } else {
        div.className = "col-md-1 pl-5"
        div.append(img_)
    }

    return div
}
let gen_body = (data, cards, actions=false) => {
    let div = document.createElement('div')
    let div1 = document.createElement('div')
    let div2 = document.createElement('div')

    div.className = "row g-5"
    div1.className = actions ? "col-md-10"  : "col-md-11"
    div2.className = "card-body row"
    div.append(gen_img(data, actions))
    div.append(div1)
    div1.append(div2)
    cards.forEach((v) => {
        if (v instanceof Array) {
            v.forEach((v_) => {
                div2.append(v_)
            })
        } else {
            div2.append(v)
        }
    })
    return div
}
let gen_card = (count, k, v) => {
    let div_card = document.createElement('div')
    let div_card_h6 = document.createElement('h6')
    div_card.className = `card-text col-${Math.floor(12/ count)}`
    // div_card.className = `card-text col-${2}`
    div_card_h6.innerHTML = k[0].toUpperCase() + k.slice(1)
    if (typeof v === 'string' && v.search(/[0-9]+\-[0-9]+\-[0-9]+ [0-9]+\:[0-9]+\:[0-9]+/g) !== -1 ){
        let date = new Date(v)
        v = `${date.toLocaleDateString()} ${date.toLocaleTimeString()}`
    }
    div_card.append(div_card_h6)
    div_card.append(v)


    return div_card
}

let gen_card_ = (data, actions= false) => {
    const template_card = document.getElementById("card");
    const template_actions = document.getElementById("actions");
    let card = template_card.content.firstElementChild.cloneNode(true)
    let actions_ = template_actions.content.firstElementChild.cloneNode(true)
    card.querySelector('.img-fluid').src = data.img === undefined ? './img/1100AHx4_dude.png' : data.img
    card.querySelector('.card__device__text').innerText = data.info.ip
    card.querySelector('.card__status_value').innerText = data.info.status ? 'online': 'offline'
    try {
        card.querySelector('.card__date_text').innerText = data.info.backup.last_backup
            .replaceAll('-', '.')
            .split(' ')[0]
        card.querySelector('.card__file_href').onclick = () => get_file(String(data.info.backup.path_to_file))
        card.querySelector('.card__file_href').innerHTML = 'скачать'
    } catch {
        console.log(actions)
        if(!actions){
            card.querySelector('.card__date_text').innerText = 'None'
            card.querySelector('.card__file_href').innerText = 'None'
            card.querySelector('.card__file_href').href = '#'
        }
        else {
            card.querySelector('.row__card__date').style.display =
                card.querySelector('.row__card__status').style.display=
                card.querySelector('.row__card__file').style.display = 'none'
            card.querySelector('.templates__card__content').append(actions_)
            card.querySelector('.card__action_del').onclick = () => {
                del_device(data.id)
            }
            card.querySelector('.card__action_add').onclick = () => {
                add_device(data.id)
            }
        }

    }

    return card
}