private
materializeClassDefinitions
	"This is needed because, when opening the repository, the default classes do not include MagmaRepositoryDefinition, which is delivered as part of any session-connection.  When the system-session attempts to connect, it tries to read the repository-definition but can't because it can't get a proper read-strategy for it."

	[ session loadClassDefinitionsFrom: repository classDefinitionsByteArray ]
		on: Error
		do:
			[ : err | MagmaCorruptionError signal: err messageText ]