as yet unclassified
forwardingFeatureAsASN1
	^ASN1Dictionary new
		at: 'ss-Status' put: self ssStatus;
		at: 'forwardedToNumber' put: forwardedToNumber toE164;
		at: 'forwardingOptions' put: '0C';
		yourself.
