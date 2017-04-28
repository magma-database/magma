*magma-client
magmaCommitNumber
	"The database buffer representing this object."
	^ self magmaBuffer ifNotNil: [ : buffer | buffer commitNumber ]