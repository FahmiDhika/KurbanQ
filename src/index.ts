import express from 'express'
import cors from 'cors'
import hewanRoute from './Routers/hewanRoute'
import penjualRoute from './Routers/userRoute'
import orderRoute from './Routers/orderRoute'
import { PORT } from './global'

const app =  express()
app.use(cors())

app.use(`/hewan`, hewanRoute)
app.use(`/user`, penjualRoute)
app.use(`/order`, orderRoute)

app.listen(PORT, () => {
    console.log(`Server Berjalan Di Port https://localhost:${PORT}`)
})