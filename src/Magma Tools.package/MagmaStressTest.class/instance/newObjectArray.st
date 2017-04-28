private
newObjectArray
	^ (1 to: config objectsPerCommit) collect: [ : each | Object new ]