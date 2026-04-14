import { useState, useEffect } from 'react'
import AvatarImageList from "../avatar/AvatarImageList"
import style from "../avatar/Avatar.module.css"
import { fetchData } from "../../util/fetch.js"

export default function EffectFetch2() {
    const [data, setData] = useState([]);
    useEffect(() => {
        //비동기 함수 fetchData 작성 및 호출
        const loadData = async() => {
            const jsonData = await fetchData("http://localhost:5173/data/avatar.json");
            const newList = jsonData.list.map((item) => ({
                ...item,
                style: style.avatar_img_circle
            }));
            console.log(newList);            
            setData(newList);
        }
        loadData();     
    }, []);

    return (
        <>
            <AvatarImageList imgList={data}/>
        </>
    )
}