I am an abstract class for the types of records that, on recovery, require rollback of some particular file.  My fileId identifies which file it is.

	... see superclass ...
	5 - groupId (3 bytes), a number identifying a group of writes
	... subclasses may add more fields ...
