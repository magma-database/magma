*magma-client
maRefreshTo: aMaVariableObjectBuffer using: aMagmaSession 
	| save |
	"prevent GC of my items until we get it refreshed.."
	save := self copy.
	"prevent compiler from optimizing it out.."
	save size.
	self removeAll.
	aMaVariableObjectBuffer instVarsDoWithIndex:
		[ : each : x | self add: (aMagmaSession objectWithOid: each) ]