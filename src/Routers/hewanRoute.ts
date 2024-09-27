import express  from "express";
import { addHewan, deleteHewan, getAllHewan, updateHewan } from "../Controllers/hewanController";
import { verifyAddHewan, verifyEditHewan } from "../Middlewares/verifyHewan";

const app = express()
app.use(express.json())

app.get(`/`, getAllHewan)
app.post(`/`, [verifyAddHewan], addHewan)
app.put(`/:idHewan`, [verifyEditHewan], updateHewan)
app.delete(`/:idHewan`, deleteHewan)

export default app