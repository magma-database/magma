as yet unclassified
forSourceCode
	"By default, we only look for method names when looking for methods.  This adds each methods sourceCode as an enumerator."

	^ self forMethods
		accessSelector: #sourceCode ;
		yourself