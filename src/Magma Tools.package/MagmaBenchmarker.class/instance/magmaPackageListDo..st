capture context
magmaPackageListDo: oneArgBlock 
	^ { 
		(MaExceptionHandlingPackageInfo packageName).
		'Ma base additions'.
		'Ma proxy support'.
		'Ma traverse object graphs'.
		'Ma Statistics'.
		'Ma object serialization'.
		'Collections-BTree'.
		'Ma special collections'.
		'Ma client server'.
		'WriteBarrier'.
		'Magma client'.
		'Magma server'
	 } do: oneArgBlock