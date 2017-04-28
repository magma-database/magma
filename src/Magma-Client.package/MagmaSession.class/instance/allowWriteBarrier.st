performance
allowWriteBarrier
	"Answers whether the WriteBarrier option is enabled, which can enable much improved performance."
	"Not guarded because this needs to perform and it seems very unlikely we would be flipping WB in a background process."
	^ preferences allowWriteBarrier