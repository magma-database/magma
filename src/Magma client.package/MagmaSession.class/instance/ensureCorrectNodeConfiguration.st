private
ensureCorrectNodeConfiguration
	self ensureIsAdminSession.
	"Calls #ensureCorrectNodeConfiguration."
	self submit: MagmaEnsureCorrectNodeConfiguration new