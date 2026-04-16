import React from 'react';
import { Title, SubTitle } from '../commons/Titles.jsx';
import Testimonial from './Testimonial.jsx';

export default function Testimonials({ data }) {
    return (
        <section id="testimonial" className="section container">
            <Title title="Testimonial" />
            <SubTitle subTitle="See what they say about me" />

            <ul className="testimonials">   
                {data?.map((item,idx) => 
                    <li className="testimonial" key={idx}>
                        <Testimonial item={item} />
                    </li>               
                )}    
            </ul>
        </section>
    );
}

