import mongoose from "mongoose";

const rentSchema = mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "User",
    },
    rentItem: {
      name: {
        type: String,
        required: true,
      },
      image: {
        type: String,
        required: true,
      },
      price: {
        type: Number,
        required: true,
      },
      product: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "Product",
      },
    },
    rentPrice: {
      type: Number,
      required: true,
      default: 0.0,
    },
    durationFrom: {
      type: Date,
      required: true,
    },
    durationTo: {
      type: Date,
      required: true,
    },
    pickingAddress: {
      address: {
        type: String,
        required: true,
      },
      city: {
        type: String,
        required: true,
      },
      postalCode: {
        type: String,
        required: true,
      },
      country: {
        type: String,
        required: true,
      },
    },
    isRent: {
      type: Boolean,
      required: true,
      default: false,
    },
    rentAt: {
      type: Date,
    },
    isPickedUp: {
      type: Boolean,
      required: true,
      default: false,
    },
    pickedAt: {
      type: Date,
    },
  },
  {
    timestamps: true,
  }
);

const Rent = mongoose.model("Rent", rentSchema);

export default Rent;
