This is released under the Squeak license, see the LICENSE section below.

Background:
--------------

An SOLHashTable is an expandable hash table based on Split-Ordered Lists, as described in the paper
   "Split-Ordered Lists: Lock-Free Extensible Hash Tables"
by
    Ori Shalev and Nir Shavit,
in
   Journal of the ACM, Vol. 53, No. 3, May 2006, pp 379-405.

The algorithm as presented in the paper is a multi-thread-safe lock-free version that uses CAS, and is one of the prettiest algorithms I've seen in a long time. Since Squeak is not at present multi-threaded, the algorithm can be simplified by using a plain store instead of CAS, removing the re-try logic on CAS failure, and removing all of the thread-safe list deletion code. This class and its compaions represents the simplified version.

Note: objects added to this implementation must respond to 'compare: anObject' in the same way Strings do.  See the Collisions section below for more detail.  Feel free to find a better way to deal with key collisions.

The actual keys and values are kept in a linked list of SOLHashNodes, and the list is managed by keeping a tree of SOLHashSegments whose leaves are pointers at dummy nodes in the list.  Each portion of the list between dummy nodes corresponds to a bucket in a traditional hash table.  There is no explicit list head in the SOLHashTable, the bottommost or lowest leaf in the lowest table segment points at the dummy list node that operates as the list head.

Collisions:
-----------

There are two types of things generally called hash collisions, (1) when two different keys are assigned to the same bucket (bucket collision), and (2) when two different objects get the same hash key (key collision).  This algorithm expects bucket collisions and handles them with the split-ordered-list. Key collisions are best handled in different ways for different scenarios.  Some types of collection simply rule them out, others allow them but have different ways of resolving ambiguities.  This implementation does not try to provide the best fitted solution, it just uses an auxilliary object supplied in both the find and delete methods to resolve the ambiguities.  This auxilliary object does NOT need to be the same object as the one stored in the table, it just needs to 'compare:' as equal.

Weaknesses
-------------

This data structure MUST have a good hash function, where all bits of the hash keys have approximately the same likelyhood of changing between different hashed objects.  You don't get to sprinkle magic primality dust over it after the hash and have it work well :).  I tried the 12 bit Squeak native hash on a very small file of 30 or so words, and ended up with 11 of the objects in the same bucket.  Googling for string string hashing turns up all sorts of candidate functions, the second one I tried worked pretty well for my test domain of English text.  If you want to use this algorithm, you will need to try different hash functions out on your data.  Use the showBucketSizeHistgram method to see how well a particular function works for your data.

Miscellaneous bits of stuff used during development:
--------------------------------------------------------------
| tbl |
tbl := SOLHashTable new loadFactor: 4 segBits: 4.
(SOLHashTable hash32: 'the') printStringRadix: 16 '16rDBC3966D'
(SOLHashTable bitReverse32: 16rDBC3966D) printStringRadix: 16 '16rB669C2DB'
tbl at: (tbl hash: 'the') put: 'the'
tbl find: (tbl hash: 'the') value: 'the'
tbl showNodeList
tbl showBucketSizeHistogram
tbl delete: (tbl hash: 'the') value: 'the'

(SOLHashTable new loadFactor: 4 segBits: 4) explore
self at: (self hash: 'the') put: 'the'
self find: (self hash: 'the') value: 'the' 'the'
self showNodeList
self showBucketSizeHistogram
self delete: (self hash: 'the') value: 'the'

(SOLHashTable loadFromFile: '/Users/tbr/Documents/Books/Originals/Austen/nabby11.txt') explore
(SOLHashTable loadFromFile: '/Users/tbr/IdleWork/SOL_Hash/common.h') explore

Original port to Squeak by: Tom Rushworth <tbr@acm.org>

LICENSE
---------

Copyright (c) The individual, corporate, and institutional contributors who have collectively contributed elements to this software ("The Squeak Community"), 1996-2010 All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
