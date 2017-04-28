*magma-client
maAllowsWriteBarrier
	"Dictionary's and Sets cannot because of the logical storage nature.  The internal array is not persistent, so sometimes at:put: does not cause the Dictionary itself to change, so the MaTransaction does not get sent #modified."
	^ false