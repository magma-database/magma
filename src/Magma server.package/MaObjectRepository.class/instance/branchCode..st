accessing
branchCode: anInteger 
	"Private - Do not update the branchCode from outside!"
	filer branchCode: anInteger.
	recoveryManager ifNotNil: [ recoveryManager branchCode: anInteger ]