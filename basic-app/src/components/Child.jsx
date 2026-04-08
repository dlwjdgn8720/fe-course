export default function Child({ children }) { //{{name:"홍길동",age:"20"}}
    //let {name} = props; {name:"홍길동", age:20}

    return (
        <>
        <h1>Hello~</h1>
        {children}
        </>
    )
}