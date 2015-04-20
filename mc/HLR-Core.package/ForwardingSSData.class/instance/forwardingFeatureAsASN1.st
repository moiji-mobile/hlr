as yet unclassified
forwardingFeatureAsASN1
	^ASN1Dictionary new
		at: 'ss-Status' put: self ssStatus;
		at: 'forwardedToNumber' put: forwardedToNumber;
		at: 'forwardingOptions' put: #[16r0C];
		yourself.
