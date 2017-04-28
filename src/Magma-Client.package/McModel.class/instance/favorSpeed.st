initialize-release
favorSpeed
	"Use this option to employ a MagmaPreallocatedDictionary for canonicalization of all MCDefinitions, which takes up several hundred mega-bytes of disk space."
	(objects isNil or: [ objects isEmpty ]) ifFalse: [ MagmaUserError signal: 'This option can only be set on a new, empty codeBase.' ].
	objects := MagmaPreallocatedDictionary new