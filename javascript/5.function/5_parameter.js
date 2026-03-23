/**
 * 함수 호출 --> 파라미터(인자,입력되는 값) --> 함수의 변수(지역)에 자동 매핑
 * 래스트 파라미터(Rest Parameter): '...'의 기호를 파라미터에 입력(ES6부터)
 * - 래스트 파라미터로 입력되는 인자는 배열에 저장됨
 */

console.log(add(1, 2));
console.log(add(1, 2, 3));
console.log(add(1, 2, 3, 4));
console.log(add(1, 2, 3, 4, 5, 6, 7, 8, 9));

function add(...args) { //매개변수,지역변수,args -> 배열변수
    //args 배열의 합을 구하여 반환
    // let sum = 0;
    // for (let i = 0; i < args.length; i++) {
    //     sum += args[i];
    // }
    //배열.reduce() - 배열 객체의 원소가 숫자이며, 누적합을 구하는 경우!!
    let sum = args.reduce((sum, curValue) => sum + curValue);
    return sum;
}
console.log(add2('홍길동', 20, 1, 2, 3, 4, 5));
let obj = add2('홍길동', 20, 1, 2, 3, 4, 5);
console.log(obj.name);
console.log(obj.age);
console.log(obj.score);


function add2(name, age, ...args) {
    // let sum = 0;
    // for (let i = 0; i < args.length; i++) {
    //     sum += args[i];
    // }
    let sum = args.reduce((acc, cur) => acc + cur);

    return {
        name: name,
        age: age,
        score: sum
    }
}


