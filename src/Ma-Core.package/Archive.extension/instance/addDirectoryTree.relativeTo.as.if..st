*ma-core
addDirectoryTree: aFileDirectory relativeTo: baseFileDirectory as: prefixString if: conditionBlock 
	aFileDirectory directoryTreeDo:
		[ : path | (conditionBlock value: path) ifTrue:
			[ | eachEntry relativeName |
			eachEntry := path last.
			relativeName := prefixString, (eachEntry containingDirectory
				maNameFor: eachEntry name
				relativeTo: baseFileDirectory).
			relativeName ifNotEmpty:
				[ eachEntry isDirectory
					ifTrue:
						[ "self
							addDirectory: eachEntry fullName
							as: relativeName" ]
					ifFalse:
						[ self
							addFile: eachEntry fullName
							as: relativeName ] ] ] ]