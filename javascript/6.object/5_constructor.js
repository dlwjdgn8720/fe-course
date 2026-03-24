/**
 * 생성자 함수를 통한 객체 생성
 * - 객체의 틀을 이용하여 다수의 객체 생성하는 함수
 */

//Object Literal
// const Fruit = {
//     name : '사과',
//     emoji : '🍎'
// }

//객체 틀 정의 => 생성자 함수로 생성됨
//사과, 레몬, 오렌지 => name, color, emoji
function Fruit(name, color, emoji) {
    // let name = undefined;
    this.name = name;
    this.color = color;
    this.emoji = emoji;

    this.display = () => {
        console.log(this.name, this.color, this.emoji);
    }
}

let apple = new Fruit('apple', 'red', '🍎');
let lemon = new Fruit('lemon', 'yellow', '🍋');
let orange = new Fruit('orange', 'coral', '🍊');
apple.display();
lemon.display();
orange.display();

console.log(apple.name, apple.color, apple.emoji);

//성적 리스트 관리
//홍길동, 스미스, 이순신, 김유신, 제임스 학생 성적 관리
//name, kor(국어), eng(영어), math(수학)의 필드값을 가지는 성적 템플릿의 생성자 함수 정의
//display 함수로 전체 데이터 출력
//생성자 함수명 : Score

function Score(name, kor, eng, math) {
    this.name = name;
    this.kor = kor;
    this.eng = eng;
    this.math = math;
    this.display = () => {
        console.log(this.name, this.kor, this.eng, this.math);
    }
    //총점 반환
    this.sum = () => {return this.kor + this.eng + this.math;}
    //평균 반환
    this.avg = () => {return parseInt(this.sum()/3)}
}

//성적리스트 객체 생성 함수
function createScoreList(st1,st2,st3,st4,st5){//{st1:{홍길동정보},st2(스미스...)}
    return { st1, st2, st3, st4, st5}
}

let hong = new Score('홍길동', 100, 90, 100);
let smith = new Score('스미스', 100, 70, 100);
let lee = new Score('이순신', 80, 90, 100);
let kim = new Score('김유신', 100, 50, 90);
let james = new Score('제임스', 90, 70, 80);

let scoreList = createScoreList(hong,smith,lee,kim,james);
console.clear();
hong.display();
smith.display();
lee.display();
kim.display();
james.display();

console.log(scoreList);
console.clear();
console.log(`${hong.name} 총점/평균 = ${hong.sum()} / ${hong.avg()}`);
console.log(`${smith.name} 총점/평균 = ${smith.sum()} / ${smith.avg()}`);
console.log(`${lee.name} 총점/평균 = ${lee.sum()} / ${lee.avg()}`);
console.log(`${kim.name} 총점/평균 = ${kim.sum()} / ${kim.avg()}`);
console.log(`${james.name} 총점/평균 = ${james.sum()} / ${james.avg()}`);


