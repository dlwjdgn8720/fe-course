import AvatarImage from '../commons/AvatarImage';

export default function Projects({ list }) {
    return (
        <ul className="projects">
            {list?.map((item, idx) =>
                <li className="project" key={idx}>
                    <AvatarImage img={item.img} alt={item.alt} style={item.style} />

                    <div className="project-meta">
                        <h3 className="project-meta-title">{item.projectTitle}</h3>
                        <p>{item.projectDescription}</p>
                    </div>
                </li>
            )}
        </ul>
    );
}

