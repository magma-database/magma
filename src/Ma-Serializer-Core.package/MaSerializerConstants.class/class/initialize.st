as yet unclassified
initialize
	OidForNil := MaOidCalculator oidForNil.
	OidForFalse := MaOidCalculator oidForFalse.
	OidForTrue := MaOidCalculator oidForTrue.
	OidForZero :=  MaOidCalculator oidForZero.
	FirstNewObjectOid := MaOidCalculator newOidMinimum.
	LastNewObjectOid := MaOidCalculator firstUserObjectOid-1.
	FirstUserObjectOid := MaOidCalculator firstUserObjectOid.
	LastUserObjectOid := MaOidCalculator lastUserObjectOid.
	FirstCharacterOid := MaOidCalculator firstCharacterOid.
	LastCharacterOid := MaOidCalculator lastCharacterOid.
	FirstFloatOid := MaOidCalculator oidForSmallestFloat.
	LastFloatOid := MaOidCalculator oidForSmallestOptimizedInteger - 1.
	"Hardcoded values to smooth transition to 64-bit Squeak..??  Although I guess it will still dispatch to the wrong class for serialization/materialization."
	FirstSmallIntegerOid :=  281472829227008 "MaOidCalculator oidForInteger: SmallInteger minVal".
	LastSmallIntegerOid := 281474976710655 "MaOidCalculator oidForInteger: SmallInteger minVal".