private
bufferPositionsDo: oneArgBlock 
	"Value oneArgBlock with the value of the starting position of each
	buffer in the receiver."
	| pos end |
	pos := self headerSize.
	end := self bufferSize - 1.
	[ pos <= end ] whileTrue:
		[ | physicalSize bufferClass |
		oneArgBlock value: pos.
		bufferClass := MaObjectBuffer
			bufferClassFor: byteArray
			startPos: pos.
		physicalSize := byteArray
			maUint: bufferClass sizeOfPhysicalSizeField
			at: pos + bufferClass bufferPositionOfPhysicalSize.
		pos := pos + physicalSize ]