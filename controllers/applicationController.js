const Application = require('../models/Application');

// @desc    Apply for freelance work
// @route   POST /api/applications
// @access  Private (Job Seeker only)
exports.applyForFreelanceWork = async (req, res) => {
    const { jobId } = req.body;

    try {
        const application = new Application({
            jobId,
            userId: req.user.id,
        });

        await application.save();
        res.status(201).json(application);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};

// @desc    Get my applications
// @route   GET /api/applications/my
// @access  Private (Job Seeker only)
exports.getMyApplications = async (req, res) => {
    try {
        const applications = await Application.find({ userId: req.user.id })
            .populate('jobId')
            .exec();

        res.status(200).json(applications);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};
