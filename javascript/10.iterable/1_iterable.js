/**
 * Iterable(순회) Object : Iteration Protocol을 준수하는 객체
 * - for.. of 구문
 * - String, Array, Set, Map
 * - ...(Spread Operator: 스프레드 연산자, 전개구문) : 블록안에서 객체의 데이터를 전개함(펼쳐놓음)
 * - ...(Rest Parameter) : 매개변수 모든값을 배열로 저장
 * - ...(Destructring Object: 구조분해 할당) : 객체를 분해한 후 변수에 할당
 */

//String 객체 생성 후 for..of 구문 사용
let strList = new String('Hello ~ JavaScript!!');
for (let str of strList) {
    console.log(str);
}

//Number 객체 생성 후 for.. of 구문 사용(❌)
//Number클래스는 Iteration Protocol을 준수하지 않음
// let numbers = new Number(12345);
// console.clear();
// for(let number of numbers){
//     console.log(number);
// }

//Array 객체 생성 후 for..of 사용
console.clear();
let numbers = [1, 2, 3, 4, 5];
for (let number of numbers) {
    console.log(number);
}
console.log();

//forEach()
numbers.forEach((number) => console.log(`number= ${number}`));
//find() - 3, findIndeX() - 3의 인덱스 주소
let findNumber = numbers.find(number => number === 3);
let findIndex = numbers.findIndex(number => number === 3);
console.log();
console.log(`findNumber = ${findNumber}`);
console.log(`findIndex = ${findIndex}`);

//filter() - 짝수,홀수 반환
//True일때만 return을 한다.
let evenNumbers = numbers.filter(number => !(number % 2)); //0 : False[2,4]
let oddNumbers = numbers.filter(number => number % 2); //1: True [1,3,5]
console.log();
console.log(evenNumbers);
console.log(oddNumbers);
console.log(`evenNumbers = ${evenNumbers}`);

//map() - 모든 요소에 + 10
let addNumbers = numbers.map(number => number + 10);
console.log();
console.log(addNumbers);
console.log(`addNumbers = ${addNumbers}`);



