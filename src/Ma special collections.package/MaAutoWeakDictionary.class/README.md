I am a basic class for dictionaries which holding either keys or values weakly.
I can auto-clean myself after garbage collection.

I am using a special kind of associations , which appropriate for fast cleanup.
I am not removing an existing association objects physically, but rather marking them as empty,
so they can be reused later, when you want to add some more key/value pairs