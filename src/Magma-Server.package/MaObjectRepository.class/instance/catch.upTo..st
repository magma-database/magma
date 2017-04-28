high-availability
catch: thisBackupLocation upTo: primaryLocation 
	"Request batches of commit-log records and apply them to my repository.  When this method finishes successfully I will be caught up and the primary will be sending me the updates automatically."
	| session |
	session := primaryLocation newAdminSession.
	
	[ 
	[ 
	[ | serverResponse commitRecords done cn |
	repositoryController requestCritical: 
		[ serverResponse := session 
			warmBackupUpdatesFrom: (cn := self commitNumber + 1)
			for: thisBackupLocation.
		done := serverResponse value.
		commitRecords := serverResponse key.
		MagmaNotification signal: 'Catching up from primary, commitNumber:  ', cn asString.
		self applyCommitRecords: commitRecords.
		done ] ] whileFalse ] 
		on: MagmaUnavailableCommitRecord
		do: 
			[ : err | 
			"The warm backup must be re-established, page the DBA?"
			"pass the buck for now"
			err pass ] ] ensure: [ session ifNotNil: [ session disconnect ] ]