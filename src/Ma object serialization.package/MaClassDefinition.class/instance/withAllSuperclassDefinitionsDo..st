actions
withAllSuperclassDefinitionsDo: oneArgBlock
	"Value oneArgBlock with myself, then each of my superclass-definitions, in turn."

	oneArgBlock value: self.
	superclassDefinition ifNotNil: [ superclassDefinition withAllSuperclassDefinitionsDo: oneArgBlock ]