This is an abstract class that allows contexts for objects that cannot implement #next, as required by MaSearchContext.

Instead, my subclasses do their enumeration in a separate process and populate my 'queue' which is then accessed with my #next.

So my subclasses, instead of implementing #next, they simply do their enumeration and call my #queue: method to add the objects to be scanned.