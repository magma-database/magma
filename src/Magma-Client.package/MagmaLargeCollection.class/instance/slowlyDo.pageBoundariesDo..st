enumerating (slow)
slowlyDo: oneArgBlock pageBoundariesDo: aBlock 
	"Unlike other enumeration methods, this method does not lock me, so while you can get a large 'sampling', if the collection is changed while I'm enumerating, there's no guarantee you'll reach every element."
	self subclassResponsibility