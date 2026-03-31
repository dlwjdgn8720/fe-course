/**
 * fetch(resource) : 데이터 파일을 호출하여 데이터를 가져오는 함수
 * - JSON(JavaScript Object Notation) 파일을 호출
 * - Web API 구조는 보통 JSON 형태임
*/

let data_url = 'http://127.0.0.1:5500/javascript/13.asyncronuos/data.json';

const getJson = () => {
    fetch(data_url)
        .then((response) => { return response.json() })
        .then((jsonData) => { console.log(jsonData) })
        .catch((error) => { console.log('error => ', error) });
}

function getJson2() {
    fetch(data_url)
        .then(response => response.json())
        .then(jsonData => console.log('jsonData => ', jsonData))
        .catch(error => console.log('error => ', error));
}

const getJson3 = async () => {
    let response = await fetch(data_url);
    return response.json();
}

async function getJson4() {
    let response = await fetch(data_url);
    return response.json();
}

async function test(){
    let jsonData1 = await getJson3();
    let jsonData2 = await getJson4();

    console.log('test', jsonData1);
    console.log('test1', jsonData2);
}

getJson();
getJson2();
test();








