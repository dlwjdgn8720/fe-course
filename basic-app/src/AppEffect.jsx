import EffectCounter from "./components/effects/EffectCounter.jsx";
import EffectFetch from "./components/effects/EffectFetch.jsx";
import EffectFetch2 from "./components/effects/EffectFetch2.jsx";
import { useState } from "react";

export default function AppEffect() {
    const [show, setShow] = useState(true);
    return (
        <>
            {/* {show && <EffectCounter />}
            <button onClick={() => setShow(!show)}>
                {show ? " 숨기기" : "보이기"}
            </button>
            <hr/> */}
            <EffectFetch/>
            <EffectFetch2/>
        </>
    )
}