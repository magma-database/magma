I contain pointers to a contiguous segment of a linked list, to be used as a work area for traversing the list, and for performing insertion and deletion operations.  I am probably overkill for single-threaded code :), but have been left in place as a remnant of the lock-free multi-threaded list algorithm of Michaels as it is used in the SOL Hash Table of Shalev and Shavit.

In a multi-thread environment, a frame would be thread local storage, and so would probably be allocated outside of the SOLHashTable, and passed in to the various SOLHashTable operations.  That kind of interface would be very different from the more usual Squeak collections interface, so this implementation just allocates one when needed.

Tom Rushworth <tbr@acm.org>

LICENSE
--------

Copyright (c) The individual, corporate, and institutional contributors who have collectively contributed elements to this software ("The Squeak Community"), 1996-2010 All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
