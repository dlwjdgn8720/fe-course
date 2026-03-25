/**
 * 로그인 처리
 */
class User {
    #id;
    #password;

    constructor(id, password) {
        this.#id = id;
        this.#password = password;
    }

    getId = () => this.#id;
    getPassword = () => this.#password;

    setId = (id) => this.#id = id;
    setPassword = (password) => this.#password = password;
}



function loginCheck() {
    console.log(`로그인 처리 함수!!!!!!`);
    //id, pwd 값 가져오기
    let id = document.querySelector('#id').value;
    let password = document.querySelector('#pwd').value;
    // console.log(id,password);

    //유효성 체크(Validation Check) - 데이터의 유, 무 체크
    if (id === '') {
        alert('아이디를 입력해주세요');
        document.querySelector('#id').focus();
    } else if (password === '') {
        alert('패스워드를 입력해주세요');
        document.querySelector('#pwd').focus();
    } else {
        //User 클래스 생성
        let user = new User(id, password);
        let userObj = { id, password }; //{id:'test, password:'1234'}
        console.log(user);
        console.log(userObj);

        //서버에 user 전송 
        //비교 => db id = test, db pass=1234;
        if (user.getId() === 'test' && user.getPassword() === '1234') {
            alert('로그인 성공!!')
        } else {
            alert('아이디 혹은 패스워드가 일치하지 않습니다.');
        }
    }
}


