/**
 * 비교 연산자 : >, <, >=, <=, ==(값 비교), ===(값+데이터타입 비교)
 * - 결과값은 boolean 타입
 * - 제어문의 조건 비교시 사용, if, while 등...
 */

let a = 3;
let b = 7;
console.log(a > b);
console.log(a < b);
console.log(a >= b);
console.log(a <= b);
console.log(a == b);
console.log(a === b);
console.log();

const obj1 = {name: '홍길동',age: 30} 
const obj2 = {name: '홍길동',age: '30'} 
console.log(obj1 == obj2); //obj1주소,obj2 주소가 다르므로 false
console.log(obj1 === obj2); //타입은 같으나 obj1 주소,obj2 주소가 다름 false
console.log(obj1.name == obj2.name);
console.log(obj1.name === obj2.name);
console.log(obj1.age == obj2.age);
console.log(obj1.age === obj2.age);
console.log(typeof obj1.age,typeof obj2.age);




