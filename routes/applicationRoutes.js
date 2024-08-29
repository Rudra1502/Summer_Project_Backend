const express = require('express');
const { applyForFreelanceWork, getMyApplications } = require('../controllers/applicationController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

// @route   POST /api/applications
// @desc    Apply for freelance work
// @access  Private (Job Seeker only)
router.post('/', authMiddleware, applyForFreelanceWork);

// @route   GET /api/applications/my
// @desc    Get freelance works applied by the user
// @access  Private (Job Seeker only)
router.get('/my', authMiddleware, getMyApplications);

module.exports = router;
