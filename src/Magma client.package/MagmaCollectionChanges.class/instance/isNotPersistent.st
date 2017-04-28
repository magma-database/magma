private
isNotPersistent
	"private - Not mutually exclusive with #isNewCollection, isPersistent indicates I am referenced by the persistent model.  I can gain a 'permanent oid' and still not be referenced by the persistent model when I am a result set of a query that required one of the 'luxury' features like distinctness or sorting by a different attribute.  See MagmaSession>>#load:from:makeDistinct:."
	^ changes includesKey: #notPersistent