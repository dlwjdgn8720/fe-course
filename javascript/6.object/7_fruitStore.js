import * as store from '../commons/object.js' 

//1. store 생성
let fstore = store.getObjects();

// 2. 과일 생성
let apple = new store.Fruit('apple','🍎');
let lemon = new store.Fruit('lemmon','🍋');

// 3. store 게시
store.setObject('apple',apple);
store.setObject('lemon',lemon);

//4. store 삭제
store.deleteObject('apple');
store.deleteObject('lemon');

console.log(fstore);
