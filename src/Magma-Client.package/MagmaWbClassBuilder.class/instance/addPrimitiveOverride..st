as yet unclassified
addPrimitiveOverride: methodSelector 
	| mb |
	mb := WBMethodBuilder
		selector: methodSelector
		class: class
		fields: Array empty.
	mb
		 generateSignature ;
		 generateTemporaryDeclarations ;
		 generateCallSuperSendingToArgs: #realObjectIfMutatingProxy ;
		 generateReturn.
	class
		compileSilently: mb streamContents
		classified: 'overriding'