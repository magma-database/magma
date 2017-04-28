*magma client
refresh: variableObject using: aMagmaSession
	"Collections require special-case behavior to handle this, dispatch."

	self instVarsDoWithIndex:
		[ : eachWord : eachIndex |
		variableObject
			instVarAt: eachIndex
			put: eachWord ]