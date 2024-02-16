import mysql from "mysql2";
import devConfig from "../config/default";

const {
	db: { host, port, user, password, dbName },
} = devConfig;

const pool = mysql.createPool({
	host: host,
	port: Number(port),
	user: user,
	password: password,
	database: dbName,
});

export const db = pool.promise();
