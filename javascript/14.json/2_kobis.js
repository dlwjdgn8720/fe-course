let key = `d34a025853d07307e0e54a58bb59ee0c`;
// let targetDt = `20150101`;


const getJson = async (type, targetDt) => {
    //박스 오피스정보
    const data_url = `https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/search${type}BoxOfficeList.json?key=${key}&targetDt=${targetDt}`;
    console.log(data_url);
    let response = await fetch(data_url);
    return response.json();
}

const getMovieInfo = async (movieCd) => {
    //영화상세 API를 통해 json 객체 가져오기
    const data_url = `http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=${key}&movieCd=${movieCd}`;
    let response = await fetch(data_url);
    return response.json();
}
const handleMovieInfo = async (movieCd, rank, poster, posterObj) => {
    let info = await getMovieInfo(movieCd);
    console.log(info);
    let movieNm = info.movieInfoResult.movieInfo.movieNm;
    let director = info.movieInfoResult.movieInfo.directors[0].peopleNm;
    let actors = info.movieInfoResult.movieInfo.actors[0].peopleNm
    openModal({ movieNm, director, actors, rank, poster, posterObj });
}
/** open Modal */
const openModal = (infoObj) => {
    let modal = document.querySelector('#modal');
    let modalBody = document.querySelector('#modal-body');
    let modalClose = document.querySelector('#modal-close');
    let posters = infoObj.posterObj.split(',')

    modalClose.addEventListener('click', () => {
        modal.style.display = 'none';
        modalBody.innerHTML = '';
    });

    let output = `
        <h3>[${infoObj.rank}]${infoObj.movieNm}</h3>
        <ul>
            <li> ${posters.map(poster => `
                        <img src="${poster}" style = "width:100px">`
    ).join("")
        }
                
            </li>
            <li><label>감독 : </label>${infoObj.director}</li>
            <li><label>배우 : </label>${infoObj.actors}</li>
        </ul>
    `

    modal.style.display = 'flex';
    modalBody.innerHTML = output;
}


//poster 가져오기 : KMDB API
const searchMoviePoster = async (movieNm, openDt) => {
    const key = '59H5F0U0OFQB3R2261VM';
    let kmdb_url = `http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api`;
    kmdb_url += `/search_json2.jsp?collection=kmdb_new2&detail=Y&releaseDts=${openDt}&title=${movieNm}&ServiceKey=${key}`;
    console.log(kmdb_url);

    let response = await fetch(kmdb_url);
    let kmdb = await response.json();

    if (kmdb.Data && kmdb.Data[0] && kmdb.Data[0].Result) {
        return await kmdb.Data[0].Result[0].posters.split("|");
    } else {
        return [];
    }
}

//handleBoxOffice 함수 정의
const handleBoxOffice = async () => {
    let type = document.querySelector('#type').value;
    let sdate = document.querySelector('#sdate').value;

    if (type === 'default') {
        alert('타입을 선택해주세요');
        document.querySelector('#type').focus();
    } else if (sdate === '') {
        alert('날짜를 선택해주세요');
        document.querySelector('#sdate').focus();
    } else {
        targetDt = sdate.split("-").reduce((acc, cur) => acc + cur);
        let kobis = await getJson(type, targetDt);
        let kobisBoxOffice = kobis.boxOfficeResult;
        let kobisBoxOfficeList = null;
        let posterList = [];
        let posterObjects = [];

        if (type === 'Daily') {
            kobisBoxOfficeList = kobis.boxOfficeResult.dailyBoxOfficeList;
        } else {
            kobisBoxOfficeList = kobis.boxOfficeResult.weeklyBoxOfficeList;
        }

        for (const movie of kobisBoxOfficeList) {
            //영화제목(movieNm), 개봉일(openDt)
            let movieNm = movie.movieNm;
            let openDt = movie.openDt.split("-").reduce((acc, cur) => acc + cur);
            // console.log(movieNm, openDt);
            let posters = await searchMoviePoster(movieNm, openDt);
            // console.log(posters);
            posterObjects.push(posters);
            //posterList.push(posters);
            if (posters.length !== 0) {
                posterList.push(posters[0]);
            }
            else {
                posterList.push('');
            }
        }

        //console.log(kobis);
        console.log(posterList);


        let output = `
            <h1>${kobisBoxOffice.boxofficeType}</h1>
            <h3>${kobisBoxOffice.showRange}</h3>
        <table border = 1>
            <tr>
                <th>순위</th>
                <th>영화제목</th>
                <th>개봉일</th>
                <th>당일 관객수</th>
                <th>누적 관객수</th>
                <th>누적 매출액</th>
            </tr>

        ${kobisBoxOfficeList.map((movie, idx) =>
            `<tr>
                <td>${movie.rank}</td>
                <td>
                    <img src="${posterList[idx]}" style="width:100px">
                    <a href="#" onclick="handleMovieInfo(${movie.movieCd},${movie.rank},'${posterList[idx]}','${posterObjects[idx]}')">${movie.movieNm}</td>
                <td>${movie.openDt}</td>
                <td>${parseInt(movie.audiCnt).toLocaleString()}명</td>
                <td>${parseInt(movie.audiAcc).toLocaleString()}원</td>
                <td>${parseInt(movie.salesAcc).toLocaleString()}원</td>          
            </tr>`
        ).join("")}
        </table>`;
        document.querySelector('#content').innerHTML = output
    }
}



