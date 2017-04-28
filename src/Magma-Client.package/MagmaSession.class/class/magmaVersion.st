accessing
magmaVersion
	"Version 12 extended the MaRecoveryRecords #physicalSize to 4 bytes.
	In version 13, the structure of MaCompiledMethodStorage was changed.  This was a manual domain conversion for each application.
	Version 14 expands MaObjectBuffer >> #physicalSize to 4-bytes (plus 3 bytes of filler).
	Version 15 was due to a totally new implementation of MagmaDictionary that no longer inherits from MagmaCollection.
	Version 16 is to support CompiledMethods, MethodContexts and BlockClosures in Ma object serialization's native buffer format.  This resulted in Array's and all other isVariable classes to be moved to MaFixedObjectBuffer (which might be renamed to MaPointerObjectBuffer).
	Version 17 renames MaClause to MagmaClause.  Please run upgradeTo17At:"
	^ 17