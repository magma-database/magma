historys
refreshAllTimeHistory
	"When the images is saved while connected to a MagmaSession, the session is automatically disconnected and reconnected when the image starts again.  While disconnected, the in-image persistent objects become stale as commits by other users continue to occur to the repository.  All persistent in-image objects must be refreshed when reconnecting to the repository.  Currently this operation can take some time and is captured as a separate stat.  To find the total connection time, add this stat to my clientSideConnectionTimeHistory."
	^refreshAllTimeHistory