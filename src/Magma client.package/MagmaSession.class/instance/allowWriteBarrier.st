performance
allowWriteBarrier
	"Answers whether the WriteBarrier option is enabled, which can enable much improved performance."
	^ guard critical: [ preferences allowWriteBarrier ]