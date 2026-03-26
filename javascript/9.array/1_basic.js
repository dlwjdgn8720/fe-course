/**
 * 배열(Array)
 * - 동일한 데이터 타입을 가진 요소를 물리적인 공간에 연속적으로 저장
 * - 배열은 참조 데이터 타입이며, 힙에 생성
 * - [], Array 클래스를 이용하여 객체 생성
 * - 배열 객체의 요소는 기본형, 참조형 모두 저장 가능
 */

let array1 = [10];
let array2 = new Array(2);
let array3 = new Array(5);

console.log(array1.length, array2.length, array3.length);

let names = ['홍길동', '스미스', '이순신'];
let friuts = ['🍋','🍎','🍊','🍏'];
console.log(names.length,friuts.length);

//names 배열에 요소 추가
names[3] = '제임스'; //에러발생 ❌, 새로운 객체를 생성하고 저장
console.log(names);



