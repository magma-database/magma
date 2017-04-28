private-report generation
printTitleOn: aWriteStream 
	aWriteStream 
		withAttributes: { 
				(TextAlignment centered).
				(TextEmphasis underlined)
			 }
		do: [ aWriteStream maPrint: self pathName ]