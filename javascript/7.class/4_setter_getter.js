/**
 * 사원(Employee) 클래스 정의
 * - 사원번호(#),사원명, 나이를 입력받아 객체 생성
 */

class Employee{
    #empno;
    #name;
    #age;

    constructor(empno,name,age){
        this.#empno = empno;
        this.#name = name;
        this.#age = age;
    }

    //getter/setter
    getEmpno = () => {return this.#empno;}
    getName = () => {return this.#name;}
    getAge = () => {return this.#age;}

    setEmpno = (empno) => {this.#empno = empno;}
    setName = (name) => {this.#name = name;}
    setAge = (age) => {this.#age = age;}

    display = () => {console.log(this.#empno, this.#name,this.#age);}
}

let hong = new Employee();
hong.setEmpno('1234');
hong.setName('홍길동');
hong.setAge(30);
console.log(hong.getEmpno());
console.log(hong.getName());
console.log(hong.getAge());
hong.display();

let smith = new Employee('4567','스미스',36);
smith.display();

let empList = [];
// empList[0] = hong;
// empList[1] = smith;
empList.push(hong);
empList.push(smith);
console.log('empList.pop(hong) ::\n',empList.pop(hong));

console.log(empList);

let empListObj = {};
empListObj['hong'] = hong;
empListObj['smith'] = smith;
console.log(empListObj);


