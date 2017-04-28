comparing
hash
	"try to be fast and avoid tons of collisions"
	^ attribute hash bitOr: (lowKey bitOr: highKey)