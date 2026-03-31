//최초 호출되는 이벤트 함수: window.addEventListener()
//DOM객체가 생성된 뒤에 해당 함수 호출
window.addEventListener('DOMContentLoaded', () => {

    show();
});
//getJson 함수 생성
const data_url = 'http://127.0.0.1:5500/javascript/13.asyncronuos/fruits.json';

const getJson = async () => {
    let response = await fetch(data_url);
    return response.json(); //Promise타입으로 리턴
}

//show 함수 생성
const show = async () => {
    let jsonData = await getJson();
    console.log('jsonData =>', jsonData, typeof jsonData);

    let output = `
        <h2>${jsonData.title}</h2>
        <table border=1>
            <tr>
                <th>NO</th>
                <th>NAME</th>
                <th>COLOR</th>
                <th>EMOJI</th>
            </tr>
                ${jsonData.list.map((fruit,idx) => //자바스크립트 코드
                    `<tr>
                        <td>${idx + 1}</td>
                        <td>${fruit.name}</td>
                        <td>${fruit.color}</td>
                        <td>${fruit.emoji}</td>
                    </tr>`).join("")
                }
        </table>`;

    document.querySelector('#content').innerHTML = output;
}
