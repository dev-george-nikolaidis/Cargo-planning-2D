import dotenv from "dotenv";
dotenv.config();

const devConfig = {
	// General
	port: process.env.PORT || 5000,

	logLevel: process.env.LOG_LEVEL,
	// Tokens
	accessTokenPrivateKey: process.env.ACCESS_TOKEN_PRIVATE_KEY,
	accessTokenPublicKey: process.env.ACCESS_TOKEN_PUBLIC_KEY,
	refreshTokenPrivateKey: process.env.REFRESH_PRIVATE_KEY,
	refreshTokenPublicKey: process.env.REFRESH_PUBLIC_KEY,
	// Database
	db: {
		host: process.env.DB_HOST,
		port: process.env.DB_PORT,
		user: process.env.DB_USER,
		password: process.env.DB_PASSWORD,
		dbName: process.env.DB_NAME,
	},
	// Email
	smtp: {
		user: "icqskc5mxzf3bwct@ethereal.email",
		pass: "mVSU79SbF3WmvGqy4V",
		host: "smtp.ethereal.email",
		port: 587,
		secure: false,
	},
};

export default devConfig;
