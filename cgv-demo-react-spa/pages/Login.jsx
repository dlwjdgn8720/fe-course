import React from 'react';

export default function Login() {
    return (
        //  <!-- content start -->
        <div class="content">
            <div class="center-layout login-form">
                <h1 class="center-title">로그인</h1>
                <form action="#" method="post">
                    <ul>
                        <li>
                            <p>아이디, 비밀번호를 입력하신 후, 로그인 버튼을 클릭해주세요.</p>
                        </li>
                        <li>
                            <div class="login-form-input">
                                <i class="fa-regular fa-user"></i>
                                <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" />
                            </div>
                            <p id="idMsg"></p>
                            <div class="login-form-input">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" />
                            </div>
                            <p id="pwdMsg"></p>
                        </li>
                        <li>
                            <button type="button" class="btn-main-color" id="btnLogin">로그인</button>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        // {/* <!-- content end --> */}

    );
}

