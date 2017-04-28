writebarrier
validateWriteBarrier: aBoolean
	"We can't allow them to stop using the writeBarrier in the middle of a transaction in which objects are already changed.."

	aBoolean
		ifFalse:
			[ commitPackage objects notEmpty
				ifTrue:
					[ MagmaUserError signal: 'Cannot stop using writeBarrier in the middle of a transaction.' ] ]