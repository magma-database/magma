child process creation
command: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in
	the standard C library, except that aCommandString runs asynchronously
	in a child process. Answer an instance of ExternalOS2OSProcess which
	is a proxy for the new OS2 process."

	self notYetImplemented