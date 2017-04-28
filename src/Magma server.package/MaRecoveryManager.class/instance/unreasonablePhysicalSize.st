error handling
unreasonablePhysicalSize
	"Due to the nature of disaster-recovery, it is possible we are reading a partially-written file.  It could potentially have even shot-craps in the middle of writing the physicalSize portion of the record.  Therefore, we cannot trust even that not to have bytes in it that cause the computer to attempt to allocate gigs of resources.."
	^ MaSerializedGraphBuffer unreasonablePhysicalSize