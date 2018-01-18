I monitor background processes and allow their priorities to be adjusted, paused and resumed.

To use, create with my #doBlock constructor.  The doBlock should set up and signal a MaProgressor just before starting the monitored work.  This will allow me to capture that progressor and report its attributes.  During the work, update the progressor's attributes.

	self example1

