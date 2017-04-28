This class encapsulates an object that has a fixed-size.  Most objects are fixed-size.  My 0-based buffer fields are:

	(see superclass)
	16 = classVersion (2 bytes)
	18 = first instance-variable
	
		OR (in Magma only)

	16 = commitNumber (6 bytes)
	22 = filler (6 bytes)
	28 = classVersion (2 bytes)
	30 = first instance-variable
