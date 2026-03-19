/**
 * 단항 연산자 : ++, -- , ! , !!
 */

let a = 10;
console.log(++a); //전위, 11
console.log(a++); //후위, 출력되는 a=11, 메모리의 a=12
console.log(a); //현재 메모리 값 출력
console.log();
let b = 10;
console.log(b--);//10, 메모리 b=9
console.log(--b);//8
console.log(b); //8
console.log(++b); //9
console.log(b++); //출력:9,메모리 b=10
console.log(b); //10
console.log();

let flag = true;
console.log(flag); // true
console.log(!flag); // false
console.log(!!flag); // true





