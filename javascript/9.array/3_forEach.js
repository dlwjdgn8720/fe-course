/**
 * forEach 메소드는 Iterator 심볼 객체를 상속한 객체에서 사용됨
 * - Iterator 상속 객체.forEach(callback)
 * - Array(배열).forEach()
 * - foreach(element,index,array)
 */

let numbers = [1, 2, 3, 4, 5, 6];
numbers.forEach((item, idx) => console.log(`numbers[${idx}] = ${item}`));

let fruits = new Array('🍏', '🍊', '🍎', '🍋', '🍅');
// fruits.forEach((item) => console.log(item));

// '🍋' => '🍓'로 변경, 출력
// foreach 권장
fruits.forEach((item, idx) => {
    if (item === '🍋') {
        fruits.splice(idx, 1, '🍓');
    }
});

// '🍓' => '🍋'  로 변경, 출력, 확장 for... of
console.clear();
console.log(fruits);
let idx = 0;
for(let item of fruits){
    if (item === '🍓') {
        fruits.splice(idx, 1, '🍋');
    }
    idx++;
}
console.log(fruits);
