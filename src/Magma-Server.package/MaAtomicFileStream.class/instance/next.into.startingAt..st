filestream api
next: n into: aByteArray startingAt: startIndex 
	"This method is only called when the initial read of an object did not fit within the #trackSize."
	| writer |
	guard critical: 
		[ (writer := self writerAt: position) 
			ifNil: 
				[ self 
					streamAt: position
					withRelativePositionDo: 
						[ : physicalStream : relativePosition | 
						self renewAccess: physicalStream.
						physicalStream 
							next: n
							into: aByteArray
							startingAt: startIndex ]
					ifNone: [ MaSoftwareError signal: 'unexpected EOF - ' , position printString ] ]
			ifNotNil: 
				[ aByteArray 
					replaceFrom: startIndex
					to: startIndex + (n min: writer byteArray size) - 1
					with: writer byteArray
					startingAt: position - writer filePos + 1 ].
		position := position + n ]