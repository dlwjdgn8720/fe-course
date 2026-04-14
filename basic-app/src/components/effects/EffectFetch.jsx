import { useEffect, useState } from 'react';
import people1 from '../../assets/people1.webp';
import people2 from '../../assets/people2.webp';
import people3 from '../../assets/people3.webp';
import AvatarList from '../avatar/AvatarList.jsx';
import { fetchData } from "../../util/fetch.js"


export default function EffectFetch() {
    const [data, setData] = useState([]);
    const [count,setCount] = useState(0);

    useEffect(() => {
        console.log('마운트 or 업데이트시 호출!!');
        const loadData = async () => {
            const jsonData = await fetchData("http://localhost:5173/data/avatar.json");
            setData(jsonData.alist);
        }
        loadData();
    }, [count]);
    
    // console.log('data --->', data);

    return (
        <>
            <h2>{count}</h2>
            <AvatarList list={data} />
            <button type='button' onClick={() => setCount(count + 1)}>증가(+)</button>
        </>
    )
}