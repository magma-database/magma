initialize
initialize
	super initialize.
	stopwatch := Stopwatch new.
	unitsVerbPhrase := ' items processed.'.
	unitsCompleted := 0.
	log := OrderedCollection new.
	description := 'not running.'