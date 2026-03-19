/**
 * 논리 연산자 : &&(and), ||(or)
 * 
 * 논리식1(boolean) && 논리식2(boolean) = 결과값(boolean)
 * 논리식1(boolean) || 논리식2(boolean) = 결과값(boolean)
 * - && 연산자는 논리식1,2가 모두 true인 경우에만 true 값을 출력
 * - || 연산자는 논리식 중 1개만 true여도 true 값을 출력
 */

let a = 3;
let b = 7;

console.log('---- && : AND ----->');
console.log((a < b) && (a > b));   // true && false = false
console.log((a < b) && (a == b));  // true && false = false
console.log((a == b) && (a < b));  // false && true = false 🔅shortcut
console.log((a < b) && (a !== b)); // true && true = true

console.log('---- || : OR ----->');
console.log((a == b) || (a > b));   // false || false = false 
console.log((a < b) || (a == b));   // true || false = true 🔅shortcut
console.log((a == b) || (a < b));   // false || true = true
console.log((a < b) || (a !== b));  // true || true = true 🔅shortcut

//🔅 로그인 처리 시 (패스워드 && 아이디) 비교 로직을 구현
let userId = 'test';
let userPass = '1234';

if(userPass == '1234' && userId == 'test'){
    //결과
}