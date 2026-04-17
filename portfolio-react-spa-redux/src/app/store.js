import { configureStore } from '@reduxjs/toolkit'
import likeSlice  from '../features/likeSlice.js'
import skillsSlice from '../features/skillsSlice.js'

export const store = configureStore({
    //slice 진열
    reducer: {
        like: likeSlice,
        skills: skillsSlice,
    },
})