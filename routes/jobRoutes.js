const express = require('express');
const { createJob, getJobs, applyToJob } = require('../controllers/jobController');
const { authMiddleware } = require('../middleware/authMiddleware');
const router = express.Router();

router.post('/', authMiddleware, createJob);
router.get('/', authMiddleware, getJobs);
router.post('/:jobId/apply', authMiddleware, applyToJob);

module.exports = router;
