private
freeSomeSpace
	"Called by LowSpaceWatcher.  See #lowSpaceWatcher."
	"lowSpaceWatcher requires SOME space to be freed to avoid the debugger on LowSpaceSignal.  So we free 'someSpace' for now, and I will then see it is empty and free space myself at next opportunity."
	EmergencyMemory := String empty.  "<--- This is the 'request' to free some space, it can only be done *between* requests."