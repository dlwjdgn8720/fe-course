/**
 * 이름, 나이, 주소를 입력 받는 폼 생성
 * - 각 폼에 유효성 체크 진행
 * - 전송 버튼 클릭시 유효성 체크 진행
 */
import { useRef, useState } from 'react';
import { validateUserInfo } from '../../util/validate.js'

export default function UserInfo() {

    const refs = {
        nameRef: useRef(null),
        ageRef: useRef(null),
        addressRef: useRef(null),
        jobRef: useRef(null),
    }

    // const nameRef = useRef(null);
    // const ageRef = useRef(null);
    // const addressRef = useRef(null);
    // const jobRef = useRef(null);

    const [form, setForm] = useState({ name: '', age: '', address: '', job: '' });

    const handleChange = (e) => {
        //console.log(e);
        const { name, value } = e.target;
        setForm({ ...form, [name]: value });
    }

    const handleSubmit = (e) => {
        e.preventDefault();

        if (validateUserInfo(refs)) {
            //서버 전송
            console.log('submit =>', form);
        }
    }

    return (
        <div>
            <h1>UserInfo</h1>
            <form name="userInfoForm" onSubmit={handleSubmit}>
                <ul>
                    <li>
                        <label htmlFor="name">이름</label>
                        {!form.name?.trim() && <span style={{ color: 'red', fontSize: '0.6rem' }}>이름을 입력해주세요</span>}
                        <div>
                            <input type="text" id="name" name="name" value={form.name} onChange={handleChange} ref={refs.nameRef} />
                        </div>
                    </li>
                    <li>
                        <label htmlFor="age">나이</label>
                        {!form.age?.trim() && <span style={{ color: 'red', fontSize: '0.6rem' }}>나이를 입력해주세요</span>}
                        <div>
                            <input type="text" id="age" name="age" value={form.age} onChange={handleChange} ref={refs.ageRef} />
                        </div>
                    </li>
                    <li>
                        <label htmlFor="address">주소</label>
                        {!form.address.trim() && <span style={{ color: 'red', fontSize: '0.6rem' }}>주소를 입력해주세요</span>}
                        <div>
                            <input type="text" id="address" name="address" value={form.address} onChange={handleChange} ref={refs.addressRef} />
                        </div>
                    </li>
                    <li>
                        <label htmlFor="job">직업</label>
                        {!form.job?.trim() && <span style={{ color: 'red', fontSize: '0.6rem' }}>직업을 입력해주세요</span>}
                        <div>
                            <input type="text" id="job" name="job" value={form.job} onChange={handleChange} ref={refs.jobRef} />
                        </div>
                    </li>
                    <li>
                        <button type="submit">전송</button>
                        <button type="button"
                            onClick={() => setForm({ name: '', age: '', address: '', job: '' })}>다시쓰기</button>
                    </li>
                </ul>

            </form>
        </div>
    )
}