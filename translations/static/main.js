const CSRF_TOKEN = document.querySelector('[name=csrfmiddlewaretoken]').value;

function show_table_for(status) {
    fetch('/translations/?status='+status).then((response) => response.json())
    .then((data) => {
        const table = document.getElementById('translations');
        table.innerHTML = '';
        data.forEach((el) => {
            const row = document.createElement("div");

            const original = document.createElement('div');
            original.innerText = 'Origin: ' + el.txt_original;
            row.appendChild(original);

            const translation = document.createElement('div');
            translation.innerText = 'Translation: ' + el.txt_translation;
            row.appendChild(translation);

            const funcs = document.createElement('div');
            el.available_actions.forEach((ac) => {
                const a = document.createElement('a');
                a.setAttribute('href', '#');
                a.setAttribute('style', 'display: block')
                a.addEventListener('click', (e) => {
                    e.preventDefault();
                    window['action__' + ac.action](el, ac);
                });
                a.innerText = ac.display;
                funcs.appendChild(a);
            })
            row.appendChild(funcs);

            table.appendChild(row);
        })
    });
}

function fetch_patch(url, data, all_good) {
    fetch(url, {
        'method': 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': CSRF_TOKEN
        },
        'body': JSON.stringify(data)
    }).then((response) => {
        if (response.ok){
            return response.json()
        }
        throw response
    })
    .then(all_good).catch(
        (err) => err.json()
    ).then((data) => {if (data) alert(data)});
}

function action__change_status(obj, data){
    fetch_patch('/translations/' + obj.id + '/', {'from_status': obj.status, 'status': data.status}, ()=>show_table_for(obj.status));
}

var current_obj;
function action__translate(obj){
    document.getElementById('translations').style.display = 'none';
    document.getElementById('translation').style.display = 'block';
    current_obj = obj
    document.getElementById('translation_txt_original').innerText = current_obj.txt_original;
    document.getElementById('translation_txt_translation').value = current_obj.txt_translation;
}

function show_translations(){
    document.getElementById('translation').style.display = 'none';
    document.getElementById('qa').style.display = 'none';
    document.getElementById('translations').style.display = 'block';
    show_table_for(current_obj.status)
}

function send_translation() {
    fetch_patch('/translations/' + current_obj.id + '/', {
        'txt_translation': document.getElementById('translation_txt_translation').value
    }, show_translations);
}

function action__qa_comment(obj){
    document.getElementById('translations').style.display = 'none';
    document.getElementById('qa').style.display = 'block';
    current_obj = obj
    document.getElementById('qa_txt_original').innerText = 'Origin: ' + current_obj.txt_original;
    document.getElementById('qa_txt_translation').innerText = 'Translation: ' + current_obj.txt_translation;
    document.getElementById('qa_qa_comment').value = current_obj.qa_comment;
}

function send_qa_comment() {
    fetch_patch('/translations/' + current_obj.id + '/', {
        'qa_comment': document.getElementById('qa_qa_comment').value
    }, show_translations);
}

show_table_for(10);