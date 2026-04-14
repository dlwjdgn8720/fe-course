import Image from "../../common/Image.jsx"
import "./Airbnb.css";

export default function RoomAvatar({ item }) {

    const {pk, img, roomTitle, roomDate, roomPrice, roomRating, isLike, isGuest
    } = item;

    return (
        <div className="room_container" key={pk}>
            <Image img={img}
                alt="best room"
                className="room_img" />
            {isGuest && <span className="guest_preference">게스트 선호</span>}
            {isLike && <span className="like">🤍</span>}
            <p className="room_title">{roomTitle}</p>
            <p className="room_date">{roomDate}</p>
            <div className="room_price">
                <p>총액 {roomPrice}</p>
                <p>⭐ {roomRating}</p>
            </div>
        </div>
    )
}