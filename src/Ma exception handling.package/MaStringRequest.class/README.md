Some applications need to prompt the user for a String at an inopportune time; for example some operations may require the users privateKey file and we want to do this on a JIT basis.

The purpose of this class is to provide a default way to ask the user for a String while allowing programs to override with their own approach.