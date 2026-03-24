// import { getObjects, createObject, deleteObject, getObject, setValue, getValue, updateValue, deleteValue } from '../commons/object.js'
import * as object from '../commons/object.js';

//회원 주소록 생성
//홍길동, 스미스, 이순신, 김유신, 제임스
let addressBook = object.getObjects(); //objects 주소 공유

//1.객체 생성
object.createObject('hong');

//2. hong 주소 가져오기
let hong = object.getObject('hong');

//3. name, age, address 추가
object.setValue(hong, 'name', '홍길동');
object.setValue(hong, 'age', '30');
object.setValue(hong, 'address', '서울시');

//4.name, age, address 출력
console.log(object.getValue(hong, 'name'));
console.log(object.getValue(hong, 'age'));
console.log(object.getValue(hong, 'address'));

//5. 주소를 '부산시' 업데이트
object.updateValue(hong, 'address', '부산시');

//6.주소를 삭제
object.deleteValue(hong, 'address');

//7.객체를 삭제
object.deleteObject('hong');

console.log(addressBook);


