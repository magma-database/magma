*magma-client
refresh: variableObject using: aMagmaSession includingLocal: aBoolean
	"Collections require special-case behavior to handle this, dispatch."
	self instVarsDoWithIndex:
		[ : eachWord : eachIndex |
		variableObject
			slotAt: eachIndex
			put: eachWord ]