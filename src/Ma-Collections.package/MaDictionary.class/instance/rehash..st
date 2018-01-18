private
rehash: newSize
	| newArray index |
	"rehash"
	newArray := Array new: newSize.
	array do: [ :b | | next |
		next := b.
		[ next notNil ] whileTrue: [  | nn |
			nn := next next.
			index := self keyHash: next key size: newSize.
			next next: (newArray at: index).
			newArray at: index put: next.
			next := nn]
	].
	array := newArray.