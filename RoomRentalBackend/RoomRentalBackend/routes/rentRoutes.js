import express from "express";
const router = express.Router();
import {
  addVehicleRent,
  getVehicleRentById,
  updateRentToPaid,
  updateVehicleToPicked,
  getMyRents,
  getRents,
} from "../controllers/rentController.js";
import { protect, admin } from "../middleware/authMiddleware.js";

router.route("/").post(protect, addVehicleRent).get(protect, admin, getRents);
router.route("/myrents").get(protect, getMyRents);
router.route("/:id").get(protect, getVehicleRentById);
router.route("/:id/rent").put(protect, updateRentToPaid);
router.route("/:id/pick").put(protect, admin, updateVehicleToPicked);

export default router;
