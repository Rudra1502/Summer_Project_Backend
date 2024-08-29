const express = require('express');
const { check } = require('express-validator');
const multer = require('multer');
const { registerUser, loginUser, getUserProfile } = require('../controllers/userController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

// Configure multer for resume uploads
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/resumes/');
    },
    filename: function (req, file, cb) {
        cb(null, `${Date.now()}-${file.originalname}`);
    }
});

const upload = multer({ 
    storage: storage,
    limits: { fileSize: 5 * 1024 * 1024 }, // 5MB limit
    fileFilter: (req, file, cb) => {
        if (!file.mimetype.includes('pdf')) {
            return cb(new Error('Only PDFs are allowed'), false);
        }
        cb(null, true);
    }
});

// @route    POST /api/users/register
// @desc     Register user
// @access   Public
router.post(
    '/register',
    upload.single('resume'), // Middleware for handling resume upload
    [
        check('name', 'Name is required').not().isEmpty(),
        check('email', 'Please include a valid email').isEmail(),
        check('password', 'Please enter a password with 6 or more characters').isLength({ min: 6 }),
        check('role', 'Role is required').isIn(['job-seeker', 'job-provider']),
    ],
    registerUser
);

// @route    POST /api/users/login
// @desc     Authenticate user & get token
// @access   Public
router.post(
    '/login',
    [
        check('email', 'Please include a valid email').isEmail(),
        check('password', 'Password is required').exists(),
    ],
    loginUser
);

// @route    GET /api/users/me
// @desc     Get logged in user
// @access   Private
router.get('/me', authMiddleware, getUserProfile);

module.exports = router;
