A MaObjectSerializer serializes any object into a bytes and back.  Transforming an object into bytes is useful for storing it on disk or sending it over the network.

A primary feature of this serializer is that it stores in a first-class buffer format.  There is a hierarchy of buffers for storing the various kinds of objects:  named inst-vars, indexed-vars, named + indexed, bytes, words, and a special one for CompiledMethods and MethodContexts.

First-class buffers allows object graphs to be "walked" similarly to the way the standard Smalltalk object-model is walked.
