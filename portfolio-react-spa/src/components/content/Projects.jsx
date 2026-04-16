import AvatarImage from '../commons/AvatarImage';

export default function Projects({ list }) {
    return (
        <ul className="projects">
            {list?.map((item, idx) =>
                <li className="project" key={idx}>
                    <AvatarImage img={item.img} alt={item.alt} style="project-img" />

                    <div className="project-meta">
                        <h3 className="project-meta-title">{item.title}</h3>
                        <p>{item.description}</p>
                    </div>
                </li>
            )}
        </ul>
    );
}

