access
floodServerUntil: untilBlock 
	collection ifNil: [ collection := session root at: #collection ].
	session inTransaction ifFalse: [ session begin ].
	untilBlock whileFalse: [ self commitAnother ]