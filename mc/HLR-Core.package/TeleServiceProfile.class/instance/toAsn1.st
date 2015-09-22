accessing
toAsn1
	^ OrderedCollection new
		add: (self class teleServiceAsn1: self class telephony);
		add: (self class teleServiceAsn1: self class emergencyCalls);
		add: (self class teleServiceAsn1: self class shortMessageMTPP);
		add: (self class teleServiceAsn1: self class shortMessageMOPP);
		yourself