private
reverseString: aString
	self notify: 'reversing ', aString.
	1 to: aString size // 2 do:
		[ :eachPosition |
		aString 
			swap: eachPosition 
			with: (aString size - eachPosition + 1) ]