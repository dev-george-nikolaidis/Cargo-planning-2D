import express from "express";
import tripRoutes from "./tripRoutes";
import userRoutes from "./userRoutes";
const routesV1 = express.Router();

routesV1.use("/user", userRoutes);
routesV1.use("/trip", tripRoutes);

export default routesV1;
