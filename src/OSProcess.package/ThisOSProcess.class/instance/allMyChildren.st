child process management
allMyChildren

	^ Dictionary withAll: (childProcessList collect: [ :e | e pid -> e ])