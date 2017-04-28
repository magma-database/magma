private
createOutput: aMagmaLocalLocation 
	process description: 'Creating output repository at ' , aMagmaLocalLocation pathName.
	outputFiler := MaObjectFiler create: aMagmaLocalLocation directory