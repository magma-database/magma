testing
hasMaui
	"Answer whether some version of Maui is installed on this system."
	^ MCWorkingCopy registry includesKey: (MCPackage named: 'Maui')