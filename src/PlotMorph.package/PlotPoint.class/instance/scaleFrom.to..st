arithmetic
scaleFrom: rect1 to: rect2
	"Produce a point stretched according to the stretch from rect1 to rect2"
	^ rect2 topLeft + (((self x-rect1 left) * rect2 width // rect1 width)
					@ ((self y-rect1 top) * rect2 height // rect1 height))