const express = require('express');
const { sendMessage, getChatMessages } = require('../controllers/chatController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

// @route   POST /api/chat/send
// @desc    Send a message
// @access  Private
router.post('/send', authMiddleware, sendMessage);

// @route   GET /api/chat/:jobId
// @desc    Get chat messages
// @access  Private
router.get('/:jobId', authMiddleware, getChatMessages);

module.exports = router;
