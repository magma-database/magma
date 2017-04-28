A McModel is a large, object-oriented model of MC code elements.  Unlike MC repositories, which duplicate all definitions of each MCVersion, a McModel canonicalizes the definitions, so there is only one copy of that method from 2002 shared across all MCVersions..

#historyOf: aMCDefinition provides the full method-history for that method across all MCVersions, with ability to install any of them.  #originOf: aMCDefinition allows the version notes for any method or class definition to be readily obtained.

Monticello provides no physical implementation of its model -- it is strictly logical.  For example, MCPackage does not physically reference its collection of MCVersions.  It only knows its name and only by methods looking at MCRepository's can the versions be determined.

Therefore, rather than implement an entire object model that wraps the MC objects to provide the physical relationships, McModel instead establishes all relationships via one large MagmaDictionary referenced by its 'objects' instance-variable.  This dictionary is used to track a variety of relationships:

	"All versions for a package name"
	packageName -> MagmaArray of MCVersions

	"For canonicalized Infos"
	{#info. aMCVersionInfo} -> aMCVersionInfo

	"Versions by id (UUID)"
	uuid id -> aMCVersion

	"Versions by versionName, Configurations by name."
	versionName -> aMCVersion or aMCConfiguration

	"For canonicalized Definitions."
	{#definition. aMCDefinition} -> aMCDefinition

	"History of a particular definition"
	MCDefinition description -> OC of MCDefinitions

	"oldest-known version to refer to a particular def"
	{#origin. aMCDefinition} -> aMCVersion
