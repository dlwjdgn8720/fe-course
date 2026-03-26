/**
 * Date 클래스 - 날짜 형식을 지원하는 클래스
 * - new Date() 클래스 생성 후, 생성된 객체의 메소드를 호출
 * - getFullYear(),getMonth(), getDay()...
 */

let date = new Date();
let date2 = Date.now();
console.log(date);
console.log(date2);
let year = date.getFullYear(); //년도
let month = date.getMonth() + 1; //월
let day = date.getDate();        //일, getDay() - 요일

console.log(year);
console.log(month);
console.log(day);
console.log(`오늘은 ${year}년 ${month}월 ${day}일 입니다.`);
console.log(date.toLocaleDateString('ko-KR'));//한국
console.log(date.toLocaleDateString('en-US'));//미국



