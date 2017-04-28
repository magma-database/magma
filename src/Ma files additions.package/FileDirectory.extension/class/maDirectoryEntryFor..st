*ma files additions
maDirectoryEntryFor: fullyQualifiedFilename 
	"Given fullyQualifiedFilename, answer a DirectoryEntryFile if fullyQualifiedFilename is a file, or a DirectoryEntryDirectory if it refers to a directory."
	^ (FileDirectory on: fullyQualifiedFilename) in: [ : fd | fd containingDirectory entryAt: fd localName ]