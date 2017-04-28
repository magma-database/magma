This type of RecoveryRecord is used to restore any bytes in any file to their state prior to the beginning of the interrupted commit.

My #fileId identifies the file that was updated.

My #location provides information necessary to know *where* in the file I came from.

	... see superclass ...
	16 - file-position
	22 - the record
	... see superclass ...

I should not be created for updates to new files or for writes beyond the end of the file.