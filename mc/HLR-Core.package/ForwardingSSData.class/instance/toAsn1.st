as yet unclassified
toAsn1
	^ASN1Dictionary new
		at: 'forwardingInfo' put:
			(ASN1Dictionary new
				at: 'ss-Code' put: (ByteArray with: ssCode) hex;
				at: 'forwardingFeatureList' put: (ASN1Array new
					add: self forwardingFeatureAsASN1;
					yourself);
				yourself);
		yourself.
