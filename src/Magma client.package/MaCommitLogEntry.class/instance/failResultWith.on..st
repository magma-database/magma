private
failResultWith: aMagmaClientConnection on: oidInteger

	result :=
		result asFailedResult
			recordObjectConflictWith: aMagmaClientConnection
			on: oidInteger