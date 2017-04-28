as yet unclassified
installOverrideOf: aSymbol fields: anArray

	class 
		addSelectorSilently: aSymbol 
		withMethod:
			(MagmaWbMethodBuilder 
				selector: aSymbol 
				class: class 
				fields: anArray) compiledMethod.
	fieldsCache at: aSymbol put: anArray