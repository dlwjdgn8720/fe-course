import { useState } from 'react';
import AvatarImage from '../commons/AvatarImage';
import Modal from './Modal';

export default function Projects({ list }) {
    const [selectedProject, setSelectedProject] = useState(null);

    return (
        <>
            <ul className="projects">
                {list?.map((item, idx) =>
                    <li className="project" key={idx} onClick={() => setSelectedProject(item)}>
                        <AvatarImage img={item.img} alt={item.alt} style="project-img" />
                        <div className="project-meta">
                            <h3 className="project-meta-title">{item.title}</h3>
                            <p>{item.description}</p>
                        </div>
                    </li>
                )}
            </ul>
            {
                selectedProject && <Modal
                    project={selectedProject}
                    onClose={() => setSelectedProject(null)}/>
            }
        </>
    );
}

