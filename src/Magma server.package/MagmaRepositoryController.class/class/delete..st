utilities
delete: pathStringOrMagmaLocalLocation 
	"Delete the just the files in fullyQualifiedPathString that are part of the Magma repository that resides there."
	pathStringOrMagmaLocalLocation asMagmaLocalLocation delete