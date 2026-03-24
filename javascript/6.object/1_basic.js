/**
 * object :
 * - {},다양한 데이터 타입을 저장
 * - object literal,{propery(key) : value}
 * - JSON(JavaScript Object Notation)에서는 property(key)를 반드시 문자열로 정의
 */

//학생의 성적을 관리하는 객체 생성, object Literal
const hong = {
    name : '홍길동',
    age : 30
}

console.log(hong);
console.log(hong.name);
console.log(hong.age);

//1.프로퍼티를 통한 값 수정
hong.name = '홍길순';
hong.age = 25;
console.log(hong);
console.log(`hong = ${hong}`);

//2.프로퍼티를 통한 값 삭제
delete hong.name;
delete hong.age;
console.log();
console.log(hong);




