/**
 * block 단위로 실행되는 lexical environment
 */

{  
    let a = 10; //전역변수
    console.log(a);
    {
        let b = 20; // 지역변수
        console.log(a, b);
        {
            let c = 30;
            console.log(a,b,c);
        }//지역 스코프 : Local block scope

    } //지역 스코프 : Local block scope

} //전역 스코프 : Global block scope



