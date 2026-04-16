import './App.css';
import { useState, useEffect } from 'react'
import { fetchData } from './components/util/fetch.js';
import Header from './components/Header.jsx';
import ArrowTop from './components/content/ArrowTop.jsx'
import Footer from './components/Footer.jsx';
import { Outlet } from 'react-router-dom';


export default function App() {
  const [data, setData] = useState({});
  useEffect(() => {
    const loadData = async () => {
      const jsonData = await fetchData("http://localhost:5173/data/portfolio.json");
      setData(jsonData);
    }

    loadData();
  }, []);

  // console.log('data :: ', data);

  return (
    <>
      {/* {data.header && <Header data={data.header} />} */}
      <Header data={data?.header} />
      <Outlet context={data?.content} />
      <ArrowTop/>
      <Footer data={data?.footer}/>
    </>
  )
}


