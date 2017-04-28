*magma client
maRefreshTo: aMaVariableObjectBuffer using: aMagmaSession

	| save |
	save := self copy.  "prevent GC of my items until we get it refreshed.."
	save size.   "prevent compiler from optimizing it out.."
	self removeAll.
	aMaVariableObjectBuffer instVarsDoWithIndex:
		[ : each : x |
		self add: (
			aMagmaSession
				objectWithOid: each
				ifAbsent: [ self error: 'shoud be present' ]) realObjectIfMutatingProxy ]