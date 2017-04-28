private
dontAcceptChangeLogging
	"This method answers the source code to compile a new method on MaObject class so that, when the 'Magma server' package is unloaded, it won't thrash the hard drive so much."
	^ 'acceptsLoggingOfCompilation
	^ false'