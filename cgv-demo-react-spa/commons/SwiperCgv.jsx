import React from 'react';
import { Navigation, Pagination, Autoplay, Scrollbar } from 'swiper/modules';
import { Swiper, SwiperSlide } from 'swiper/react'

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/scrollbar';

export default function SwiperCgv() {
    return (

        <div className="swiper">
            {/* // 슬라이드 사이 간격 slidesPerView="{3}" 한 번에 보여줄 개수 onSlideChange="{()"> console.log('슬라이드 변경됨')} */}
            <Swiper modules={[Navigation, Pagination, Scrollbar]}
                //spaceBetween={50}
                slidesPerView={3}
                navigation
                pagination={{ clickable: true }}
                scrollbar={{ draggable: true }}
                autoplay={{ delay: 3000 }}
                onSwiper={(swiper) => console.log(swiper)}>
                <SwiperSlide className="swiper-slide"><img className="swiper-img" src="images/img1.jpg" alt="img1" /></SwiperSlide>
                <div className="swiper-slide">
                    <SwiperSlide><img className="swiper-img" src="images/img2.jpg" alt="img2" /></SwiperSlide>
                </div>
                <div className="swiper-slide">
                    <SwiperSlide><img className="swiper-img" src="images/img3.jpg" alt="img3" /></SwiperSlide>
                </div>
            </Swiper>
        </div>





        // // <!-- Slider main container -->
        // <div className="swiper">
        //     {/* <!-- Additional required wrapper --> */}
        //     <div className="swiper-wrapper">
        //         {/* <!-- Slides --> */}
        //         <div className="swiper-slide">
        //             <img className="swiper-img" src="images/swiper/img1.jpg" alt="img1" />
        //         </div>
        //         <div className="swiper-slide">
        //             <img className="swiper-img" src="images/swiper/img2.jpg" alt="img2" />
        //         </div>
        //         <div className="swiper-slide">
        //             <img className="swiper-img" src="images/swiper/img3.jpg" alt="img3" />
        //         </div>

        //     </div>
        //     {/* <!-- If we need pagination --> */}
        //     <div className="swiper-pagination"></div>

        //     {/* <!-- If we need navigation buttons --> */}
        //     <div className="swiper-button-prev"></div>
        //     <div className="swiper-button-next"></div>

        //     {/* <!-- If we need scrollbar --> */}
        //     <div className="swiper-scrollbar"></div>
        // </div>
    );
}

