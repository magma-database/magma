accessing
conflictMessage
	"This method demonstrates how the structure of a MaCommitResult might be utilized to
	provide a message to an end-user."

	| message |

	message := MaTextMessage new.
	commitConflicts do:
		[ :each |
		message
			append: each connection userId;
			append: ' has committed changes to ';
			appendProperlyPluralized: 'object'
				for: each conflictingOids size;
			append: ' with ';
			appendProperlyPluralized: 'oid'
				for: each conflictingOids size;
			space;
			appendAndedList: each conflictingOids;
			append: '; ' ].
	message append:
		' while you were working on those same objects.  Please review and reapply your changes if necessary.'.
	^message messageText

