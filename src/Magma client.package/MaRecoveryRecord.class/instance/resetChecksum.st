private
resetChecksum
	"Calculate my checksum which is used during recovery to ensure my byteArray was written completely and correctly."
	self checkSum: self calculatedCheckSum