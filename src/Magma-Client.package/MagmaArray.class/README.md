I can be used like a normal Array to reference billions of objects, at a cost of 6-bytes of disk-space per object pointer, and only consume memory for one "page" at a time (defined by #pageSize).

I do not have to be pre-allocated.  You can use at:put: to any size up to the limit.  Once I grow, I don't shrink.