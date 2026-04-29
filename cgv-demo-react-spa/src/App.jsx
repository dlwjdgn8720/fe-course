import './cgv.css';
import './commons.css';
import './swiper.css';
import { Outlet } from 'react-router-dom';
import { useEffect, useState } from 'react';
import Header from "../components/Header.jsx"
import Index from "../pages/Index.jsx"
import Footer from "../components/Footer.jsx"

export default function App() {

  const fetchData = async (url) => {
    const response = await fetch(url);
    return response.json();
  }

  const [data, setData] = useState({});
  useEffect(() => {
    const loadData = async () => {
      const jsonData = await fetchData("http://localhost:5174/data/cgv-demo-react-spa.json");
      setData(jsonData);
    }

    loadData();
  }, [])

  return (
    <>
      <Header data={data?.header} />
      <Outlet />
      <Footer />
    </>
  )
}

