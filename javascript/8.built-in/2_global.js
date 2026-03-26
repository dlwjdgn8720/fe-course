/**
 * 전역 함수로 최상위 객체인 Window 객체에서 호출되는 함수 
 * - 호출방법 : window.함수명(브라우저에서 사용)
 * - 객체명을 생략 가능
 * - window.alert(),window.confirm(),Number.parseInt(window.parseInt)
 * 
 * 전역 객체
 * - encodeURI(), decodeURI() ...
 */

let number = '123.4567';
let intNumber = Number.parseInt(number);
// let intNumber2 = window.parseInt(number);//브라우저에서만 실행
let intNumber2 = Number.parseInt(number);
console.log('number = ', number, typeof number);
console.log('intNumber = ', intNumber, typeof intNumber);
console.log('intNumber2 = ', intNumber, typeof intNumber2);

//URI 주소 인코딩
 let uri = 'http://www.naver.com?name=홍길동';
 let encodeUri = encodeURI(uri);
 let decodeUri = decodeURI(encodeUri);

 console.log(uri);
 console.log(encodeUri);
 console.log(decodeUri);
 





