import { Title, Description } from "../commons/Titles";
import Majors from "./Majors.jsx";
import Jobs from "./Jobs.jsx"

export default function About({data}) {
 
    return (
        <section id="about" className="section container">
            <Title title="About me" />
            <Description description={data?.description} />
            <Majors majors={data?.majors}/>
            <Jobs jobs={data?.jobs}/>
        </section>
    )
}