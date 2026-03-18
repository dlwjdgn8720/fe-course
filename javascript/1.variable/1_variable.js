/**
 * ES6 기준의 문법형식 적용
 * 변수 : 데이터를 메모리에 저장하는 공간
 * 변수 선언하는 키워드 : var, let, const(상수)
 * - var를 사용하여 진행하는 경우, 중복된 변수가 사용될 수 있으므로 권장❌
 * - let 변수 선언, 선언한 데이터 수정 가능
 * - const 상수 선언, 선언한 데이터 수정 불가능
 * 
 * 문법 : [변수선언 키워드] 변수명 = 데이터;
 */

// let number = 100;
// number = 'hello'; // 기본 var로 들어감
// number = 200;
// console.log(number);

// const number2 = 100;
// //number2 = 'hello';
// console.log(number2);

//동기식 처리(순차적) default

//name 이라는 변수에 '홍길동' 데이터 저장
let name = '홍길동';
let name2 = '홍길동';
console.log('name=', name,',','name2=' , name2);

//number 변수에 정수 100을 저장
let number = 100;
console.log('number=',number);

// DB 연동(비동기식처리) -> async await

//flag 변수에 true값 저장
let flag = true;
console.log(flag);

//cname 변수에 상수로 '이순신' 저장
const cname = '이순신';
console.log(cname);