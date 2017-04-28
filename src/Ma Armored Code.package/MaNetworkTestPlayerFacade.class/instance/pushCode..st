private
pushCode: aPositionableStream

	MaArmoredCodeNotification signal: 'pushing code to ', name.
	^self submit:
		(MaPushCodeRequest new
			stream: aPositionableStream;
			yourself)