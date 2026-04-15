import { useState } from 'react';
import Menu from "./Menu.jsx";

export default function MenuList({ menus, style }) {
    const [name, setName] = useState('Home');
    const handleClick = (name) => {
        setName(name);
    }

    return (
        <nav>
            <ul className={style}>
                {menus.map((menu, idx) =>
                    <li key={idx}>
                        <Menu href={menu.href}
                            style={name === menu.name ? "header-menu-item active" : menu.style}
                            name={menu.name}
                            click={handleClick} />
                    </li>
                )}
            </ul>
        </nav>
    )
}