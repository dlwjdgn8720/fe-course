import React from 'react';
import AvatarImage from '../commons/AvatarImage.jsx';
import { NavLink } from 'react-router-dom';


export default function Logo({ data }) {
    return (
        <>
            <div className="header-top-logo">
                <NavLink to={"/"}>
                    <AvatarImage img={data?.logo?.img} alt={data?.logo?.alt} />
                </NavLink>
                <span className="font-color-gray">{data?.logo?.title}</span>
            </div>
                {/* <a href={Index} target="_parent"> */}

            <div className="header-top-card">
                <AvatarImage img={data?.logocard?.img} alt={data?.logocard?.alt} />
            </div>
        </>
    );
}

