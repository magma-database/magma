private
errorNotFound: anObject
	"Actually, this should raise a special Exception not just an error."

	self error: 'Object is not in the collection.'