const Chat = require('../models/Chat');

// @desc    Send a message
// @route   POST /api/chat/send
// @access  Private
exports.sendMessage = async (req, res) => {
    const { jobId, text } = req.body;

    try {
        const chat = await Chat.findOne({ jobId });

        if (!chat) {
            const newChat = new Chat({ jobId, messages: [{ senderId: req.user.id, text }] });
            await newChat.save();
        } else {
            chat.messages.push({ senderId: req.user.id, text });
            await chat.save();
        }

        res.status(201).json({ msg: 'Message sent' });
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};

// @desc    Get chat messages
// @route   GET /api/chat/:jobId
// @access  Private
exports.getChatMessages = async (req, res) => {
    try {
        const chat = await Chat.findOne({ jobId: req.params.jobId });
        if (!chat) return res.status(404).json({ msg: 'Chat not found' });

        res.status(200).json(chat.messages);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};
