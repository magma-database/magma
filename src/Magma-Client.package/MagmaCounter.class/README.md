A MagmaCounter provides a concurrent counter.  New instances start at a #value of 0, after which any number of sesions may simultaneously increment or decrement, but no one can set its value.

Currently, MagmaCounters only support from SmallInteger minVal to: SmallInteger maxVal.