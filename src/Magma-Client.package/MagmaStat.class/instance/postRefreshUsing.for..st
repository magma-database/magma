private
postRefreshUsing: aMaObjectBuffer for: aMagmaSession 
	"Filter MagmaStat's from being removed from the commitPackage when using WriteBarrier."
	aMagmaSession allowWriteBarrier ifFalse:
		[ super
			postRefreshUsing: aMaObjectBuffer
			for: aMagmaSession ]