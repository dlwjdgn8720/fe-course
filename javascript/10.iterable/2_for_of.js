/**
 * 배열의 요소를 치환하는 함수 생성
 * - for(const(let) 변수 of 순회객체}{실행문;} 
 */

/**배열의 요소를 치환하는 함수 생성 : for.. of */
function replace(array, oldItem, newItem) {
    //array(=fruits)의 복사본 객체, shallow copy
    let arrayCopy = Array.from(array);
    let idx = 0;
    //fruits 배열 객체의 요소를 치환
    for (const item of arrayCopy) {
        if (item === oldItem) {
            arrayCopy.splice(idx, 1, newItem);//배열객체.splice(item idx, count, newItem)
        }
        idx++;
    }
    return arrayCopy;
}

//forEach
function replace1(array, oldItem, newItem) {
    //array(=fruits)의 복사본 객체, shallow copy
    let arrayCopy = Array.from(array);

    //fruits 배열 객체의 요소를 치환
    arrayCopy.forEach((item, idx) => {
        if (item === oldItem) arrayCopy.splice(idx, 1, newItem);
    });
    return arrayCopy;
}

//map - 새로운 배열객체 반환
function replace2(array, oldItem, newItem) {
    return array.map(item => (item === oldItem) ? item = newItem : item);
}

//replaceObj
function replaceObj(array, oldItem, newItem) {
    let arrayCopy = Array.from(array);
    let idx = 0;
    for (const item of arrayCopy) {
        if (item.emoji == oldItem) {
            arrayCopy.splice(idx, 1, { name: item.name, emoji: newItem });
        }
        idx++;
    }
    return arrayCopy;
}

let fruits = ['🍊', '🍋', '🍎', '🍓', '🍏'];
let fruitsObj = [
    { name: 'orange', emoji: '🍊' },
    { name: 'lemon', emoji: '🍋' },
];
let obj1 = replace(fruits, '🍎', '🍏'); //for.. of
let obj1_1 = replace1(fruits, '🍎', '🍏'); //forEach
let obj1_2 = replace2(fruits, '🍎', '🍏'); //map
let obj2 = replaceObj(fruitsObj, '🍋', '🍏');

console.log(fruits);
console.log(obj1);
console.log(obj1_1);
console.log(obj1_2);
console.log(fruitsObj);
console.log(obj2);

