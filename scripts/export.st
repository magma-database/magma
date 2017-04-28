| packageNames location originalRepository exportDir versionNames versions allVersions | 

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
		
allVersions := versionNames asOrderedCollection.		
		
packageNames := #(
  'BrpExtensions'
  'Collections-BTree'
  'Ma Squeak domain'
  'Ma Statistics'
  'Ma base additions'
  'Ma contextual search'
  'Ma exception handling'
  'Ma files additions'
  'Ma object serialization'
  'Ma object serialization tester'
  'Ma proxy support'
  'Ma special collections'
  'Ma special collections tester'
  'Ma traverse object graphs'
  'Ma-Ascii-Report'
  'Ma-Collections'
  'Ma-Core'
  'Ma-Search'
  'Ma-Serializer-Core'
  'Ma-Serializer-Pharo'
  'Ma-Serializer-Squeak-Core'
  'Ma-Serializer-Tests'
  'Ma-Squeak-Core'
  'Ma-Statistics'
  'MaFixedWidthReport'
).

location := 'http://www.squeaksource.com/MaBase'.

originalRepository := MCHttpRepository
    location: location
    user: ''
    password: ''.

versionNames := packageNames collect: [ :pacakgeName |
	ScriptLoader latestVersionOf: pacakgeName location: location ].

versions := versionNames collect: [ :each |
	originalRepository loadVersionFromFileNamed: each.	].

versions do: [ :version |
	IceMetadatalessFileTreeWriter
		fileOut: (version)
		on: (MCFileTreeRepository new directory: exportDir asFileReference ).	].

allVersions addAll: versionNames.

STON put: allVersions onStreamPretty: 'versions.ston' asFileReference ensureDelete writeStream.

