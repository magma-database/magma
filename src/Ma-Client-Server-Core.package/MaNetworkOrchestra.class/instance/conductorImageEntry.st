private
conductorImageEntry
	^ FileDirectory default
		entryAt: self conductorImageName
		ifAbsent: [  ]