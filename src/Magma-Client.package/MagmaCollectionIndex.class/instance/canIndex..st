testing
canIndex: anObject 
	"MutatingProxy's respond to #respondsTo:, ensure we send it to the domain object."
	^ anObject yourself respondsTo: attribute yourself