import { useRef, useState } from 'react';

export default function Login() {
    const idRef = useRef(null);
    const pwdRef = useRef(null);

    const [form, setForm] = useState({ id: '', pwd: '' });
    // form = {id:'', pwd:''};

    const handleFormChange = (e) => {
        //이벤트 발생시 이벤트 객체의 name, value 가져오기
        // let name = e.target.name;
        // let value = e.target.value;

        let { name, value } = e.target;
        setForm({ ...form, [name]: value }); //새로운 form 생성
    }
    //console.log('form -->>', form);

    const handleLoginSubmit = (e) => {
        e.preventDefault();

        if (idRef.current.value.trim() === "") {
            alert("아이디를 입력해주세요");
            idRef.current.focus();
        } else if (pwdRef.current.value.trim() === "") {
            alert("패스워드를 입력해주세요");
            pwdRef.current.focus();
        } else {
            console.log("서버 전송-->", form);
        }
    }

    return (
        <>
            <h1>로그인 폼</h1>
            <form name="login_form" onSubmit={handleLoginSubmit}>
                <ul>
                    <li>
                        <label htmlFor="id">아이디</label>
                        <input type="text"
                            id="id"
                            name="id"
                            value={form.id}
                            ref={idRef}
                            onChange={handleFormChange} />
                    </li>
                    <li>
                        <label htmlFor="pwd">패스워드</label>
                        <input type="password"
                            id="pwd"
                            name="pwd"
                            value={form.pwd}
                            ref={pwdRef}
                            onChange={handleFormChange} />
                    </li>

                    <li>
                        <button type="submit">Login</button>
                        <button>Reset</button>
                    </li>
                </ul>
            </form>
        </>
    )
}