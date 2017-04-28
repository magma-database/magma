private
initialize

	super initialize.
	socket :=
		MaServerSocket new
			server: self;
			yourself.
	nextId := 1.
	self initializeSerializer