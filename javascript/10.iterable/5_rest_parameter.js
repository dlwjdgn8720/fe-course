/**
 * Rest Parameter(나머지 인자) : 파라미터 인자를 배열로 저장함
 * - 함수의 매개변수에 정의함
 * - function 함수명(...Rest Parameter) {}
 * - const 함수명(...Rest Parameter) => {}
 */

function add(a, b, ...numbers) {
    //let sum = numbers.reduce((acc, cur) => acc + cur);
    //console.log(a, b, numbers,sum);
    return a + b + numbers.reduce((acc, cur) => acc + cur);
}


const fadd = (f1, ...fruits) => { //...fruits: rest파라미터
    console.log(f1, ...fruits);
    //return 새로운 객체;
    // return {f1, ...fruits};
    return [f1, ...fruits];
}

let result1 = add(1, 2, 3, 4, 5);
let result2 = add(1, 2, 3, 4, 5, 3, 5, 5, 3, 2);
console.log(result1, result2);

let fruits = ['🍏', '🍎', '🍓'];
let fobj = fadd('🍋', ...fruits);//...fruits : spread 연산자(전개 구문)
//fadd('🍋','🍏', '🍎', '🍓');
console.log('fobj =', fobj);


