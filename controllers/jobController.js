const Job = require('../models/Job');

exports.createJob = async (req, res) => {
  const { title, description, skills, budget } = req.body;

  try {
    const job = new Job({ title, description, skills, budget, postedBy: req.user.userId });
    await job.save();
    res.status(201).json(job);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getJobs = async (req, res) => {
  try {
    const jobs = await Job.find().populate('postedBy', 'name email');
    res.status(200).json(jobs);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.applyToJob = async (req, res) => {
  const jobId = req.params.jobId;

  try {
    const job = await Job.findById(jobId);
    if (!job) return res.status(404).json({ message: 'Job not found' });

    job.applicants.push({ user: req.user.userId });
    await job.save();

    res.status(200).json({ message: 'Application submitted' });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};
