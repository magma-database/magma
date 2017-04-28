as yet unclassified
setUp
	now := DateAndTime now.
	sixHours := now + 6 hours.
	tomorrow := now + 1 day.
	nextWeek := now + 1 week.
	twoWeeks := now + 2 weeks.
	threeWeeks := now + 3 weeks.
	
	timespans := Set new.
	
	timespans add: (Timespan starting: now ending: nextWeek).
	timespans add: (Timespan starting: nextWeek ending: twoWeeks).
	timespans add: (Timespan starting: now ending: tomorrow).
	timespans add: (Timespan starting: sixHours ending: (sixHours + 6 hours)).