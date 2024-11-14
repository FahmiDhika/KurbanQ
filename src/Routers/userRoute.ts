import express  from "express";
import { verifyAddUser, verifyAuthentication } from "../Middlewares/verifyUser";
import { authentication, createUser, deleteUser, penjualPicture, updateUser } from "../Controllers/userController";
import uploadFile from "../Middlewares/userUpload";
import { verifyRole, verifyToken } from "../Middlewares/authorization";

const app = express()
app.use(express.json())

app.post(`/register/penjual`, [verifyAddUser], createUser)
app.post("/register/pelanggan", [verifyAddUser, verifyToken, verifyRole(["Pelanggan"])], createUser)
app.post(`/login`, [verifyAuthentication], authentication)
app.put(`/update/:idPenjual`, [updateUser, verifyToken, verifyRole(["Penjual", "Pelanggan"])], updateUser)
app.put(`/pic/:idPenjual`, [uploadFile.single("profile"), verifyToken, verifyRole(["Penjual", "Pelanggan"])], penjualPicture)
app.delete(`/delete/:idPenjual`, [verifyToken, verifyRole(["Penjual"])], deleteUser)

export default app