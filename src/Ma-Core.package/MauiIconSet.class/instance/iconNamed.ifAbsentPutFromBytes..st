private
iconNamed: selectorSymbol ifAbsentPutFromBytes: aReadStream 
	^ (SketchMorph withForm:
		(forms
			at: selectorSymbol
			ifAbsent:
				[ self
					iconNamed: selectorSymbol
					put: (Form fromBinaryStream: aReadStream) ]) deepCopy)
		 keepAspectRatio: true ;
		 yourself