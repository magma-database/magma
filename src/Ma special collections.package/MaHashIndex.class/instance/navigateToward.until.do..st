private
navigateToward: keyInteger until: untilBlock do: doBlock
	"Select records between the root and the one that can contain keyInteger
	and value one-argument doBlock on each of those records until the
	one-argument untilBlock values true or we cannot navigate any
	closer to keyInteger."

	| level |

	level := 1.
	self selectRoot.
	[ | goalRecordReached bax |
	bax := record highestByteArrayIndexFor: keyInteger.
	recordFactory
		put: record
		atLevel: level
		byteArrayIndex: bax.
	goalRecordReached := untilBlock value: record.
	goalRecordReached not and: 	[ record hasChildAtByteArrayIndex: bax ] ]
		whileTrue:
			[ doBlock value: record.
			self selectRecord: (record recordNumberCloserTo: keyInteger).
			level := level + 1 ]