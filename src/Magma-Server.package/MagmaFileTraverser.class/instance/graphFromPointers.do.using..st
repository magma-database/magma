private
graphFromPointers: aMaObjectBuffer do: oneArgBlock using: aMaReadStrategy
	"aMaObjectBuffer isPointers must be true to get here."

	aMaObjectBuffer instVarsDoWithIndex:
		[ :eachOid :index |
		self
			graphFrom: eachOid
			do: oneArgBlock
			using: aMaReadStrategy ]