private
open: aMagmaLocalLocation 
	localLocation := aMagmaLocalLocation.
	self class controllersGuard: [ self open ].
	self updatePrimaryLocation: aMagmaLocalLocation