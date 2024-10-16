import express  from "express";
import { addHewan, changePicture, deleteHewan, getAllHewan, updateHewan } from "../Controllers/hewanController";
import { verifyAddHewan, verifyEditHewan } from "../Middlewares/verifyHewan";
import uploadFile from "../Middlewares/hewanUpload";

const app = express()
app.use(express.json())

app.get(`/get`, getAllHewan)
app.post(`/add`, [verifyAddHewan], addHewan)
app.put(`/update/:idHewan`, [verifyEditHewan], updateHewan)
app.put(`/pic/:id`, [uploadFile.single("picture")], changePicture)
app.delete(`/:idHewan`, deleteHewan)

export default app