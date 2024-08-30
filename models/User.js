const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  userName: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  phoneNumber: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  resumeLink: { type: String },  // NEW: Field to store resume link
  bio: { type: String },  // NEW: Field to store bio
  skills: { type: [String] },  // NEW: Array of strings to store skills
}, { timestamps: true });

module.exports = mongoose.model('User', UserSchema);
