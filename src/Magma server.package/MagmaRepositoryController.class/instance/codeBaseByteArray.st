private
codeBaseByteArray

	^Array
		with: repository classDefinitionsByteArray
		with: (serverSerializer serializeGraph: self definition codeBase) trimmedByteArray