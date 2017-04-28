private
find: hashKey 
	"Return the stored value matching hashKey and srchVal if present, otherwise nil."
	^ frame
		find: (self regularKey: hashKey)
		in: (self headNodeFor: hashKey)