as yet unclassified
readmeText
	^ 'I am a general object serialization and materialization framework.  Currently, I convert objects to ByteArrays and back.  I am used by both the "Ma client server" and "Magma" packages.  I offer a lot of flexibility in the way objects are serialized and materialized, even to the way the object graphs are traversed during serialization (courtesy of "Ma object traversal").

The major class is MaObjectSerializer, see it for more information.  It utilizes a MaOidManager, a MaClassIdManager, and a MaObjectGraphTraversalStrategy to create a MaSerializedGraphBuffer, the final object that wraps the ByteArray.'