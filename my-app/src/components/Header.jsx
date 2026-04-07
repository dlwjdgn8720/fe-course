import img01 from '../assets/images/img01.png';
import './Header.css';


export default function Header() {
    return (
        <>
            <header className='header'>
                <img src={img01} alt="tree" width="150px" />
                <h1>Header</h1>
            </header>
            <div >
            </div>
        </>
    )
}