creation
establishReferencesFrom: anObject using: aMaObjectSerializer
	"This is the second-stage of materializing anObject.  The first stage populated its instVars with oids, this stage now replaces those oids with the actual objects.  Typically, only Fixed and VariableObject buffers will need to do anything on this."