// import style from './Avatar.module.css';

export default function AvatarImage({img, style}){
    return (
        //props={img:이미지주소}
        <img src={img} className={style} alt="photo" />
    )
}