maui
mauiName
	^ String streamContents: 
		[ : stream | 
		stream
			maPrint: self oid ;
			maPrint: ' - ' ;
			maPrint: self bufferPrintString ]