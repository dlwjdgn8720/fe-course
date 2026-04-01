/**
 * String 문자열 클래스
 * - character를 하나씩 배열에 저장
 * - split(), slice(), chatAt(), toUpperCase()...
 */

let str = '홍길동';
let strObj = new String('홍길동');

console.log(str, typeof str);
console.log(strObj, typeof strObj);
console.log(str == strObj);
console.log(str === strObj);

let str2 = 'Hello~ JavaScript!!';
console.log('str2.length = ',str2.length);
console.log('str2.charAt(인덱스) = ',str2.charAt(7));
console.log('str2.toUpperCase() = ',str2.toUpperCase());
console.log('str2.toLowerCase() = ',str2.toLowerCase());
console.log(str2 + ', React Programming!!');
console.log(str2.concat(', React Programming!!'));

let str3 = `         Hello~ React Programming!!             `;
console.log(str3.length);
console.log(str3.trim(), str3.trim().length);
console.log(str3.trimEnd(), str3.trimEnd().length);
console.log(str3.trimStart(), str3.trimStart().length);

//문자열을 구분자를 이용하여 배열객체로 생성
let fruits = 'apple,lemon,orange';
let fruits2 = 'apple lemon orange';
let fruitList = fruits.split(',');//JSON 객체 가져올때 많이 씀
let fruitList2 = fruits2.split(' ');

console.log(fruits, typeof fruits);
console.log(fruitList, typeof fruitList);
console.log(fruitList2, typeof fruitList2);

//문자열 추출 - subString(), slice()
let str4 = 'Hello~ JavaScript!!';
console.log(str4.substring(0,5)); // 0 ~ 4번지 출력
console.log(str4.slice(0,5)); // 0 ~ 4번지 출력







