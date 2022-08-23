import asyncHandler from "express-async-handler";
import Rent from "../models/rentModel.js";

// @desc     Create new rent
// @route    POST api/rents
// @access   private
const addVehicleRent = asyncHandler(async (req, res) => {
  const { rentItem, pickingAddress, rentPrice, durationFrom, durationTo } =
    req.body;

  const rent = new Rent({
    rentItem,
    user: req.user._id,
    pickingAddress,
    rentPrice,
    durationFrom,
    durationTo,
  });

  const createRent = await rent.save();
  res.status(201).json(createRent);
});

// @desc     Get rent by id
// @route    GET api/rents/:id
// @access   Private
const getVehicleRentById = asyncHandler(async (req, res) => {
  const rent = await Rent.findById(req.params.id).populate(
    "user",
    "name email"
  );

  if (rent) {
    res.json(rent);
  } else {
    res.status(404);
    throw new Error("Rent not found");
  }
});

// @desc     Update vehicle to rent
// @route    PUT api/rents/:id/rent
// @access   Private
const updateRentToPaid = asyncHandler(async (req, res) => {
  const rent = await Rent.findById(req.params.id);
  if (rent) {
    rent.isRent = true;
    rent.rentAt = Date.now();

    const updatedRent = await rent.save();

    res.json(updatedRent);
  } else {
    res.status(404);
    throw new Error("Vehicle Rent not found");
  }
});

// @desc     Update vehicle to picked
// @route    PUT api/rents/:id/pick
// @access   Private/Admin
const updateVehicleToPicked = asyncHandler(async (req, res) => {
  const rent = await Rent.findById(req.params.id);

  if (rent) {
    rent.isPickedUp = true;
    rent.pickedAt = Date.now();

    const updatedRent = await rent.save();

    res.json(updatedRent);
  } else {
    res.status(404);
    throw new Error("Vehicle rent not found");
  }
});

// @desc     Get logged in user rents
// @route    GET api/rents/myrents
// @access   Private
const getMyRents = asyncHandler(async (req, res) => {
  const rents = await Rent.find({ user: req.user._id });

  res.json(rents);
});

// @desc     Get all rent
// @route    GET api/rents
// @access   Private/Admin
const getRents = asyncHandler(async (req, res) => {
  const rents = await Rent.find({}).populate("user", "id name");

  res.json(rents);
});

export {
  addVehicleRent,
  getVehicleRentById,
  updateRentToPaid,
  updateVehicleToPicked,
  getMyRents,
  getRents,
};
