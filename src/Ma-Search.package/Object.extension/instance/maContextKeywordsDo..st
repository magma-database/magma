*ma-search
maContextKeywordsDo: aBlock 
	"Override this method in subclasses to allow my instances to be found by the MaContext framework.  Just calculate whatever keywords you want for me and tell aBlock to #value: each of those keywords.  This will cause evaluation against the user-entered keywords and weigh the relevance of each particular instance accordingly."
	(self respondsTo: #mauiDefaultColumns)
		ifTrue:
			[ self mauiDefaultColumns do:
				[ : each | aBlock value: (self perform: each) mauiName ] ]
		ifFalse: [ aBlock value: self printString ]