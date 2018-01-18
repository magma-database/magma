The oid ranges are as follows:

The range from (0 to: SmallInteger maxVal - SmallInteger minVal) are reserved for:  user objects, the non-integral atomics including 65536 characters and space for 4000000 new-object oids (bigger than any transaction should ever be!).  We should allow a few thousand for future-use as well.

SmallInteger minVal actually starts at the oid with the value SmallInteger maxVal + 1.  Thus, SmallInteger maxVal has the oid

We start at the bottom so user-objects are contiguous above 
 
  a   n u m b e r   l i n e
|<--- SmallInteger range -------------->|< - - - - - -  LargeInteger range - - - - - - - - - ->|
atomics | chars | new objects          |    user objects             | Floats | SmallIntegers  |

0
	nil
1
	false
2
	true
3
	indicate an unused slot in a MaHashIndex
4 to: 65539
	DB character-set (only SB currently supported)
65540 to: 66540
	future use?
66541 to: 66541 + 4000000  "no more than four-million new objects are allowed in a single commit."
	new-object oids
4066542 to: 281468533259712 (self oidForSmallestFloat-1)
	user objects
281468533259713 to: self oidForSmallestOptimizedInteger-1
	32-bit IEEE floats
281472829227008 to: 281474976710655
	SmallIntegers
