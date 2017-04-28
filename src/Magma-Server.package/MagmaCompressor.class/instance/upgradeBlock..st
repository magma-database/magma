initialize-release
upgradeBlock: oneArgBlock 
	"Specify a block which accepts each MaObjectBuffer in the repository as an argument.  The value of the block will be written to the new compressed repository.  Useful for upgrading to new buffer-formats."
	upgradeBlock := oneArgBlock