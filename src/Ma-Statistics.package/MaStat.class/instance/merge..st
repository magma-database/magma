accessing
merge: aMaStat 
	"The same as +, except adds to the receiver directly rather than returning a new instance."
	self
		 adjustExtremes: aMaStat min ;
		 adjustExtremes: aMaStat max ;
		
		adjustCount: aMaStat count
		sum: aMaStat sum