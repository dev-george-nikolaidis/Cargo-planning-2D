import dayjs from "dayjs";
import logger from "pino";
import devConfig from "../config/default";

const log = logger({
	transport: {
		target: "pino-pretty",
	},
	level: devConfig.logLevel,
	base: {
		pid: false,
	},

	timestamp: () => `,"time":"${dayjs().format()}"`,
});

export default log;
