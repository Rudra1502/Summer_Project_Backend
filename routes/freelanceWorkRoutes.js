const express = require('express');
const {
    createFreelanceWork,
    updateFreelanceWorkStatus,
} = require('../controllers/freelanceWorkController');
const authMiddleware = require('../middleware/authMiddleware');
const { check } = require('express-validator');

const router = express.Router();

// @route   POST /api/freelance-work
// @desc    Create new freelance work
// @access  Private (Job Provider only)
router.post(
    '/',
    [
        authMiddleware,
        check('title', 'Title is required').not().isEmpty(),
        check('description', 'Description is required').not().isEmpty(),
        check('skills', 'Skills are required').isArray().notEmpty(),
        check('budget', 'Budget is required').isNumeric(),
    ],
    createFreelanceWork
);

// @route   PATCH /api/freelance-work/:id/status
// @desc    Update the status of freelance work
// @access  Private (Job Provider only)
router.patch('/:id/status', authMiddleware, updateFreelanceWorkStatus);

module.exports = router;
