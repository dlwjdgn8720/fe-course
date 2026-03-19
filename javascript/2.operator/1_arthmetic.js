/**
 * 사칙연산 : +,-,*,/,%(모듈러, 나머지연산자), **(지수연산자)
 */
let a = 10;
let b = 7;

console.log(a + b);
console.log(a - b);
console.log(a * b);
console.log(a / b);
console.log(a % b);
console.log(a ** b);

//짝수,홀수 선택 => %(moduler, 나머지연산자)
let number = 100;
let number2 = 101;

//number값이 짝수인지,홀수인지 구분 => number % 2 나머지가 0이면 짝수, 1이면 홀수
console.log(number % 2); // 짝수
console.log(number2 % 2); // 홀수

//접합연산자(+) : + 기호 앞에 문자열이 출력되는 경우
console.log(10 + 10); //20
console.log('10' + 10); //1010
console.log('합계=' + (10 + 10)); //괄호()를 이용하여 우선순위를 적용
console.log('홍길동' + '이순신'); //홍길동이순신


