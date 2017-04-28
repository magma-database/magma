This class keeps track of a collection of intervals.

As intervals are added that intersect or are within the proximityThreshold
of existing intervals, the existing interval is enlarged to include for the new interval.

If an interval is removed in the middle of a large interval such that
a "hole" is created, a new interval will be created and the other one
will be adjusted so that they will represent only the valid ranges.

For example:

	if an instance of this class has 1..10

	and we add: 8..15, then this class will have a single interval from 1..15

	Then remove 5..11..  Assuming a proximityThreshold of 1, this class will have the following two intervals:

		1..4
		12..15

Use a proximityThreshold of 0 to track the real-numbers..