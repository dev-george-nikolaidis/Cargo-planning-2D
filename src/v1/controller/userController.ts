import { Request, Response } from "express";

// @desc    show all users
// @route    v1/user/index
export async function index(req: Request, res: Response) {}

// @desc    creates user
// @route   v1/user/store
export async function store(req: Request, res: Response) {}

// @desc    fetch the user
// @route   v1/user/show
export async function show(req: Request, res: Response) {}

// @desc    update the user
// @route   v1/user/update
export async function update(req: Request, res: Response) {}

// @desc    delete the user
// @route   v1/user/destroy
export async function destroy(req: Request, res: Response) {}
