private
privSetSQN: anInteger
	"Truncate the number to 48 bit.. and start with '32'" 
	sqn := anInteger bitAnd: 16rFFFFFFFFFFFF.
	sqn < 32 ifTrue: [
		sqn := 32].