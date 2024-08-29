const mongoose = require('mongoose');

const ChatSchema = new mongoose.Schema({
    jobId: { type: mongoose.Schema.Types.ObjectId, ref: 'FreelanceWork' },
    messages: [{
        senderId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
        text: { type: String, required: true },
        createdAt: { type: Date, default: Date.now },
    }],
});

module.exports = mongoose.model('Chat', ChatSchema);
