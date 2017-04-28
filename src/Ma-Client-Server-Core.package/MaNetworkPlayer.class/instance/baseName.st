private
baseName
	^ orchestra name , '-' ,
		(orchestra onePlayerImage
			ifTrue: [ 'player' ]
			ifFalse: [ name ])