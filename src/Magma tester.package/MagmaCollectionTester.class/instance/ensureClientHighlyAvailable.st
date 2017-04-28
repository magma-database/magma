test high-availability function
ensureClientHighlyAvailable
	"Clients at this point are committing to primary.  Force HA recognition by attempting read from primary."
	clientSession root.
	self assert: clientSession isHighlyAvailable