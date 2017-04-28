private
physicalFlush
	^ fileStreams do: [ : each | each closed ifFalse: [ each flush ] ]