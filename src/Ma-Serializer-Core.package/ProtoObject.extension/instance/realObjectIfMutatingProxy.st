*ma-serializer-core
realObjectIfMutatingProxy
	" If I am a MutatingProxy with a (cached) reified realObject, answer it. If I am a MutatingProxy without a reified realObject, invoke a session to materialize it.  Otherwise, answer myself."
	^ self