| packageNames location originalRepository exportDir versionNames versions | 

packageNames := #(
  'Ma-Client-Server-Pharo-Tester'
  'Ma-Client-Server-Squeak-Tester'
  'Magma Tools'
  'Magma client'
  'Magma seaside'
  'Magma server'
  'Magma tester'
  'Magma-Client'
  'Magma-Pharo-Tester'
  'Magma-Server'
  'Magma-Squeak-Client'
  'Magma-Squeak-Tester'
  'Magma-Tester'
  'Magma-Tools'
  'SOLHashTables'
  'WriteBarrier'
 ).

location := 'http://www.squeaksource.com/Magma'.


originalRepository := MCHttpRepository
    location: location
    user: ''
    password: ''.

exportDir := './magma/src' asFileReference ensureCreateDirectory.

versionNames := packageNames collect: [ :pacakgeName |
	ScriptLoader latestVersionOf: pacakgeName location: location ].

versions := versionNames collect: [ :each |
	originalRepository loadVersionFromFileNamed: each.	].

versions do: [ :version |
	IceMetadatalessFileTreeWriter
		fileOut: (version)
		on: (MCFileTreeRepository new directory: exportDir asFileReference ).	].