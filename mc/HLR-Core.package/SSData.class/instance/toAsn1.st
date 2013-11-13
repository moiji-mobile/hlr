asn1
toAsn1
	^ASN1Dictionary new
		at: 'ss-Code' put: (ByteArray with: ssCode) hex;
		at: 'ss-Status' put: self ssStatus;
		at: 'ss-SubscriptionOption' putIfNotNil: subscriptionOption;
		yourself.