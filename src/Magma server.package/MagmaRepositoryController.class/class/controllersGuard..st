private
controllersGuard: aBlock 
	^ (ControllersGuard ifNil: [ self initializeControllersGuard ]) critical: aBlock