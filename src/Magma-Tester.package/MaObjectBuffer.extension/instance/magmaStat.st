*magma-tester
magmaStat
	"Helpful for debugging MagmaStat.  Assuming I represent a MagmaStat, show my values mapped to its inst-vars."
^self oids withIndexCollect: [ : e : x | (MagmaStat allInstVarNames at: x) -> (MaOidCalculator infoFor: e)]