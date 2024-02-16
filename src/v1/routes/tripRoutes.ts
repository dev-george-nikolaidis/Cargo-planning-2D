import { Router } from "express";
import * as tripController from "../controller/tripController";
const router = Router();

router.post("/", tripController.index);

router.post("/show", tripController.show);
router.post("/store", tripController.store);
router.put("/update", tripController.update);
router.delete("/destroy", tripController.destroy);

export default router;
