private
writerAt: filePosition 
	writers 
		from: filePosition
		do: [ : each | ^ (each coversFilePosition: filePosition) ifTrue: [ each ] ].
	^ nil