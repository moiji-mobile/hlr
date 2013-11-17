capabilityHandling
ssCSIAsASN1: aHlr
	^ASN1Dictionary new
		at: 'ss-CamelData' put: (ASN1Dictionary new
			at: 'ss-EventList' put: ASN1Array new;
			at: 'gsmSCF-Address' put: aHlr gsmSCFAddress toE164;
			yourself);
		yourself