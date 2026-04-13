import { useState, useRef } from 'react';
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
        id:'',
        pwd:'',
        cpwd: '',
        name:'',
        phone:'',
        emailName:'',
        emailDomain:'default'
    }

    const [form, setForm] = useState(initForm);

    const handleFormChange = (e) => {
        const { name, value } = e.target;
        setForm({...form, [name]:value});
    }
console.log(form);

    const handleJoinSubmit = (e) => {
        e.preventDefault();

        if(idRef.current.value === "") {
            alert("아이디 입력해주세요");
            idRef.current.focus();
        } else if(pwdRef.current.value === "") {
            alert("패스워드를 입력해주세요");
            pwdRef.current.focus();
        } else {
            console.log('서버 전송 -->> ', form);
        }
    }

    const handleFormReset = () => {
        setForm(initForm);
    }

    return (
        <>
            <div className="content">
                <div className="join-form center-layout">
                    <h1 className="center-title">회원가입</h1>
                    <form onSubmit={handleJoinSubmit}>
                        <ul>
                            <li>
                                <label htmlFor="" ><b>아이디</b></label>
                                { form.id === "" && <span id="idMsg">아이디를 입력해주세요</span> }
                                <div>
                                    <input type="text" 
                                            name="id" 
                                            id="id"
                                            value={form.id}
                                            ref={idRef}
                                            onChange={handleFormChange}
                                            placeholder="아이디 입력(6~20자)"
                                            />
                                    <button>중복확인</button>       
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>비밀번호</b></label>
                                {form.pwd === "" && <span id="pwdMsg">12자 이내의 비밀번호를 입력해주세요</span> }
                                <div>
                                    <input type="password" 
                                            name="pwd" 
                                            id="pwd"
                                            value={form.pwd}
                                            ref={pwdRef}
                                            onChange={handleFormChange}
                                            placeholder="비밀번호 입력(문자,숫자,특수문자 포함 6~12자)"
                                            />
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>비밀번호 확인</b></label>
                                {form.cpwd === "" && <span id="cpwdMsg">비밀번호가 일치하지 않습니다</span> }
                                <div>
                                    <input type="password" 
                                            name="cpwd" 
                                            id="cpwd"
                                            ref={cpwdRef}
                                            value={form.cpwd}
                                            onChange={handleFormChange}
                                            placeholder="비밀번호 재입력" />
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>이름</b></label>
                                {form.name === "" && <span id="nameMsg">이름을 입력해주세요</span> }
                                <div>
                                    <input type="text" 
                                            name="name" 
                                            id="name"
                                            ref={nameRef}
                                            value={form.name}
                                            onChange={handleFormChange}
                                            placeholder="이름을 입력해주세요" />
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>전화번호</b></label>
                                {form.phone === "" && <span id="phoneMsg">전화번호를 입력해주세요</span> }
                                <div>
                                    <input type="text" 
                                            name="phone" 
                                            id="phone"
                                            ref={phoneRef}
                                            value={form.phone}
                                            onChange={handleFormChange}
                                            placeholder="휴대폰 번호 입력('-' 포함)" />
                                </div>
                            </li>
                            <li>
                                <label htmlFor=""><b>이메일 주소</b></label>
                                { !(form.emailName !== "" && form.emailDomain !=="default") && <span id="emailMsg">이메일주소를 입력해주세요</span> }
                                <div>
                                    <input type="text" 
                                            name="emailName" 
                                            id="emailname"
                                            ref={emailNameRef}
                                            value={form.emailName}
                                            onChange={handleFormChange}
                                            placeholder="이메일 주소"/> 
                                    <span>@</span>       
                                    <select name="emailDomain" 
                                            id="emaildomain"
                                            ref={emailDomainRef}
                                            value={form.emailDomain}
                                            onChange={handleFormChange}>
                                        <option value="default">선택</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="daum.net">daum.net</option>
                                    </select>
                                </div>
                            </li>
                            <li>
                                <button type="submit">가입하기</button>
                                <button type="button" onClick={handleFormReset}>가입취소</button>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </>
    )
}