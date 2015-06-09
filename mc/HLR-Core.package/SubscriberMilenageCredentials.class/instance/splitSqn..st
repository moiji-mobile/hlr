private
splitSqn: anInteger
	ind := anInteger bitAnd: 2r11111.
	seq := (anInteger bitShift: -5) bitAnd: 16r7FFFFFFFFFF.