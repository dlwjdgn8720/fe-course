/**
 * 성적관리 프로그램
 */

function createobject() {
    return new Array();
}

function createScore(scoreList, name, kor, eng, math) {
    scoreList.push({name, kor, eng, math });
}

function searchName(scoreList,name) {
    return scoreList.find(score => score.name === name);
}

function searchScore(scoreList,subject,score){
    return scoreList.filter(item => (item[subject] >= score));
}

function updateScore(scoreList,subject,score){
    return scoreList.map(item => (item[subject] < 100) ? {...item, [subject] : item[subject] + score} : item);
}
 
let scoreList = createobject();
createScore(scoreList,'홍길동', 100, 100, 100);
createScore(scoreList,'스미스', 80, 50, 80);
createScore(scoreList,'이순신', 100, 60, 90);
createScore(scoreList,'제임스', 90, 70, 90);
console.log(scoreList.length);
console.log(scoreList);

//제임스 검색
console.log('searchName ::', searchName(scoreList,'제임스'));

//국어점수가 90점 이상인 학생 검색
console.log('searchScore ::', searchScore(scoreList,'kor',90));

//영어점수가 70점 이상인 학생 검색
console.log('searchScore ::', searchScore(scoreList,'eng',70));

//모든 학생의 수학점수에 +5점
console.log('updateScore ::', updateScore(scoreList,'math', 5)); 

