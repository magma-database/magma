When a MagmaCommitError is signaled, it will have a list of me in it so you can determine the cause of the conflict.  I describe what objects were in conflict (conflictingObjects) and who changed them (connection).

conflictingObjects only reflects what is still in your image (e.g., not GC'd).  conflictingOids contains the oid of every object that was in conflict.