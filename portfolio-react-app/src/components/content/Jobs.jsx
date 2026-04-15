import Job from './Job.jsx';

export default function Jobs({ jobs }) { //jobs 배열객체
    
    return (
        <ul className="jobs">
            {jobs?.map((item, idx) =>
                <li className="job" key={idx}>
                    <Job img={item.img} alt={item.alt} jobName={item.jobName} jobPeriod={item.jobPeriod} />
                </li>
            )}
        </ul>
    )
}