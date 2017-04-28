as yet unclassified
magmaSession

	^ magmaSession ifNil: [ 
		magmaSession := (self application preferenceAt: #location) newSession.
		magmaSession connectAs: 'seaside'.
		magmaSession ]