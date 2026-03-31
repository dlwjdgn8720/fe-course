/**
 * callback : 함수의 인자에 입력되는 함수로직, anonymous(무기명) 함수
 * - setTimeout(callback,delay)
 */

function runDelay(callback, delay) {
    setTimeout(callback, delay);
}

console.log(`---------프로그램 시작 --------------------`);

runDelay(() => {
    console.log(`3초후에 Task Queue에 저장!`)
}, 3000); //3초후에 Task Queue 저장, 콜스택이 callback 함수 실행

runDelay(function() {
    console.log(`Task Queue에 바로 저장`);   
}); //Task Queue 바로 저장, 콜스택이 callback 함수 실행

runDelay(() => {
    console.log(`1초후에 Task Queue에 저장!`);
},1000) //1초후에 Task Queue 저장, 콜스택이 callback 함수 실행

console.log(`---------프로그램 종료 --------------------`);
