printing
printString
	"Answer a String whose characters are a description of the receiver. 
	If you want to print without a character limit, use fullPrintString."

	^String streamContents: [ :s | self printOn: s ]