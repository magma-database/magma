My instances are records that faciliate the automatic recovery of Magma files when the server was interrupted by an external event such as a power-outage or sysadmin killing of my VM.

There are two types of recovery, forward and backward.  Backward recovery is necessary when a write operation only partially completed and files are in an inconsistent state.

In this case, there are four types of changes that can occur to a file that must be tracked:

	- the file was just created new (MaNewFileRecord), when recover we delete it.
	- updating bytes within an existing file (MaBeforeImageRecord).  When we recover we put those bytes back.
	- extending the length of a file with new bytes (MaFileGrowthRecord).  When we recover we truncate the file back to its original length.
	- an existing file is deleted.  To handle this we simply don't delete the file until the entire apply has completed and flushed successfully.

There are also two records which indicate the begin and end of the group of records for a single write operation.  My groupId associates all records for a particular write together.  Each of these records has a hash-checkSum calculated so that the recovery process can ensure the record was written wholly and correctly.

All of this is contained completely within my own ByteArray with the following format (0-based positions):

	--begin header--
	0 : physicalSize (4-bytes)
	4 : recordType (1 byte, high 4 bits reserved for future expansion bit, if necessary)
	5 to: headerSize-1 : ... other fields implemented by my subclasses ...
	--end header--
	headerSize to: n-21 : my #record (variable data, if appropriate)
	n-20 - checkSum (SHA1)
