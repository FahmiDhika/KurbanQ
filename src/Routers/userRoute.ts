import express  from "express";
import { verifyAddUser, verifyAuthentication } from "../Middlewares/verifyUser";
import { authentication, createUser, deleteUser, penjualPicture, updateUser } from "../Controllers/userController";
import uploadFile from "../Middlewares/userUpload";

const app = express()
app.use(express.json())

app.post(`/add`, [verifyAddUser], createUser)
app.post(`/login`, [verifyAuthentication], authentication)
app.put(`/update/:idPenjual`, [updateUser], updateUser)
app.put(`/pic/:idPenjual`, [uploadFile.single("profile")], penjualPicture)
app.delete(`/delete/:idPenjual`, deleteUser)


export default app