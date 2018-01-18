actions
allSuperclassDefinitionsDo: oneArgBlock
	"Value oneArgBlock with each of my superclass-definitions, in turn."

	superclassDefinition ifNotNil: [ superclassDefinition withAllSuperclassDefinitionsDo: oneArgBlock ]