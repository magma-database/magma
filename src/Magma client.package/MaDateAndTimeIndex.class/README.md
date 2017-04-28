This class indexes DateAndTime attributes.

A DateAndTime has four instance variables:
	julianDayNumber 	- any day since 24 November -4713
	seconds				- seconds since midnight
	nanoSeconds		- up to 10 rasiedTo: 9 per second
	offset				- a Duration from UTC

This would require many byes of hash space. Fortunately most of this power is seldom used.

This class allows the user to specify the earliest date indexed (epoch), the clock precision and how far into the future dates may be specified (duration). All dates are manipulated in UTC.

This allows a far more compact hash value to be generated

