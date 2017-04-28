private
maTransientVariables 
	"Large-collection changes are processed separately in the server, therefore they are stored separately in the commit-package, therefore, we mark them transient."

	^ super maTransientVariables, #( 'session' 'changes' )