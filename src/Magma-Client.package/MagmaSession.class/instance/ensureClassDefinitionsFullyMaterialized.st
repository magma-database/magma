private
ensureClassDefinitionsFullyMaterialized
	serializer classDefinitionsById do: [ : eachColl | eachColl do: [ : eachDef | eachDef yourself ] ]