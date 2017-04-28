accessing
name
	"The name of this orchestra which is used to prefix the image names of the orchestra image."
	^ name ifNil: [ Smalltalk imageEntry localFileName ]