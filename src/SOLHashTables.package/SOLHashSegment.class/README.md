I represent a "segment" of a hash table containing an array of HashSegmentNumPtrs pointers to SOLHashListNodes or other segments.  The entire hash table is represented as a tree of segments of uniform depth, where the bottommost or "leaf" layer points into the list of nodes, and all higher layers point at lower segments.

depth - an int indicating position in the tree, depth == 0 implies this is a leaf segment and the pointers are to SOLHashListNodes.  This is never changed once set.

owner - the containing SOLHashTable.  Never changed once set.

pointers - an array of (owner segPtrs) pointers, which may be nil, or when depth == 0 may point to SOLHashListNodes, and which otherwise point to the next lower depth SOLHashTableSegments.

Tom Rushworth <tbr@acm.org>

LICENSE
--------

Copyright (c) The individual, corporate, and institutional contributors who have collectively contributed elements to this software ("The Squeak Community"), 1996-2010 All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
