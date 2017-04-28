private
maxBuckets 
	"squeak uses 12 bits for identity hash, using buckets more than 2^12 is pointless"
	^ 4096 " 2 raisedTo: 12 "

