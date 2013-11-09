as yet unclassified
toAsn1
	^ASN1Array new
		add: (self class teleServiceAsn1: self class shortMessageMTPP);
		add: (self class teleServiceAsn1: self class shortMessageMOPP);
		yourself