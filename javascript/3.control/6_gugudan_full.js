for (let i = 1; i <= 9; i++) {
    let output = '';
    for (let j = 2; j <= 9; j++) {
        output += `${j} ✖ ${i} = ${i * j}\t`; // 가로
        // console.log(`${j} x ${i} = ${i * j}`) // 세로
    }
    console.log(output);
}

/**
 * 삼각형 별 찍기
 */

for (let i = 1; i <= 5; i++) {
    let output = '';
    // for (let j = 1; j <= i; j++) {
    //     output += '*';
    // }
    output += '🔅'.repeat(i);
    console.log(output);
}

/**
 * 삼각형으로 초록색 사과출력
 * -세번째줄만 빨간색 사과로 출력
 */

for (let i = 1; i <= 5; i++) {
    let output = '';
    for (let j = 1; j <= i; j++) {
        output += (i == 3) ? '🍎' : '🍏';
    }
    console.log(output);
}

/**
 * 정삼각형 별찍기 - repeat(반복횟수) 함수 이용
 * 열이랑 행이랑 똑같이 반복할때 repeat 함수 사용
 */
console.clear();
let size = 10;
for(let i = 1; i <= size; i++){
    let output = '';
    let space = '';
    space += ' '.repeat(size-i);
    output += '🍎'.repeat(i);
    console.log(space,output);
}

//역 삼각형
for(let i = size-1; i >= 1; i--){
    let output = '';
    let space= '';
    space += ' '.repeat(size-i);
    output += '🍎'.repeat(i);
    console.log(space,output);
}

// * 로 정삼각형찍기
for(let i = 1; i <= 5; i++){
    let output = '';
    let space = '';
    space += ' '.repeat(5-i);
    output += '*'.repeat(2*i-1);
    console.log(space,output);
}



