export let get_file = (path='') => {
    let filename = path.split('/')
    filename = filename[filename.length-1]
    $('.app__content').innerHTML = ''
    let xhr = new XMLHttpRequest()
    // xhr.withCredentials = true
    xhr.open('POST', new URL('http://127.0.0.1:5000/api/get_file?path='+String(path)), true)
    xhr.responseType = 'blob'
    xhr.setRequestHeader('Access-Control-Allow-Origin', 'http://127.0.0.1:5000')
    xhr.send()
    xhr.onload = function(e) {
        if (xhr.status === 200) {
            let blob = e.currentTarget.response;
            saveBlob(blob, filename)
        }
    }
}

function saveBlob(blob, filename) {
    let a = document.createElement('a');
    a.href = window.URL.createObjectURL(blob);
    a.download = filename;
    a.dispatchEvent(new MouseEvent('click'));
}