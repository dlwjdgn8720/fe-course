/**
 * Math 클래스 - 모든 메소드와 속성이 static으로 정의되어 있음.
 * - 호출 : Math.메소드명(), Math.속성
 */

let a = 1234.57483;

console.log(`Math.abs(value) :: ${Math.abs(a)}`);// 절댓값
console.log(`Math.floor(value) :: ${Math.floor(a)}`); //소수점 절삭
console.log(`Math.trunc(value) :: ${Math.trunc(a)}`); //소수점 절삭
console.log(`Math.round(value) :: ${Math.round(a)}`); //소수점 첫째자리에서 반올림
console.log(`Number.toFixed() :: ${a.toFixed(2)}`); //소수점 반올림(자릿수 저장)
console.log(`Max.max(value) :: ${Math.max(1, 2, 3, 4, 5)}`); //5
console.log(`Max.max(value) :: ${Math.min(1, 2, 3, 4, 5)}`); //1
console.log(`Max.random() :: ${Math.random()}`); // 0 ~ 1 사이의 값이 임의로 출력

// 1 ~ 100 사이의 숫자를 임의로 생성하는 함수 정의
const randNumber = () => Math.trunc(Math.random() * 100 + 1) //{ return } 생략

//1 ~ 100 사이의 숫자를 임의로 생성
let number = Math.trunc(Math.random() * 100 + 1);
console.log('number = ', number);
console.log('number = ', randNumber());





