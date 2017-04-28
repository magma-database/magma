private
linksDo: aBlock 
	aBlock value: primaryLink.
	secondaryLink ~~ primaryLink ifTrue: [ aBlock value: secondaryLink ]