private
read: oid 
	"calls read:for:using: in server."
	self cleanIfTime.
	^ self secondarySubmit: 
		(MaReadRequest new
			oid: oid ;
			readStrategy: self resetReadStrategy ;
			yourself)