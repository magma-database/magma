The purpose of this class is to provide a universal solution to the "Find by keyword" requirement.

My instances represent a human-relatable context in which a set of objects have relevance, and provide keyword-access to those objects.  It is intended to help users find objects.  Each of my subclasses provides its own particular implementation to accessing the objects in a context.  These implementations are stream-based, therefore, very large contexts can be scanned.

A MaCompositeContext can be used to aggregate contexts into single-keyword-searchable mega-context.  So, a "Squeak help-desk" context could composite an in-image-code-elements context, Swiki context, SqueakMap context and, finally, squeak-dev mailinglist archive context.  As searches within each context are kicked off in the background, results populate gradually so "research" can begin concurrently.

As each context scans, results are organized into results which are, themselves, searchable contexts (MaContextResultsContext).  Currently, relevance-matching is based on a simple hierarchy of relevance, exact-match, case-insensitive match, begins-with match and, finally, contains match.   While these provide a lot of usability, this part needs to be extensible so we can support pluggable "sounds-like" or other matching algorithms.

Matching is performed by matching the keywords against the strings provided by any objects enumeration method, #maContextKeywordsDo:.