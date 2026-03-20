/**
 * deep copy(깊은 복사) - structureClone, JSON.parse(JSON.stringify())
 * 객체의 깊은 복사는 복사본의 속성이 복사본이 만들어진 원본 객체와
 * 같은 참조(메모리 내의 같은 값을 가리킴)를 공유하지 않은 복사입니다.
 * 따라서 원본이나 복사본을 변경할 때, 다른 객체가 변경되지 않는 것을 보장할 수 있습니다.
 */

let fruits = [
    {name : 'apple', emoji: '🍎'},
    {name : 'orange', emoji: '🍊'},
    {name : 'apple', emoji: '🍋'},
]
let fruitsCopy = structuredClone(fruits);
console.log(fruits,typeof fruits);
console.log(fruitsCopy,typeof fruitsCopy);

fruits[0].emoji = '🍏'; //fruits에만 적용
fruitsCopy[2].name = '레몬'; //fruitsCopy에만 적용
console.log();
console.log(fruits,typeof fruits);
console.log(fruitsCopy,typeof fruitsCopy);

let fruitsCopy2 = JSON.parse(JSON.stringify(fruits));
console.log(`----------------->`);

console.log(fruits,typeof fruits);
console.log(fruitsCopy2, typeof fruitsCopy2);

fruitsCopy2[1].name = '오렌지'; //fruitsCopy2에만 적용
console.log(fruits,typeof fruits);
console.log(fruitsCopy2,typeof fruitsCopy2);




