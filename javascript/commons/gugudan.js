/**
 * 싱글 구구단 정의
 */
export function singleGugudan(dan) {
    const title = `/****${dan}단****/`;
    console.log(title);

    for (let i = 1; i <= 9; i++) {
        console.log(`${dan} ✖ ${i} = ${dan * i}`);
    }
}

/**
 * 멀티 구구단 정의
 */

export function multiGugudan(dan1, dan2) {
    const title = `/**** ${dan1} ~ ${dan2} *****`;
    console.log(title);
    for (let i = 1; i <= 9; i++) {
        let rows = '';
        for (let j = dan1; j <= dan2; j++) {
            rows += `${j} ✖ ${i} = ${j*i}\t`
        }
        console.log(rows);
    }

}
