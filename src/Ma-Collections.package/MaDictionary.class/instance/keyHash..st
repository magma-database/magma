private
keyHash: key
	"Expand key's hash into the range of positive SmallIntegers.  See PluggableSet class>>#integerSet."
	^ ((key hash \\ 1064164 * 1009) \\ array size) + 1