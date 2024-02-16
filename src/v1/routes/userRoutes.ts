import { Router } from "express";
import * as userController from "../controller/userController";
const router = Router();

router.post("/", userController.index);

router.post("/show", userController.show);
router.post("/store", userController.store);
router.put("/update", userController.update);
router.delete("/destroy", userController.destroy);

export default router;
