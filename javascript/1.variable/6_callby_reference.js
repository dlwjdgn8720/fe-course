/**
 * call by reference : 데이터 중복 시 주소 복제
 * - 값이 heap에 저장되어 있는 경우
 */

let name1 = '홍길동';
let name2 = name1; //call by reference
let name3 = new String('홍길동');
let name4 = name3; //call by reference

console.log(name1,typeof name2);
console.log(name2,typeof name2);
console.log(name3,typeof name3);
console.log(name4,typeof name4);
console.log(name1 === name2);
console.log(name1 === name3);
console.log(name3 === name4);

let nlist = [1,2,3,4,5];
let nlist2 = nlist; // call by reference

let person = {
    name: '홍길동',
    age: 30
}
let person2 = person; // call by reference

console.log(nlist,typeof nlist);
console.log(nlist2,typeof nlist2);
console.log(nlist == nlist2); // 값만 비교
console.log(nlist === nlist2); // nlist, nlist2의 객체주소와 타입 동일여부 비교
console.log(nlist[2] === nlist2[2]); //nlist[2], nlist2[2]의 값과 타입 동일여부 비교
console.log();
console.log(person,typeof person);
console.log(person2,typeof person2);
console.log(person === person2);
console.log(person.name === person2.name);

//person2의 name 값을 '이순신'으로 변경
person2.name = '이순신';
person2.age = 40;
console.log(person.name,person2.name);
console.log(person.age,person2.age);








