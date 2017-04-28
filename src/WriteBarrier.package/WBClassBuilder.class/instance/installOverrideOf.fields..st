private
installOverrideOf: aSymbol fields: anArray
	class addSelectorSilently: aSymbol withMethod:
		(WBMethodBuilder selector: aSymbol class: class fields: anArray)
			compiledMethod.
	fieldsCache at: aSymbol put: anArray