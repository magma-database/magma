I represent a list node in a Split-Order list.  Each item in the list has a corresponding key, and the list is kept in key order.  The key values are actually bit-reversed, to make it possible to divide the list into logical buckets, and to divide the list buckets into smaller buckets without having to re-sort the list.  It is this property that allows the SOLHashTable to expand gracefully, without ever having to rehash or rebucket the values.

There are probably many other "list" objects that would serve here, but this class is present to keep the SOLHashTable self-contained, and to make it easy to add all the bells and whistles needed for safe multi-threaded operation at some point in the future when the Squeak VM provides true independent process threads.

Tom Rushworth <tbr@acm.org>

LICENSE
---------

Copyright (c) The individual, corporate, and institutional contributors who have collectively contributed elements to this software ("The Squeak Community"), 1996-2010 All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
