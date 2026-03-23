/**
 *  함수 - 기능을 구현하고 있는 자바스크립트 객체!!
 * 
 *  1.일반적인 함수 정의 - 
 *  function 함수명(파라미터){
 *      실행 코드;
 *      return 반환값;
 *  }
 * 
 *  2.화살표 함수(Arrow function) 정의
 *  const 함수명 = (파라미터) => {
 *        실행 코드;
 *        return 반환값;
 *  }
 * 
 *  3.자바스크립트 엔진에는 빌트인 함수(내장 함수)가 포함되어 있음.
 *  - parseInt(),parseDouble() ....
 * 
 *  4. 함수 호출 : 함수명(파라미터)
 */

//parseInt :: 문자열 -> 정수로 반환
let str = '100';
let str2 = '100.1234';
let num1 = parseInt(str);
let num2 = parseFloat(str2);

console.log(str, typeof str);
console.log(str2, typeof str2);
console.log(num1, typeof num1);
console.log(num2, typeof num2);


//일반 함수 선언
function func_sum(){
    console.log(`func_sum = ${10 + 20}`);
}

//화살표 함수 선언(arrow function)
//react에서 이런 형식으로 많이 씀(ES6부터)
const arrow_sum = () => {
    console.log(`arrow_sum = ${10 + 20}`);
}

//함수 호출
func_sum();
arrow_sum();


