copying
veryDeepInner: aDeepCopier 
	super veryDeepInner: aDeepCopier.
	locations := locations veryDeepCopyWith: aDeepCopier.
	"Let this node establish his own sessions."
	sessions := nil