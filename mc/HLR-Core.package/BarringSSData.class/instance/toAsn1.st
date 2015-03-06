as yet unclassified
toAsn1
	^ASN1Dictionary new
		at: 'callBarringInfo' put:
			(ASN1Dictionary new
				at: 'ss-Code' put: (ByteArray with: ssCode);
				at: 'callBarringFeatureList' put: (ASN1Array new
					add: self callBarringFeatureAsASN1;
					yourself);
				yourself);
		yourself.
