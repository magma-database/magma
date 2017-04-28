filestream api
next: numberOfBytes putAll: aByteArray startingAt: startPos

	"This isn't needed for Magma, and I don't feel like implementing it right now.  Better to just give an explicit error than get it wrong."

	self error: 'not supported'