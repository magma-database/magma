overriding
nextRecordNumber

	^ (file size - self headerSize) / recordSize