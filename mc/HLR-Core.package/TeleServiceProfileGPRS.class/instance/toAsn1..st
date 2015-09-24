as yet unclassified
toAsn1: aValue

	^ aValue
		add: (self class teleServiceAsn1: self class shortMessageMTPP) asAsn1Value;
		add: (self class teleServiceAsn1: self class shortMessageMOPP) asAsn1Value;
		yourself