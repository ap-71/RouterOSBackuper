export function actions(data){
    let container = document.createElement('div')
    container.className = "card mb-3"
    container.id = `device_id-${data.id}`
    container.innerHTML = `
        <div class="row g-5">
            <div class="col-md-1"><img src="${data.img}" class="img-fluid rounded-start" alt="${data.info.model}"></div>
            <div class="col-md-11"><div class="card-body row"></div></div>
        </div>
    `
    return container
}