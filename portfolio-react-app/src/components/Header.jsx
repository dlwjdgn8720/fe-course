import Logo from '../components/header/Logo.jsx'
import MenuList from "../components/commons/MenuList.jsx"
import ToggleButton from "../components/header/ToggleButton.jsx"

export default function Header({ data }) {
    //🌟 data 객체가 존재하는 경우에만 구조분해할당 진행!
    //🌟 구조분해 할당으로 반환하는 타입이 객체인 경우에는 초기화 작업 필수
    const { menus = [] } = data || {};
    return (
        <>
            <header className="header">
                <Logo img="/images/favicon_judy.ico"
                    alt="header-logo"
                    style="header-logo-img"
                    title="Judy"
                />
                <MenuList menus={menus} style="header-menu" />
                <ToggleButton/>
            </header>
        </>
    )
}