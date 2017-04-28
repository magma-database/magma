private
primitiveAttributeAt: aSymbol put: anInteger

	| assoc |

	self
		uint: (assoc := self primitiveAttributeAddressesMap at: aSymbol) value
		at: assoc key
		put: anInteger
