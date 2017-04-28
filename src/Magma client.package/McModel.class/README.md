A McModel is a large, object-oriented model of MC code elements.  Unlike MC repositories, which duplicate all definitions of each MCVersion, a McModel canonicalizes the definitions, so there is only one copy of that method from 2002 shared across all MCVersions..

When adding a new MCVersion to the system, the definitions are enumerated to see if there is an equivalent in my 'objects' and, if so, replace the one in the MCVersion with the canonicalized one.  The variable is called 'objects' instead of 'definitions' because we also store the MCVersions in there too for ultra-fast access to MCVersions.

#versionsOf: selectorSymbol in: className would answer the full method-history for that method, with ability to install any of them.
