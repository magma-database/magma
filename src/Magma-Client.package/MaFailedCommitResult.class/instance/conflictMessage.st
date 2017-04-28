accessing
conflictMessage
	"This method demonstrates how the structure of a MaCommitResult might be utilized to
	provide a message to an end-user."
	^ String streamContents:
		[ : stream | commitConflicts do:
			[ : each | stream
				 maPrint: each connection userId ;
				 maPrint: ' has committed changes to ' ;
				
				appendProperlyPluralized: 'object'
				for: each conflictingOids size ;
				 maPrint: ' with ' ;
				
				maPrint: 'oid'
				pluralizeIf: [ each conflictingOids size > 1 ] ;
				 space ;
				 appendAndedList: each conflictingOids ;
				 maPrint: '; ' ].
		stream maPrint: ' while you were working on those same objects.  Please review and reapply your changes if necessary.' ]