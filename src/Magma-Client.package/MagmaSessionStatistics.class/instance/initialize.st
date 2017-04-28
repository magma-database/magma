initialize-release
initialize
	super initialize.
	clientSideConnectionTimeHistory := MaStatHistory name: 'Connection Time'.
	refreshAllTimeHistory := MaStatHistory name: 'Connection refresh time'.
	clientSideMcPageReadsTimeHistory := MaStatHistory name: 'MagmaCollection Page Reads'.
	clientSideProxyMaterializationTimeHistory := MaStatHistory name: 'Proxy Materializations'.
	clientSideCommitTimeHistory := MaStatHistory name: 'Time to Serialize Commit Packages'.
	objectsReadPerSecond := MaStatHistory name: 'Objects per second read'.
	objectBytesReadPerSecond := MaStatHistory name: 'Bytes per second read'.
	refreshViewHistory := MaStatHistory name: 'Time to Refresh View'