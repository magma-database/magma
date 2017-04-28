accessing
filenames
	^ super filenames , 
	(oidIndexes, keyIndexes collect: [ : each | repository directory localNameFor: each filename ])