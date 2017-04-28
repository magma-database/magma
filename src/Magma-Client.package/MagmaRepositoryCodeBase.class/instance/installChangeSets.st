change sets
installChangeSets

	changeSets keysDo: [ :eachKey | self fileInChangeSetNamed: eachKey ]