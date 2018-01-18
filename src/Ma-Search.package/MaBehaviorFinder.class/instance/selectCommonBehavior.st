classes
selectCommonBehavior
	"Remove methods in Object or ProtoObject."
	{  ProtoObject. Object  } do: [ : each | self removeClass: each ]