private
positionOfVersion1Indicator
	"The first version of MaHashIndex did not have the foresight to include a version indicator.  However, position 0 of the header is the keySize, which can never be 0.  Therefore, version 2+ reserves position 0 for the 'version 1 indicator', which, if 0, is NOT version 1, if it is >0, it *is* verison 1."
	^ 0