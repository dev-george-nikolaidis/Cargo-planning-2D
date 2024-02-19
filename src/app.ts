import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import routesV1 from "./v1/routes";
import log from "./v1/utils/logger";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());
app.use("/v1", routesV1);
app.use(routesV1);

const port = process.env.PORT;
app.listen(port, () => {
	log.info(`App started at http://localhost:${port}`);
});
