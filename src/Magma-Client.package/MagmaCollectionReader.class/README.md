I represent a set of objects contained by a MagmaCollection satisfying my query 'expression'.  Though I am not a Collection, I can be thought of one in terms of reading objects (I can't add or remove any objects for you, but I can hand you my #collection who'll do it for you).

I am created by sending #where: to a MagmaCollection.  My #size is how many objects satisfy the query, which may take some time to compute if the where expression uses more than one range condition.

I am persistable in Magma just like any object.  I can be stored as a "pre-defined" query or something.  I'll work just fine after enduring storage and retrieval to a Magma database.