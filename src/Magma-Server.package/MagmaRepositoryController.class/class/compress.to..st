utilities
compress: sourceLocation to: targetLocation
	"sourceLocation and targetLocation may be either a String (relative or fully-qualified path) or a MagmaLocalLocation."
	(MagmaCompressor source: sourceLocation) compressTo: targetLocation