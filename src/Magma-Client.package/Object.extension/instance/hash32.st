*magma-client
hash32
	"Answer my hash, ensuring not to exceed 32-bits."
	^ self hash \\ (1 bitShift: 32)