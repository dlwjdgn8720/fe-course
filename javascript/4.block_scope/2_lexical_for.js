// let j = 200;

//1 ~ 5까지 출력
for(let i = 1; i < 6; i++){
    console.log(i,j); //j에서 에러발생 ?? 이유를 정리!!
    //스콥 단위 lexical 단위이므로 전역변수까지 j가 없어서 에러 발생
    for(let j = 10; j < 60; j += 10){
        console.log(i);       
    }
}

//fruits 배열 요소 출력
let fruits= ['🍏','🍋','🍎'];
for(let i = 0; i < fruits.length; i++){
    console.log(fruits[i]);
}