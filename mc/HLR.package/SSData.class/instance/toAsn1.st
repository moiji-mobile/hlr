asn1
toAsn1
	| status |
	status := 0.
	status := status bitAt: 1 put: activeBit asBit.
	status := status bitAt: 2 put: registeredBit asBit.
	status := status bitAt: 3 put: provisionedBit asBit.
	
	^ASN1Dictionary new
		at: 'ss-Code' put: (ByteArray with: ssCode) hex;
		at: 'ss-Status' put: (ByteArray with: status) hex;
		at: 'ss-SubscriptionOption' putIfNotNil: subscriptionOption;
		yourself.