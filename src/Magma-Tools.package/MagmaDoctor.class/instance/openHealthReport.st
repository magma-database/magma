accessing
openHealthReport
	| ts |
	ts := TextStream on: Text new.
	self writeHealthInformationTo: ts.
	(Workspace new
		contents: ts contents ;
		yourself) openLabel: self pathName