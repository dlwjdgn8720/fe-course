import React from 'react';

export default function AvatarImage({img, alt, style}) {
    return (
        <img src={img} alt={alt} className={style} />
    );
}

