/**
 * Map : key, value를 한쌍의 데이터로 가지는 객체
 * - set(key,value) : 데이터 추가
 * - get(key) : 데이터 반환
 * - has(key) : 데이터 체크
 * - delete(key) : 데이터 삭제
 */

let fruitsMap = new Map();
fruitsMap.set('lemon', '🍋');
fruitsMap.set('apple', '🍎');
fruitsMap.set('orange', '🍊');
console.log(fruitsMap, typeof fruitsMap);
console.log(fruitsMap.get('lemon'));
console.log(fruitsMap.get('orange'));
console.log(fruitsMap.get('apple'));

if (fruitsMap.has('apple')) {
    console.log(fruitsMap.get('apple'));
} else {
    console.log('준비중 입니다.');
}

//true : 🍎, false : 🍏 이모지 값으로 반환
let emoji = (!fruitsMap.has('apple')) ? '🍎' : '🍏';
console.log(emoji);

//업데이트 시 set()
//데이터❌ : 추가, 데이터 ⭕: 업데이트
fruitsMap.set('apple', '🍏');
console.clear();
console.log(fruitsMap);

//삭제 delete(key)
//데이터❌: 추가, 데이터 ⭕: 삭제
//오렌지 삭제
if(fruitsMap.has('orange')){
    fruitsMap.delete('orange');
}else{
    fruitsMap.set('orange');
}

console.log(fruitsMap);

let fruitsArray = fruitsMap.entries();
console.log(fruitsArray);








