accessing
slotIndexFor: keyInteger
	"The lowest slot index in which keyInteger can reside."

	^ (keyInteger - lowKey) * numberOfSlots // entryWeight