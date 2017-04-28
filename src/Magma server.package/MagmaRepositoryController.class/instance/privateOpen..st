private
privateOpen: aMagmaLocalLocation 
	self isOpen ifTrue: 
		[ MagmaUserError signal: 'Repository ' , aMagmaLocalLocation asString , ' is already open.' ].
	MagmaNotification signal: 'opening Magma repository ' , self pathName.
	self
		initializeSession ;
		repository: 
			(MaObjectRepository 
				open: aMagmaLocalLocation directory
				controller: self).
	self restoreMode ifFalse: [ self ensurePotentiallyOpenIndicator ].
	self postOpenInitialize