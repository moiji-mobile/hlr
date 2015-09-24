as yet unclassified
formatTripletListFor: aSubscriber on: aValue
	| tripletList |
	tripletList := ((aValue expandFieldNamed: 'authenticationSetList')
		expandFieldNamed: 'tripletList').
	tripletList addAll: (self 
				generateAuthenticationListFor: aSubscriber 
				count: self vectors 
				type: tripletList type basicType type).
						
	"^ASN1Dictionary new
		at: 'authenticationSetList' put:
			(ASN1Dictionary new
				at: 'tripletList' put: (ASN1Array new addAll: aList; yourself));
		yourself"