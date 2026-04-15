import Article from './Article.jsx';
import SkillsTitle from './SkillsTitle.jsx';
import SkillsCoding from './SkillsCoding.jsx';
import SkillsTools from './SkillsTools.jsx';

export default function SkillsContent({ skills }) {
    
    return (
        <div className="skills">
            <Article style="skills_coding">
                <SkillsTitle title="Coding Skills" />
                <SkillsCoding list={skills?.coding}/>
            </Article>

            <Article style="skills-tool">
                <h3 className="skills-title">Tools</h3>
                <SkillsTools list={skills?.tools} />
            </Article>

            <Article style="skills-etc">
                <h3 className="skills-title">etc</h3>
                <SkillsTools list={skills?.etc} />
            </Article>
        </div>
    );
}

