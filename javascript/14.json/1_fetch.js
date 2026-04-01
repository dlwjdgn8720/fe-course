let key = `d34a025853d07307e0e54a58bb59ee0c`;
let targetDt = `20260331`;
const data_url = `https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=${key}&targetDt=${targetDt}`;


const getJson = async() => {
    let response = await fetch(data_url);
    return response.json();
}

const show = async() => {
    //1.JSON 데이터 가져오기
    let kobis = await getJson();
    console.log(kobis);
    
    //2.출력 데이터 생성 : DHTML
    let output = `
        <h1>${kobis.boxOfficeResult.boxofficeType}</h1>
        <h3>일자 : ${kobis.boxOfficeResult.showRange}</h3>
        <table border = 1>
        <tr>
            <th>순위</th>
            <th>영화제목</th>
            <th>개봉일</th>
            <th>당일 관객수</th>
            <th>누적 관객수</th>
            <th>누적 매출액</th>
        </tr>
            ${kobis.boxOfficeResult.dailyBoxOfficeList.map((movie) => 
                `<tr>
                <td>${movie.rank}</td>
                <td>${movie.movieNm}</td>
                <td>${movie.openDt}</td>
                <td>${movie.audiCnt}</td>
                <td>${movie.audiAcc}</td>
                <td>${movie.salesAcc}</td>          
                </tr>`                
            ).join("")}
            </table>`

    //3.출력
    document.querySelector('#content').innerHTML = output;
}

window.addEventListener('DOMContentLoaded', () => {
    show();
})
