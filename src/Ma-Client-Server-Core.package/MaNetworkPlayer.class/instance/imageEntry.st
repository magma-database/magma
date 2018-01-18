private
imageEntry
	^ FileDirectory default
		entryAt: self imageName
		ifAbsent: [ nil ]