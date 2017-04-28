debugging
objectFromStream: stream 
	| serializer buffers |
	stream binary.
	buffers := OrderedCollection new.
	stream maBuffersDo:
		[ : each | buffers add: each ].
	serializer := MaObjectSerializer new.
	^ buffers size > 1
		ifTrue:
			[ serializer classDefinitionsByteArray: buffers first.
			serializer materializeGraph: buffers second ]
		ifFalse: [ serializer materializeGraph: buffers first ]