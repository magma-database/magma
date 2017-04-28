private
loadFromIndex: indexInteger

	segment :=
		self
			segmentFromIndex: indexInteger
			pageSize: pageSize
			using: (session ifNotNil: [ session resetReadStrategy ])