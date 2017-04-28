private
check: remoteObjectBuffer using: aMagmaClientConnection accumulatingConflictsInto: aMaFailedCommitResult 
	| magmaStatClassIds |
	magmaStatClassIds := self magmaStatClassIds.
	(serializer
		objectWithOid: remoteObjectBuffer oid
		ifAbsent: [  ]) ifNotNil:
		[ : proxy | proxy realObjectIfReified ifNotNil:
			[ : obj | ((transaction didChange: obj) and:
				[ (transaction
					didChange: obj
					from: remoteObjectBuffer) and: [ (magmaStatClassIds includes: remoteObjectBuffer classId) not ] ]) ifTrue:
				[ aMaFailedCommitResult
					recordObjectConflictWith: aMagmaClientConnection
					on: remoteObjectBuffer oid ] ] ]