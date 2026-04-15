import { Title, Description } from '../commons/Titles';
import Categories from './Categories.jsx';
import Projects from './Projects.jsx';


export default function MyWorks({ data }) {
    return (
        <section id="work" className="section container">
            <Title title="My work" />
            <Description description="Projects" />

            <Categories list={data?.categories}/>
            <Projects list={data?.projects}/>

        </section>
    );
}



