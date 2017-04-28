private
archiveActive
	[ history size = snapshotInterval size ] whileTrue: [ history removeFirst ].
	active ifNotNil: 
		[ | prior |
		active endTime: DateAndTime now.
		prior := history notEmpty ifTrue: [ history last ].
		(prior notNil and: [ active count = 0 and: [ prior count = 0 ] ]) 
			ifTrue: [ prior endTime: active endTime ]
			ifFalse: [ history addLast: active ] ].
	active := summary := nil