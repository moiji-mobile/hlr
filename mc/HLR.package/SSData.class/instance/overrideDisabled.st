creation
overrideDisabled
	subscriptionOption := ASN1Dictionary new
		at: 'overrideCategory' put: (ByteArray with: self class overrideDisabled) hex;
		yourself