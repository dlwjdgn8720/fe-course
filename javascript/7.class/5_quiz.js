/**
 * 학생(Student) 클래스 정의
 * 필드 : #이름, #나이, #주소, 이모지
 * 메소드 : setter/getter, display
 */
let dataList = [
    { name: '홍길동', age: 20, address: '서울시', emoji: '🧑' },
    { name: '김철수', age: 21, address: '부산시', emoji: '🧑' },
    { name: '박영희', age: 22, address: '서울시', emoji: '👩' },
    { name: '박정민', age: 23, address: '인천시', emoji: '🧑' },
    { name: '홍길순', age: 24, address: '서울시', emoji: '👩' },
];

/**1. 학생(Student) 클래스 정의 */
class Student {
    #name;
    #age;
    #address;

    constructor(name, age, address, emoji) {
        this.#name = name;
        this.#age = age;
        this.#address = address;
        this.emoji = emoji;
    }

    getName = () => { return this.#name } //this.#name return 생략가능,한줄일때 {} 생략가능
    getAge = () => { return this.#age; }
    getAddress = () => { return this.#address; }
    getEmoji = () => { return this.emoji; }

    setName = (name) => { this.#name = name; }
    setAge = (age) => { this.#age = age; }
    setAddress = (address) => { this.#address = address; }
    setEmoji = (emoji) => { this.emoji = emoji; }

    display = () => { console.log(this.#name, this.#age, this.#address, this.emoji) }
}


/**2. 학생(Student) 객체 생성 */
let hong = new Student('홍길동', 20, '서울시', '🧑');
hong.display();

/** 3. dataList 배열 객체를 이용하여 학생(Student) 객체 생성 후 
 *     학생리스트(배열)에 저장 */
const studentList = [];
for (let i = 0; i < dataList.length; i++) {
    //dataList[i] = {}
    let obj = dataList[i];
    let student = new Student(obj.name, obj.age, obj.address, obj.emoji);
    studentList.push(student);
}

console.log(studentList);

/** 4. studentList 배열의 객체 출력 */
console.log(`----------학생 리스트 ------`);
for (let i = 0; i < studentList.length; i++) {
    let student = studentList[i];
    console.log(student.getName() + '\t', 
                student.getAge() + '\t', 
                student.getAddress() + '\t', 
                student.getEmoji());
}
console.log(`-----------------------------`);



