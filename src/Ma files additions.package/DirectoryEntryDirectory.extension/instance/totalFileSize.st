*ma files additions
totalFileSize
	"Answer the cumulative size of all files and folders in the directories I contain, including their totalFileSize."
	^ self fileSizeStat sum ifNil: [ 0 ]