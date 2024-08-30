const User = require('../models/User');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');




// @desc    Register a user
// @route   POST /api/auth/register
// @access  Public
exports.registerUser = async (req, res) => {
    const { firstName, lastName, userName, email, phoneNumber, password} = req.body;

    try {
        // Check if user with email or username or phone number already exists
        const existingUser = await User.findOne({ $or: [{ email }, { userName }, { phoneNumber }] });
        if (existingUser) return res.status(400).json({ msg: 'User with given email, username or phone number already exists' });

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Create the new user
        const user = new User({
            firstName,
            lastName,
            userName,
            email,
            phoneNumber,
            password: hashedPassword,
        });

        // Save the user to the database
        await user.save();

        res.status(201).json({ msg: 'User registered successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};


// @desc    Authenticate user & get token
// @route   POST /api/auth/login
// @access  Public
exports.loginUser = async (req, res) => {
    const { email, password } = req.body;

    try {
        const user = await User.findOne({ email });
        if (!user) return res.status(400).json({ msg: 'Invalid credentials' });

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ msg: 'Invalid credentials' });

        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: '1h' });
        res.json({ token });
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};
