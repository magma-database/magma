private
height
	buckets ifNil: [^0].
	^(buckets depth) + 1