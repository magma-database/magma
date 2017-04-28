private
softBranch
	"A softBranch is one in which only the branchCode changes, not the MagmaId.   A a soft-branch is automatically performed when the user opens locally for safety from hurting themself by otherwise accidently branching a Magma repository without detection, if they did the following steps:
	- Bring primary off-line.
	- Make a file-system copy of the primary.
	- Start original primary back up, further commits are made.
	- Open copied primary up locally, do some commits.
	- Replace primary with copied primary!  It would send further commits to secondary that never got those other local-commits, but such branch in this case is not detected!
Solution:
	- Opening a repository locally forces a 'soft-branch'.  You will still be able to reattach the original warm-backup as long as its branchCode of its last commitRecord matches the commitNumber of that same record in the primary."
	repository initializeBranchCode