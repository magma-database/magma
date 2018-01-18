private
postCopyWithNewOidSpace
	self oidManager: 
		(oidManager species new
			useStatisticsFrom: oidManager ;
			yourself)