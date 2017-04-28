initializing
filePool: aMaFileStreamPool
	"Set my pool so that Magma can limit the number simultaneously open files, something required by some ISP's."
	memberIndex filePool: aMaFileStreamPool