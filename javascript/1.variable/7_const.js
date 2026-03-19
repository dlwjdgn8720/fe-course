/**
 *  const : 상수 선언 시 사용
 *  - 정의된 상수에 데이터 재할당 ❌
 */

const name = '홍길동'; //name 변수 선언 및 '홍길동' 할당
// name = '이순신'; //TypeError: Assignment to constant variable

console.log(name);

let name2 = '홍길동';
name2 = '이순신'; //데이터 재할당⭕
console.log(name2);

