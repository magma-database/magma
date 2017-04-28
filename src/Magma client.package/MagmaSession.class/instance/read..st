private
read: oid 
	"calls read:for:using: in server."
	^ self secondarySubmit: 
		(MaReadRequest new
			oid: oid ;
			readStrategy: self resetReadStrategy ;
			yourself)