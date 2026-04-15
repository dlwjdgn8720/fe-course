import React from 'react';

export default function Categories({ list }) {
    return (
        <ul className="categories">
            {list?.map((item, idx) =>
                <li key={idx}>
                    <button className="category">{item.title}
                        <span className="category-count">{item.value}</span>
                    </button>
                </li>
            )}
        </ul>
    );
}

