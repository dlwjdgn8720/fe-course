/**
 * static 상수, 메서드 정의 - 클래스 상수, 클래스 메소드
 * static 키워드가 붙은 상수, 메서드
 * - 호출시 : 클래스명.상수, 클래스명.메서드
 * static이 붙은 상수, 메서드는 stack의 static 메모리영역에 별도 저장되므로,
 * 객체 생성 전 호출이 가능
 */

class Fruit {
    //Field
    static Max_SIZE = 10;
    // name; //생략 가능
    // color;
    // emoji;

    //Constructor
    constructor(name,color,emoji){
        this.name = name;
        this.color = color;
        this.emoji = emoji;
    }

    //Method
    static getName = () => {return this.name;}
    getName = () => {return this.name;}

    static create = (name,color,emoji) => {
        return new Fruit(name,color,emoji);
    }


}

let apple = new Fruit('apple','red','🍎');
console.log(apple);
console.log(Fruit.getName()); //Fruit 출력,stack메모리
console.log(apple.getName()); //apple 출력,힙 메모리

//create함수로 lemon 객체 생성
let lemon = Fruit.create('lemon','yellow','🍋');
console.log(lemon);
console.log(lemon.getName());


