import AvatarImage from '../commons/AvatarImage';

export default function job({ img, alt, jobName, jobPeriod }) {

    return (
        <>
            <AvatarImage img={img} alt={alt} />
            <div>
                <p className="job-name">{jobName}</p>
                <p className="job-period">{jobPeriod}</p>
            </div>
        </>
    )
}