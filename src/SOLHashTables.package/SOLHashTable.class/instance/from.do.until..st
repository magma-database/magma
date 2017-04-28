enumerating
from: hashKey do: aBlock until: untilBlock 
	"For each Object from hashKey and higher, value aBlock as long as untilBlock evaluates true for the same object.."
	self find: hashKey.
	frame
		do:
			[ : eachNode | eachNode dummy ifFalse: [ aBlock value: eachNode ] ]
		until:
			[ : eachNode | eachNode dummy not and: [ untilBlock value: eachNode ] ]