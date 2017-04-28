accessing
classDefinitionsByteArray
	"When initially creating the repository, before even the system root is
	written, the classDefinitionsOid will be a new-object oid."

	| loid |

	^MaOidCalculator oidForNil = (loid := filer classDefinitionsOid)
		ifTrue:
			[ (self serverSerializer serializeGraph: repositoryController definition classDefinitions) trimmedByteArray ]
		ifFalse:
			[ self
				byteArrayAt: loid
				using: MaBasicReadStrategy deep "we need it all" ]