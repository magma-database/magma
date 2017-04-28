*magma-client
magmaOid
	^ self magmaSession ifNotNilDo: [ : sess | sess oidFor: self ]