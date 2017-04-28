services
unload
	| methodMenuServiceCategory classMenuServiceCategory |
	methodMenuServiceCategory := ServiceRegistry current serviceWithId: #browserMethodMenu.
	methodMenuServiceCategory services copy do:
		[ : each | (#(#browseMethodVersionsInMc #browseMcMethodOrigin ) includes: each id) ifTrue: [ methodMenuServiceCategory services remove: each ] ].
	classMenuServiceCategory := ServiceRegistry current serviceWithId: #browserClassMenu.
	classMenuServiceCategory services copy do:
		[ : each | (#(#browseClassVersionsInMc #browseMcClassOrigin ) includes: each id) ifTrue: [ classMenuServiceCategory services remove: each ] ]