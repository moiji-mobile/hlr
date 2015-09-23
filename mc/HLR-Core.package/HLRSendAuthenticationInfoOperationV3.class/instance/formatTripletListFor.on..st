as yet unclassified
formatTripletListFor: aSubscriber on: aValue
self halt.
	((aValue expandFieldNamed: 'authenticationSetList')
		expandFieldNamed: 'tripletList')
			addAll: (self 
				generateAuthenticationListFor: aSubscriber 
				count: self vectors 
				type: aValue type type).
						
	"^ASN1Dictionary new
		at: 'authenticationSetList' put:
			(ASN1Dictionary new
				at: 'tripletList' put: (ASN1Array new addAll: aList; yourself));
		yourself"