/**
 * DOM 객체 생성 후 객체별 회원가입 이벤트 호출
 */
window.addEventListener('DOMContentLoaded', () => {
    let id = document.querySelector('#id');
    let pwd = document.querySelector('#pwd');
    let cpwd = document.querySelector('#cpwd');
    let name = document.querySelector('#name');
    let idMsg = document.querySelector('#idMsg');
    let pwdMsg = document.querySelector('#pwdMsg');
    let cpwdMsg = document.querySelector('#cpwdMsg');
    let nameMsg = document.querySelector('#nameMsg');
    let btnSignup = document.querySelector('#btnSignup');

    /** id 체크 */
    id.addEventListener('input', () => {
        if(id.value.trim() !== ''){
            idMsg.style.display = 'none';
        }else{
            idMsg.style.display = 'inline-block'
        }
    });

    /**비밀번호 체크*/
    pwd.addEventListener('input', () => {
        if(pwd.value.trim() !== ''){
            pwdMsg.style.display = 'none';
        }else{
            pwdMsg.style.display = 'inline-block'
        }
    });

     /**비밀번호 확인 체크*/
    cpwd.addEventListener('input', () => {
        if(cpwd.value.trim() !== ''){
            cpwdMsg.style.display = 'none';
        }else{
            cpwdMsg.style.display = 'inline-block'
        }
    });

     /**이름 체크*/
    name.addEventListener('input', () => {
        if(name.value.trim() !== ''){
            nameMsg.style.display = 'none';
        }else{
            nameMsg.style.display = 'inline-block'
        }
    });

    /** 가입하기 버튼 이벤트 */ 
    btnSignup.addEventListener('click',() => {
        let isValid = true;

        if(id.value.trim() === ''){
            idMsg.style.display = 'inline-block';
            isValid = false;
        }else{
            if(isValid){
                console.log('서버 전송 -->', id.value);
            }
        }

    });


}) //window event