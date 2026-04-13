/**
 * 이름, 나이, 주소를 입력 받는 폼 생성
 * - 각 폼에 유효성 체크 진행
 * - 전송 버튼 클릭시 유효성 체크 진행
 */
import { useRef, useState } from 'react';
import { validateUserInfo2 } from '../../util/validate.js';
import TextInput2 from './TextInput2.jsx';

export default function UserInfo() {
    const forms = [
        { label: "이름", type: "text", name: "name" },
        { label: "나이", type: "text", name: "age" },
        { label: "주소", type: "text", name: "address" },
        { label: "직업", type: "text", name: "job" },
    ];
    const refs = useRef({});

    // refs = {
    //     nameRef: useRef(null),
    //     ageRef: useRef(null),
    //     addressRef: useRef(null),
    //     jobRef: useRef(null)
    // }

    const [form, setForm] = useState({ name: '', age: '', address: '', job: '' });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setForm({ ...form, [name]: value });
    }
    console.log('form--> \n', form);
    console.log('refs--> \n', refs);

    const handleSubmit = (e) => {
        e.preventDefault();

        if (validateUserInfo2(refs)) {
            console.log('submit => ', form);
        }
    }

    return (
        <div>
            <h1>UserInfo2</h1>
            <form name="userInfoForm" onSubmit={handleSubmit}>
                <ul>
                    {forms.map((item,idx) =>
                        <li key={idx}>
                            <label htmlFor="name">{item.label}</label>
                            {!form?.[item.name]?.trim() && <span style={{ color: 'red', fontSize: '0.6rem' }}> {item.label}을 입력해주세요</span>}
                            <div>
                                <TextInput2 item={item}
                                    value={form[item.name]}
                                    handleChange={handleChange}
                                    inputRef={(e) => refs[item.name] = e}
                                />
                                {/* <input  type="text" 
                                        id="name" 
                                        name="name"
                                        value={form.name}
                                        onChange={handleChange}
                                        ref={refs.nameRef}                                    
                                        /> */}
                            </div>
                        </li>
                    )}
                    <li>
                        <button type="submit">전송</button>
                        <button type="button"
                            onClick={() => setForm({ name: '', age: '', address: '', job: '' })}>다시쓰기</button>
                    </li>

                </ul>
            </form>
        </div>
    );
}