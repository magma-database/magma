accessing
unmerge: aMaStat 
	"The same as +, except adds to the receiver directly rather than returning a new instance."
	self
		 adjustExtremes: min ;
		 adjustExtremes: max ;
		
		adjustCount: aMaStat count negated
		sum: aMaStat sum negated