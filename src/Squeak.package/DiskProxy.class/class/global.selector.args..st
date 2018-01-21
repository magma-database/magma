instance creation
global: globalNameSymbol selector: selectorSymbol args: argArray
    "Create a new DiskProxy constructor with the given
     globalNameSymbol, selectorSymbol, and argument Array.
     It will internalize itself by looking up the global object name
     in the SystemDictionary (Smalltalk) and sending it this message
     with these arguments."

    ^ self new global: globalNameSymbol
             selector: selectorSymbol
                 args: argArray