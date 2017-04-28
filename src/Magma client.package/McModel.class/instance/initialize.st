initialize-release
initialize
	super initialize.
	"Everyone says, 'disk space is cheap', so default to speed."
	self favorSpeed..
	packages := Dictionary new.
	missingVersions := Set new