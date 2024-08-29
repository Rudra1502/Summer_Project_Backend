const mongoose = require('mongoose');

const FreelanceWorkSchema = new mongoose.Schema({
    title: { type: String, required: true },
    description: { type: String, required: true },
    skills: { type: [String], required: true },
    budget: { type: Number, required: true },
    postedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    applicants: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
    status: { type: String, default: 'open' },
    completedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
}, { timestamps: true });

module.exports = mongoose.model('FreelanceWork', FreelanceWorkSchema);
