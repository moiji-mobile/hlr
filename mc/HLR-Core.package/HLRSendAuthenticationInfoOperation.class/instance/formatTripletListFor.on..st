creation
formatTripletListFor: aSubscriber on: aValue
	aValue
		addAll: (self generateAuthenticationListFor: aSubscriber count: self vectors type: aValue type type)