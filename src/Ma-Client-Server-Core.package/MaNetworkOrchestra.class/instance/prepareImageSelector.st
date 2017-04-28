images
prepareImageSelector
	"The selector on my class which should be used to create the image.  It should be one of:
		#createImage -- Create the image from the launching image, replacing any old images for prior players (with the same filename).  This is necessary to pass different arguments to player images each time, like the mode argument to MagmaDataRepair (#check, #count, #identify, #repair, etc.).
		#ensureImage -- Create the image only if it doesn't already exist.
		#ensureUpToDateImage -- Create the image if it doesn't exist or if it is older than this image."
	^ prepareImageSelector