setup-teardown
validateProtocol
	"With the new fixed protocol, it is easy to forget when we start using a new class.  This method performs some quick checks but cannot guarantee the protocol is 100% correct."
	| expectedClasses otherSubclasses |
	expectedClasses := { 
		(MaObjectBuffer withAllSubclasses).
		(MagmaRepositoryRequest withAllSubclasses).
		(MagmaServerResult withAllSubclasses).
		(MagmaLocation withAllSubclasses).
		(MaTerm withAllSubclasses).
		(MagmaCollection withAllSubclasses).
		(MaError withAllSubclasses)
	 } 
		inject: OrderedCollection new
		into: [ : coll : each | coll addAll: each ].
	otherSubclasses := { 
		#MauiSoftwareError.
		#MakoUserError.
		#MauiUserError.
		#MagmaToolsUserError.
		#MakoSoftwareError.
		#MakoInvalidAccessAttemptError.
		#MakoEnvironmentError.
		#TephraUserError.  #TephraEnvironmentError.
		#MagmaPotentiallyOpenError
	 } 
		select: [ : each | Smalltalk hasClassNamed: each ]
		thenCollect: [ : each | Smalltalk classNamed: each ].
	expectedClasses removeAll: otherSubclasses.
	(expectedClasses difference: MagmaSession protocol) in: 
		[ : missing | 
		missing ifNotEmpty: 
			[ MagmaWarning signal: missing asArray asString , ' appear to be missing from the protocol.' ] ]