import { Title, SubTitle } from '../components/commons/Titles.jsx'
import Categories from '../components/content/Categories.jsx';
import Projects from '../components/content/Projects.jsx';
import { useOutletContext } from "react-router-dom";


export default function Work() {
    const { data, like, setLike } = useOutletContext();

    return (
        <section id="work" className="section container">
            <Title title="My work" />
            <SubTitle subTitle="Projects" />

            <Categories list={data?.work?.categories} />
            <Projects list={data?.work?.projects} like={like} setLike={setLike} />

        </section>
    );
}



