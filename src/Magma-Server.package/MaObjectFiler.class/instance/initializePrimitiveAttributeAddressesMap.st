private
initializePrimitiveAttributeAddressesMap

	primitiveAttributeAddressesMap := Dictionary new
		at: #signature put: (Association key: 0 value: 64);
		at: 0 put: #signature ;

		at: #version put: (Association key: 8 value: 16);
		at: 2 put: #version ;

		at: #booleanFlags put: (Association key: 10 value: 8);
		at: 10 put: #booleanFlags ;

		at: #definitionOid put: (Association key: 11 value: 64);
		at: 11 put: #definitionOid ;

		"gap 19-26"
		at: #classDefinitionsOid put: (Association key: 27 value: 64) ;
		at: 27 put: #classDefinitionsOid ;

		at: #anchorOid put: (Association key: 43 value: 64);
		at: 43 put: #anchorOid ;

		at: #commitNumber put: (51 -> 48) ;
		at: 51 put: #commitNumber ;

		at: #branchCode put: (57->32) ;
		at: 57 put: #branchCode ;

		yourself