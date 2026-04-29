import React from 'react';
import Logo from './Logo.jsx';
import { Link, NavLink } from 'react-router-dom';

export default function Header({ data }) {
    return (
        <header>
            <div className="header-top">
                <Logo data={data} />

                <nav>
                    <ul>
                        <li>
                            <NavLink to={"/Login"}
                                className="header-menu-icon">
                                {/* // target="_parent"> */}
                                <img src="images/loginPassword.png" alt="Login Img" />
                                <span>&nbsp;&nbsp;로그인</span>
                            </NavLink>
                        </li>
                        <li>
                            <a href="./join/join.html"
                                className="header-menu-icon"
                                target="_parent">
                                <img src="images/loginJoin.png" alt="Join Img" />
                                <span>회원가입</span>
                            </a>
                        </li>
                        <li>
                            <a href="./mycgv/mycgv.html" className="header-menu-icon" target="_parent">
                                <img src="images/loginMember.png" alt="Mycgv Img" />
                                <span>MY CGV</span>
                            </a>
                        </li>
                        <li>
                            <a href="./support/support.html" className="header-menu-icon" target="_parent">
                                <img src="images/loginCustomer.png" alt="Customer Img" />
                                <span>고객센터</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div className="header-bottom">
                <div className="header-bottom-content">
                    <ul className="flex-container">
                        <li><a href="#">영화</a></li>
                        <li><a href="#">극장</a></li>
                        <li><a href="#">예매</a></li>
                        <li><a href="#">스토어</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">혜택</a></li>
                    </ul>

                    <div className="header-bottom-search">
                        <input type="search" value="리틀엠마" />
                        {/* <!-- fontawesom에서 돋보기 아이콘 추가 --> */}
                        <i className="fas fa-search header-search" ></i>
                    </div>
                </div>
            </div>
        </header>
    );
}

