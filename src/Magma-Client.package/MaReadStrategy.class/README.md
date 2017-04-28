When objects are retrieved from a Magma repository, the server must eventually decide to stop traversing the graph and return a reasonable chunk of objects.  Sometimes, the default pattern of reading may be ineffecient for the processing needed.

Therefore, my instances can be used to suggest to the server a particular depth for particular class or even a variable within a class.

Implementation notes:

There are two parts; 'specifications' and 'depths'.  The specifications track what the user wants, while the depths are the efficiently-integerized representation for each MaClassDefinition (and version).  That's why there are not more first-class objects here, MaObjectSerializer is efficient with #'s (although now with the server caching it's probably no longer an excuse).  Whenever the specs change, or when the ClassDefinitions change the depths need to be rebuilt.  That's what my #isNew api is all about.

When transmitted to the server, it caches me there and I am then told to #beOld.  But only my depths are actually transmitted for further efficiency.  My '*magma server' methods are employed to determine the depth on the server.

Use my 'building' methods so that the Testing methods can then answer whether a particular depth should be read on a particular object or class.
