/**
 * Number 클래스
 * - valueOf(), toString() ...
 */

let a = 100;
let b = 1234567;
let aa = new Number(100);
let bb = new Number(1234567);
console.log(a, typeof a);   //100, number
console.log(aa, typeof aa); //100, object(Number)
console.log(b, typeof b); //number
console.log(bb, typeof bb); //object(Number)

console.log(a.valueOf()); //100, 자동변환, 원본 데이터타입 유지
console.log(aa.valueOf()); //100
console.log(b.valueOf());
console.log(bb.valueOf());

console.log(a.toLocaleString(), typeof a); 
console.log(aa.toLocaleString()); 
console.log(b.toLocaleString()); 
console.log(bb.toLocaleString());

let localeNumber = b.toLocaleString();
console.log(localeNumber, typeof localeNumber);

let number = '123493734';
let locNumber = parseInt(number).toLocaleString();//Number클래스 생략가능
console.log('locNumber = ', locNumber);

let fnumber = '1234.93734';
let flocNumber = parseFloat(fnumber).toLocaleString();
let flocNumber2 = parseFloat(fnumber).toFixed();//소수점 첫째자리에서 반올림
let flocNumber3 = parseFloat(fnumber).toFixed(2);//출력되는 소수점 자리수, 셋째자리에서 반올림
console.log('flocNumber = ', flocNumber);
console.log('flocNumber2 = ', flocNumber2);
console.log('flocNumber3 = ', flocNumber3);


