testing
supportsAutoCleaning
	"Answer whether this image can support auto-cleaning weak dictionary's.  This requires Igor's finalization enhancement produced in Q1/2010."
	^ IsSupported ifNil: [ IsSupported := self determineIfSupported ]