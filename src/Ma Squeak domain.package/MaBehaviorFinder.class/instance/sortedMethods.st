methods
sortedMethods
	"Answer my methods sorted by selector."
	^ methods asSortedCollection: [ : a : b | a selector < b selector ]