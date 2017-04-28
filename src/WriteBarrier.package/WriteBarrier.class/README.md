A WriteBarrier provides a way to watch for changes to the state of individual objects.  Any objects that you #add: to a WriteBarrier will be modified in the following ways:

- their class will be changed to be a new, anonymous subclass of whatever their class was before.  For example, if you #add: an Array to a WriteBarrier, it will now be of class "Array with write barrier", which is a subclass of Array (although it won't show up in "Array subclasses").
- any methods that potentially modify instance variables will be overriden in this new class.  The overridden method stores the original values of the instance variable in temps, then calls the super method, and then compares the current inst var values with the originals.
- If the instance variable values have changed, the WriteBarrier will be notified with a send to #modified:, with the object that was modified as the single argument.
- For variably-sized classes, #at:put: is also overridden to provide the same notification.
- the new class will override #isBehindWriteBarrier to return true, and will implement #writeBarrier to return the WriteBarrier instance.

The default implementation of #modified: doesn't do anything.  DirtySetWriteBarrier is a subclass that overrides #modified: to maintain a set of objects that have recently changed.  You may wish to create your own subclass with an alternate implementation.

Notes:
- You can only add any given object to one WriteBarrier.  If you try to add it to a second one, you will get an error.
- The classes of any objects you add to a WriteBarrier will be made uncompact.  For most compact classes (Array, String, Point, etc) the only effect this should have is to increase your image size by a few percent.  For some classes (CompiledMethod, MethodContext), the results are less predictable, and so adding them to a WriteBarrier is not supported.
- Because it's special cased by the VM, sending #class to an object will return the special anonymous class.  However, sending #species will still return the normal class (or whatever #species would have returned normally).
- The WriteBarrier is semi-permeable: if you want to modify an object directly without triggering notifications, you can use #instVarAt:put: and #basicAt:put:.