import {
    setValue, getValue, updateValue, deleteValue
} from '../commons/object.js'

const hong = {
    name: '홍길동',
    age: 30
}

const apple = {
    name: 'apple'
}
console.log(hong);
console.log(apple);

//1. property,value 추가
setValue(hong, 'address', '서울시 강남구');
setValue(hong, 'job', 'SW 엔지니어');
setValue(apple, 'emoji', '🍎');
console.log();
console.log(hong);
console.log(apple);

//2. property, value 가져오기
let hong_name = getValue(hong, 'name');
console.log(getValue(hong, 'name'));
console.log(hong_name);

//3. property 값 업데이트
updateValue(apple, 'emoji', '🍏');
console.log(getValue(apple, 'emoji'));

//4. property 값 삭제
deleteValue(hong, 'address');
deleteValue(hong, 'job');
deleteValue(apple, 'name');
console.log(hong);
console.log(apple);



