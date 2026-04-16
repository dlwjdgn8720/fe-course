import AvatarImage from "../components/commons/AvatarImage"
import Menu from "../components/commons/Menu"
import { useOutletContext } from "react-router-dom";

export default function Home() {
    const data = useOutletContext(); //content 객체 전제
    console.log(data);
    const { img, alt, title, name, description, href, menuName } = data?.home || {};
    // console.log('Home -->', img, alt, title, name, description, href, menuName);

    return (
        <section id="home">
            <AvatarImage img={img} alt={alt} style="home-avatar" />
            <h2 className="home-title">
                Hello<br/>
                I'm <strong className="home-title-strong">{title}</strong>,
                {name}
            </h2>
            <p className="home-description">{description}</p>
            <Menu href={href} style="home-contact" name={menuName} />
        </section>
    )
}