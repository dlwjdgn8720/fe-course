/**
 * 중복된 배열 객체를 입력받아, 중복을 제거한 후 출력하는 함수 생성
 */
function filter(array) {
    return new Set(array);
}

let numbers = [1, 2, 3, 4, 5, 5, 4, 3, 2, 1];
console.log(numbers);
console.log(filter(numbers));
console.log(filter(['홍길동', '스미스', '이순신', '홍길동']));

let mySet = new Set();
mySet.add(100);
mySet.add('홍길동');

let myArray = new Array(mySet); //[100,'홍길동']
console.log(myArray);
console.log(myArray[0]);

/**
 * 구조 분해 할당
 */
const getObject1 = () => {
    return {
        name: '홍길동',
        age: 30,
        job: '개발자',
        address: '서울시'
    }
}

const getObject2 = () => {
    return [1, 2, 3, 4, 5];
}

let { name, age, job, address } = getObject1();
let [n1, n2, n3, n4, n5] = getObject2();
console.clear();
console.log(name,age,job,address);
console.log(n1, n2, n3, n4, n5);

//testList를 입력받아, 3글자 이상의 text이면 새로운 배열 생성
//함수 생성
const textFilter = (textList) =>{
    return textList.filter(text => text.length >= 3);
}

//testList를 입력받아, 3글자 이하의 text이면 새로운 배열 생성하는 함수 정의
const textFilter2 = (textList) => {
    return textList.filter(text => !(text.length >= 3));
}

let result = textFilter(['javascript','react','html','css','a','ab']);
let result2 = textFilter2(['javascript','react','html','css','a','ab']);
console.log(result);
console.log(result2);







