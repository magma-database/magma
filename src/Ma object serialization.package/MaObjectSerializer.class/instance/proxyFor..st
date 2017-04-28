accessing
proxyFor: oid

	^oidManager retainIdentityOfProxy: (createProxyBlock value: oid)
