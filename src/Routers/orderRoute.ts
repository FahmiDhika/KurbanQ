import express from "express";

import { getAllOrders, createOrder, updateStatusOrder, deleteOrder } from "../Controllers/orderController"
import { verifyAddOrder, verifyEditStatus } from "../Middlewares/orderValidation"
import { verifyRole, verifyToken } from "../Middlewares/authorization"

const app = express()
app.use(express.json())

app.get(`/get`, [verifyToken, verifyRole(["Penjual","Pelanggan"])], getAllOrders)
app.post(`/new`, [verifyToken, verifyRole(["Pelanggan"]), verifyAddOrder], createOrder)
app.put(`/update/:id`, [verifyToken, verifyRole(["Penjual"]), verifyEditStatus], updateStatusOrder)
app.delete(`/delete/:id`, [verifyToken, verifyRole(["Penjual"])], deleteOrder)

export default app