private
remoteSession
	"This is the session which my realObject is retrieved from."
	"This has such an ugly name so as not to conflict with other API named #session, to which I need to invoke my doesNotUnderstand: logic."
	^ session ifNil: [ session := magmaId ifNotNil: [ magmaId findSession ] ]