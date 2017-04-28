Sometimes new files are created during a commit.  If a disaster happens before that commit finishes then, upon recovery, those files should be deleted.

I record the #filename of the file that should be deleted.

	... see superclass ...
	16 - filename (variable length)
	... see superclass ...