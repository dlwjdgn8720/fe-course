import Home from './content/Home.jsx'
import About from './content/About.jsx'
import Skills from './content/Skills.jsx'
import MyWorks from './content/MyWorks.jsx'

export default function Content({ data }) {
    // console.log('Content ::',data?.home);
    
    return (
        <>
            <Home data={data?.home} /> {/* data = {home props...}*/}
            <About data={data?.about} />
            <Skills data={data?.skills}/>
            <MyWorks data={data?.myworks}/>
        </>
    )
}