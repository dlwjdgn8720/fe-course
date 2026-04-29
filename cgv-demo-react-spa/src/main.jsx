import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import App from './App.jsx'
import Index from '../pages/Index.jsx'
import Login from '../pages/Login.jsx'

//router 객체 생성
const router = createBrowserRouter([
  {
      path: "/",
      element: <App/>, //Layout 구성 컴포넌트 정의 : App.jsx는 미리 생성됨
      children: [
        {index: true, element: <Index />},
        {path: "/login", element: <Login />}
      ],
    },
]);

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>,
)
