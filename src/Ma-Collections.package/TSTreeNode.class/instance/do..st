private
do: aBlock
	self nodesDo: [:ea | ea value ifNotNil: aBlock]