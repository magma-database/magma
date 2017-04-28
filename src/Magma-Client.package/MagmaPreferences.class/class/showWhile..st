mouse cursor
showWhile: aBlock 
	"This class operates as a 'null cursor' that does not change the cursor, only evaluates aBlock."
	^ aBlock value