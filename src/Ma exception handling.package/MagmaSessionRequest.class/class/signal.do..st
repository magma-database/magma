private
signal: aString do: oneArgBlock
	"oneArgBlock takes the session that you wish to do something to."

	^self new
		messageText: aString;
		doBlock: oneArgBlock;
		signal