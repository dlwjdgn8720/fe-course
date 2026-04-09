export default function Image({img,alt,w,h}){
    return(
        <img src={img}
        alt={alt}
        style={{
            w:w,
            h:h
        }} />
    )
}