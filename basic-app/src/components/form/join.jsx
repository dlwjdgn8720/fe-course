import {useState, useRef} from 'react';
import './cgv.css';
import './commons.css';

export default function Join() {
    const idRef = useRef(null);
    const pwdRef = useRef(null);
    const cpwdRef = useRef(null);
    const nameRef = useRef(null);
    const phoneRef = useRef(null);
    const emailNameRef = useRef(null);
    const emailDomainRef = useRef(null);

    const initForm = {
        id : '',
        pwd : '',
        cpwd : '',
        name : '',
        phone : '',
        emailName :'',
        emailDomain : ''
    }

    const[form, setForm] = useState(initForm);
    // const[errors, setErrors]  = useState({...initForm});

    const handleFormChange = (e) => {
        const {name , value} = e.target;
        setForm({...form, [name] : value});
    }

    console.log('form---->', form);

    const handleJoinSubmit = (e) => {
        e.preventDefault();
        
        if(idRef.current.value === ''){
            // setErrors({...errors, id : '아이디를 입력해주세요'});
            idRef.current.focus();
        }else if(pwdRef.current.vaue === ''){
            alert("패스워드를 입력해주세요");
            pwdRef.current.focus();
        }else{
            console.log('서버 전송 -->>', form);
        }
    }

    // console.log('errors---->', errors);
    return (
        <>
            <div className="content">
                <div className="join-form center-layout">
                    <h1 className="center-title">회원가입</h1>
                    <form onSubmit={handleJoinSubmit}>
                        <ul>
                            <li>
                                <label htmlFor="" ><b>아이디</b></label>
                                { form.id === "" && <span id="idMsg">아이디를 입력해주세요</span>}
                                <div>
                                    <input type="text" name="id" id="id" ref={idRef} value={form.id}
                                        onChange={handleFormChange}
                                        placeholder="아이디 입력(6~20자)"/>
                                        <button>중복확인</button>
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>비밀번호</b></label>
                                <span id="pwdMsg">12자 이내의 비밀번호를 입력해주세요</span>
                                <div>
                                    <input type="password" name="pwd" id="pwd" ref={pwdRef} value={form.pwd}
                                        onChange={handleFormChange}
                                        placeholder="비밀번호 입력(문자,숫자,특수문자 포함 6~12자)"/>
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>비밀번호 확인</b></label>
                                <span id="cpwdMsg">비밀번호가 일치하지 않습니다</span>
                                <div>
                                    <input type="password" name="cpwd" id="cpwd" ref={cpwdRef} value={form.cpwd}
                                        onChange={handleFormChange}
                                        placeholder="비밀번호 재입력"/>
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>이름</b></label>
                                <span id="nameMsg">이름을 입력해주세요</span>
                                <div>
                                    <input type="text" name="name" id="name" ref={nameRef} value={form.name}
                                        onChange={handleFormChange}
                                        placeholder="이름을 입력해주세요"/>
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>전화번호</b></label>
                                <span id="phoneMsg">휴대폰 번호를 입력해주세요</span>
                                <div>
                                    <input type="text" name="phone" id="phone" ref={phoneRef} value={form.phone}
                                        onChange={handleFormChange}
                                        placeholder="휴대폰 번호 입력('-' 포함)"/>
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>이메일 주소</b></label>
                                <span id="emailMsg">이메일주소를 입력해주세요</span>
                                <div>
                                    <input type="text" name="emailname" id="emailname" ref={emailNameRef} 
                                        value={form.emailName} onChange={handleFormChange}
                                        placeholder="이메일 주소"/>
                                        <span>@</span>
                                        <select name="emaildomain" id="emaildomain" ref={emailDomainRef}> 
                                            value={form.emailDomain}
                                            <option value="default">선택</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="daum.net">daum.net</option>
                                        </select>
                                </div>
                            </li>
                            <li>
                                <button type="submit">가입하기</button>
                                <button type="button">가입취소</button>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </>
    )
}