accessing
primitiveAttributeAt: aSymbol

	| assoc |

	^self
		uint: (assoc := self primitiveAttributeAddressesMap at: aSymbol) value
		at: assoc key
