add / remove
at: key put: value
	"For collection api compatibility."
	self
		add: value
		at: key.
	^ value