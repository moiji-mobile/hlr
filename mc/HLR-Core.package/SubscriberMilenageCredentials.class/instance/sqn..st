as yet unclassified
sqn: anInteger 
	"SQN is SEQhs || IND and Annex C of "
	initialSqn := anInteger.
	ind := anInteger bitAnd: 2r11111.
	seq := (anInteger bitShift: -5) bitAnd: 16r7FFFFFFFFFF.