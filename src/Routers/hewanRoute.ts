import express  from "express";
import { addHewan, changePicture, deleteHewan, getAllHewan, updateHewan } from "../Controllers/hewanController";
import { verifyAddHewan, verifyEditHewan } from "../Middlewares/verifyHewan";
import uploadFile from "../Middlewares/hewanUpload";
import { verifyRole, verifyToken } from "../Middlewares/authorization";

const app = express()
app.use(express.json())

app.get(`/get`,[verifyToken, verifyRole(["Pelanggan", "Penjual"])] , getAllHewan)
app.post(`/add`,[verifyToken, verifyRole(["Penjual"]), uploadFile.single("foto"), verifyAddHewan], addHewan)
app.put(`/update/:idHewan`,[verifyToken, verifyRole(["Penjual"]), uploadFile.single("foto"), verifyEditHewan], updateHewan)
app.put(`/pic/:id`,[verifyToken, verifyRole(["Penjual"])] ,[uploadFile.single("picture")], changePicture)
app.delete(`/:idHewan`,[verifyToken, verifyRole(["Penjual"])] ,deleteHewan)

export default app