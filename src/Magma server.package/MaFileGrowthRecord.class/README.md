I am used to track files that grow in size while applying a commit.  I record the #originalSize such that, during recovery, the file can be truncated: back to its original size.

I should not be created for new files.

	... see superclass ...
	16 - originalSize (6 bytes)
	... see superclass ...