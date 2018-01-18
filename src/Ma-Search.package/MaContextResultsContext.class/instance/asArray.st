accessing
asArray
	| arr |
	arr := Array new: self size.
	1
		to: self size
		do:
			[ : n | arr
				at: n
				put:
					(self
						at: n
						ifAbsent: [ MaSoftwareError signal ]) ].
	^ arr