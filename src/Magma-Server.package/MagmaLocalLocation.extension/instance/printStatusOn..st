*magma-server-private
printStatusOn: aStream 
	^ [ 'Connection successful, commit #:  ' , self newAdminSession remoteCommitNumber asString ]
		on: Error
		do: [ : err | 'FAILED:  ' , err messageText ]