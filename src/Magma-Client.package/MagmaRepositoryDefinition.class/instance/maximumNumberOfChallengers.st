settings
maximumNumberOfChallengers
	"Answer the maximum number of commit entry's Magma should allow in each users session before that session will be terminated.  Commit entry's are records stored in the servers memory that record the objects changed by each user.  When a session is in a transaction, these entries 'pile up', consuming server memory.  Only when the client crosses a transaction boundary (i.e., begin, commit or abort) is the log for that session cleared."

	^maximumNumberOfChallengers
