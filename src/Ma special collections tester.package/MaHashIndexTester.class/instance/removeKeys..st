private actions
removeKeys: aCollection

	aCollection do: [ :each | self removeKey: each ]