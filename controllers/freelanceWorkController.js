const FreelanceWork = require('../models/FreelanceWork');

// @desc    Create new freelance work
// @route   POST /api/freelance-work
// @access  Private (Job Provider only)
exports.createFreelanceWork = async (req, res) => {
    const { title, description, skills, budget } = req.body;

    try {
        const freelanceWork = new FreelanceWork({
            title,
            description,
            skills,
            budget,
            postedBy: req.user.id,
        });

        await freelanceWork.save();
        res.status(201).json(freelanceWork);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};

// @desc    Update freelance work status
// @route   PATCH /api/freelance-work/:id/status
// @access  Private (Job Provider only)
exports.updateFreelanceWorkStatus = async (req, res) => {
    const { id } = req.params;
    const { status } = req.body;

    try {
        const freelanceWork = await FreelanceWork.findByIdAndUpdate(
            id,
            { status },
            { new: true }
        );

        if (!freelanceWork) return res.status(404).json({ msg: 'Freelance work not found' });

        res.status(200).json(freelanceWork);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};
