initialize-release
favorDiskSpace
	"This option is about half as fast as the #favorSpeed option, but does not take up any more disk space than necessary."
	(objects isNil or: [ objects isEmpty ]) ifFalse: [ MagmaUserError signal: 'This option can only be set on a new, empty codeBase.' ].
	objects := MagmaDictionary new