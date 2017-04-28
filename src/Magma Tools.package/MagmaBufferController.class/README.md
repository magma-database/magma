This is a tool for browsing the actual MaObjectBuffers that make up each object of a Magma repoitory.

I help by presenting the physical domain-model as a graph of MagmaBufferFacades.  Each facade represents exactly one MaObjectBuffer, which is the primary unit-of-storage for a single object stored in Magma.  The facade provides as much information about the real object-model as possible, such as the class name or string contents if it is a String.

Should you be unable to open a repository you may build up my classMap as you uncover class-ids using clues from the buffers (for example, since all String buffers are automatically shown, you may recognize a reference to a particular String and identify the class-id of its referencer that way).

My 'cache' preserves facade identity, therefore allowing Maui to show the graph-shape with reference lines.

To use, you specify the location of the repository (or your own MagmaSession if you wish).
