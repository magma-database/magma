services
initialize
	(ServiceRegistry current serviceWithId: #browserMethodMenu) services
		 add: self browseMethodVersionsInMcService ;
		 add: self browseMcMethodOriginService.
	(ServiceRegistry current serviceWithId: #browserClassMenu) services
		 add: self browseClassVersionsInMcService ;
		 add: self browseMcClassOriginService