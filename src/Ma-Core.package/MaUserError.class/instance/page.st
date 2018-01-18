accessing
page
	^ page ifNil: [ MauiPage text: self messageText ]