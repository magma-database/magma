initialize
doBlock: aBlock 
	process := [ [ aBlock value ] ensure: [ progressor stop ] ] newProcess