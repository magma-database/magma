accessing
commitNumber
	"Answer the number of commits ever applied to this repository.  This is useful for determining which commit.n.log files are no longer needed (all which are lower than this number are no longer needed)."
	^ repository commitNumber