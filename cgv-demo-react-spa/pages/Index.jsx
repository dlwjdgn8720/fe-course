import React from 'react';
import SwiperCgv from '../commons/SwiperCgv.jsx';

export default function Index() {
    return (
        // <!-- content start -->
    <div className="content">
        {/* <!-- 영화 예고편 : swiper --> */}
        <div className="content-top">
            <SwiperCgv/>
        </div>

        {/* <!-- 무비차트 리스트 --> */}
        <div className="content-moviechart">
            <div>
                <article className="content-title-style">
                    <div>
                        <span className="content-title-style-font font-color-main">박스오피스</span>
                        <span>&nbsp;</span>
                        <span className="content-title-style-font font-color-gray">상영예정작</span>
                    </div>
                    <div>
                        <button className="total-view-button">전체보기</button>
                    </div>
                </article>
                <article className="content-moviechart-list" id="boxoffice">
                    
                </article>
            </div>
        </div>

        {/* <!-- 이벤트, 특별관 --> */}
        <div className="content-event-special">
            <section>
                <div className="content-title-style">
                    <h3 className="content-title-style-font">EVENT</h3>
                    <button className="total-view-button">전체보기</button>
                </div>
                <ul className="content-event-list">
                    <li>
                        <div>
                            <img src="images/event1.jpg" alt="event1 img" width="200px"/>
                        </div>
                        <p className="event-content-title">[CGV]4월 컬처위크</p>
                        <p className="event-content-title-date">2026.04.01 ~ 2026.04.30</p>
                    </li>
                    <li>
                        <div>
                            <img src="images/event1.jpg" alt="event2 img" width="200px"/>
                        </div>
                        <p className="event-content-title">[CGV]4월 컬처위크</p>
                        <p className="event-content-title-date">2026.04.01 ~ 2026.04.30</p>
                    </li>
                    <li>
                        <div>
                            <img src="images/event1.jpg" alt="event2 img" width="200px"/>
                        </div>
                        <p className="event-content-title">[CGV]4월 컬처위크</p>
                        <p className="event-content-title-date">2026.04.01 ~ 2026.04.30</p>
                    </li>
                </ul>
            </section> 
            {/* <!-- 이벤트 --> */}

             {/* <!-- 특별관 -->    */}
            <section> 
                <div className="content-title-style">
                    <h3>특별관</h3>
                    <button className="total-view-button">전체보기</button>
                </div>
                <div className="special-content-list">
                    <div>
                        <img src="images/special1.png" alt="special img" width="400px"/>
                    </div>
                    <ul>
                        <li>
                            <span>SUITE CINEMA</span>
                            <span>#호텔 컨셉의 프리미엄관</span>
                        </li>
                        <li>
                            <span>SUITE CINEMA</span>
                            <span>#호텔 컨셉의 프리미엄관</span>
                        </li>
                        <li>
                            <span>SUITE CINEMA</span>
                            <span>#호텔 컨셉의 프리미엄관</span>
                        </li>
                        <li>
                            <span>SUITE CINEMA</span>
                            <span>#호텔 컨셉의 프리미엄관</span>
                        </li>
                    </ul>
                </div>
            </section>

            {/* <!-- 패키지, 기프트 --> */}
            <section className="package-content-list">
                <div className="package-content-border">
                    <div>
                        <span className="package-title-font">패키지</span>
                        <span className="package-title-button">더보기</span>
                    </div>
                    <ul>
                        <li>
                            <img src="images/package.jpg" alt="package img" width="100px"/>
                            <div>
                                <p>우리 패키지</p>
                                <p>62,000원</p>
                            </div>
                        </li>
                        <li>
                            <img src="images/package.jpg" alt="package img" width="100px"/>
                            <div>
                                <p>우리 패키지</p>
                                <p>62,000원</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div className="package-content-border">
                    <div>
                        <span className="package-title-font">패키지</span>
                        <span className="package-title-button">더보기</span>
                    </div>
                    <ul>
                        <li>
                            <img src="images/package.jpg" alt="package img" width="100px"/>
                            <div>
                                <p>우리 패키지</p>
                                <p>62,000원</p>
                            </div>
                        </li>
                        <li>
                            <img src="images/package.jpg" alt="package img" width="100px"/>
                            <div>
                                <p>우리 패키지</p>
                                <p>62,000원</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div className="package-content-border">
                    <div>
                        <span className="package-title-font">패키지</span>
                        <span className="package-title-button">더보기</span>
                    </div>
                    <ul>
                        <li>
                            <img src="images/package.jpg" alt="package img" width="100px"/>
                            <div>
                                <p>우리 패키지</p>
                                <p>62,000원</p>
                            </div>
                        </li>
                        <li>
                            <img src="images/package.jpg" alt="package img" width="100px"/>
                            <div>
                                <p>우리 패키지</p>
                                <p>62,000원</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
    );
}

