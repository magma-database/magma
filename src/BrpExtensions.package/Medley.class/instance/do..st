private
do: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument."
	collections do:
		[ : each | each isCollection
			ifTrue: [ each do: aBlock ]
			ifFalse: [ aBlock value: each ] ]