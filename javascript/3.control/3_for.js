/**
 * 제어문 : 반복 실행
 * - for : 반복 횟수를 알고 있는 경우
 * - while : 종료 시점을 알고 있는 경우
 * 
 * for(1️⃣초기값; 2️⃣조건절(boolean); 4️⃣증가값){
 *      3️⃣실행문;
 * }
 * - for문이 실행 순서 : 1 > 2 > 3 > 4 > [2 > 3 > 4] 반복 실행,조건이 false이면 탈출
 * - 초기값 선언시 키워드는 let으로 정의
 */

//1부터 10까지 출력
//1️⃣초기값 - for 블록에서 사용되는 변수
//2️⃣조건절(boolean) - 10보다 작거나 같을때까지 계속 반복, 결과는 true/false
//3️⃣실행문 - 2번의 조건절 결과가 true이면 실행
//4️⃣증가값 - 단항연산자(++) or 대입연산자 이용하여 값을 증가함
for(let i = 1; i <= 10; i++){
    console.log(`i = ${i}`);
}
//숫자 배열을 생성하고 내용을 출력
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
for(let i = 0; i < numbers.length; i++){
    console.log(`numbers[${i}] = ${numbers[i]}`);   
}

// 과일이 레몬이면 레몬 이모지 출력
let fruits = ['apple','orange','lemon','mango','banana'];
let emojis = ['🍎','🍊','🍋','🥭','🍌'];

for(let i = 0; i < fruits.length; i++){
    if(fruits[i] == 'lemon'){
        console.log(fruits[i],emojis[i]);
        // i = fruits.length;
        break;
    }
    // console.log(i);
}