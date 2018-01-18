private
instanceVariablesString

	^ self stringForVariables: (instVarNames copyWithoutAll: superclassDefinition allInstVarNames)