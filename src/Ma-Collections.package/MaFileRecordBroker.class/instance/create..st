file-specific
create: aFileStream

	file := aFileStream ifNil: [ ReadWriteStream on: (ByteArray new: 1000) ]