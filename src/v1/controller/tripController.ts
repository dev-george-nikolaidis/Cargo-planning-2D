import { Request, Response } from "express";
import { RowDataPacket } from "mysql2";
import { db } from "../utils/dbConnection";

// @desc    show all trips
// @route    v1/trip/index
export async function index(req: Request<{}, {}, { userId: number }>, res: Response) {
	// we assume that  we already authenticate the user and parse the body!
	const userId = req.body.userId;

	try {
		const [trip] = await db.query<RowDataPacket[]>("SELECT id FROM trips WHERE user_id = ?", [userId]);
		if (trip.length === 0) {
			return res.status(404).json({ message: "trips not found" });
		}

		return res.json({
			trip,
		});
	} catch (error: any) {
		res.status(500).json({ message: error.message });
	}
}

// @desc    creates a trip
export async function store(req: Request, res: Response) {}

// @desc    fetch  single trip
// @route   v1/trip/show
export async function show(req: Request<{}, {}, { userId: number; tripId: number }>, res: Response) {
	// we assume that  we already authenticate the user and parse the body!
	const userId = req.body.userId;
	const tripId = req.body.tripId;

	try {
		const [trip] = await db.query<RowDataPacket[]>("SELECT * FROM trips WHERE id = ? AND user_id = ?", [tripId, userId]);
		const [tripOrders] = await db.query<RowDataPacket[]>(
			"SELECT trip_id, load_order_number , offload_order_number, quantity_of_pallets, start_destination, final_destination, pallet, customer_id FROM triporders WHERE trip_id = ?",
			[tripId]
		);

		if (trip.length === 0) {
			return res.status(404).json({ message: "trip not found" });
		}
		if (tripOrders.length === 0) {
			return res.status(404).json({ message: "Orders not found" });
		}

		return res.json({
			trip: trip[0],
			orders: tripOrders,
		});
	} catch (error: any) {
		res.status(500).json({ message: error.message });
	}
}

// @desc    update single trip
// @route   v1/trip/update
export async function update(req: Request, res: Response) {}

// @desc    delete  single trip
// @route   v1/trip/destroy
export async function destroy(req: Request, res: Response) {}
