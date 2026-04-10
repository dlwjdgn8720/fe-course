import { useRef, useState } from 'react';

export default function TextInput() {

    const textRef = useRef(null);
    const [text, setText] = useState('');

    const handleClick = () => {
        let text = textRef.current.value.trim();
        if (text === "") {
            alert("텍스트를 입력해주세요.");
            textRef.current.focus();
        } else {
            alert("서버 전송 -->" + text);
        }
    }

    const handleChange = (e) => {
        setText(e.target.value);
    }
    
    console.log('text ---->', text);

    return (
        <div>
            <h2>Ref : 텍스트폼 입력</h2>
            <input type="text" name="text" value={text} ref={textRef} onChange={handleChange} />
            <button type="button" onClick={handleClick}>전송</button>
        </div>
    )
}