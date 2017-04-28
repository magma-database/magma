enumerating (slow)
slowlyDo: oneArgBlock pageBoundariesDo: aBlock 
	"Unlike other slowlyDo: methods, this method does not lock me, so while you can get a large 'sampling', if the collection is changed while I'm enumerating, there's no guarantee you'll reach every element."
	self isNewCollection ifFalse: 
		[ changes additionsDo: [ : eachObject : eachHashes | oneArgBlock value: eachObject ] ].
	self segmentsDo: 
		[ : each | 
		each objects do: [ : eachObject | (changes hasRemoved: eachObject) ifFalse: [ oneArgBlock value: eachObject ] ].
		aBlock value ]