private
maPreferablyTheRealObject
	" If I am a MagmaMutatingProxy with a reified realObject, answer it, otherwise myself."
	^ realObject ifNil: [ self ]