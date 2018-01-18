private
drawTheGrid
	(self maxPoint - self minPoint in:
		[ : ext | ext x isZero or: [ ext y isZero ] ]) ifFalse: [ grid drawOn: self form getCanvas ]