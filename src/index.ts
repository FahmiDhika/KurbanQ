import express from 'express'
import cors from 'cors'
import hewanRoute from './Routers/hewanRoute'

const port: number = 4000
const app =  express()
app.use(cors())

app.use(`/hewan`, hewanRoute)

app.listen(port, () => {
    console.log(`Server Berjalan Di Port https://localhost:${port}`)
})