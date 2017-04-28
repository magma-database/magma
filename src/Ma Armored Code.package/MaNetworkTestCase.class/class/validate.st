private
validate

	(Smalltalk hasClassNamed: #OSProcess) ifFalse: [ Warning signal: 'OSProcess is recommended to run the test cases with one-click.  Otherwise you will be prompted to launch several images at various times.' ]