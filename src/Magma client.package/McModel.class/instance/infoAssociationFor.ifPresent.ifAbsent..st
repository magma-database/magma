private
infoAssociationFor: aMCVersionInfo ifPresent: foundBlock ifAbsent: absentBlock 
	^ objects
		associationAt: {#info. aMCVersionInfo}
		ifPresent: foundBlock
		ifAbsent: absentBlock