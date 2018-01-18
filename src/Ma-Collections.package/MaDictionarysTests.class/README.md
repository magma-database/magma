before running tests , use:

MaDictionaryTest initDictClass: MaWeakValueDictionary

MaDictionaryTest initDictClass: MaWeakValueDictionary

tests for WeakKey/WeakIdentityKey dicts will fail (keys must be non nil, and some tests because of identity compatison )