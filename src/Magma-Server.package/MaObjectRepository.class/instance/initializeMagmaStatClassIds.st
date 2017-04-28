initialize-release
initializeMagmaStatClassIds
	"The filer must know what the classId for MagmaStat and all subclasses are, so it can properly do prewriteAdjustmentTo: bufferBeingCommitted from: thePersistentBuffer."
	| ids mustRewrite |
	ids := repositoryController session magmaStatClassIds.
	mustRewrite := ids difference: filer magmaStatClassIds.
	filer magmaStatClassIds addAll: ids.
	^ mustRewrite