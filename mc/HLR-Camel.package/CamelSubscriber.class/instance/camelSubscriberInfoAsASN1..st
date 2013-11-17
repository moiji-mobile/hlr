capabilityHandling
camelSubscriberInfoAsASN1: aHlr
	^ASN1Dictionary new
		at: 'vlrCamelSubscriptionInfo' put: (ASN1Dictionary new
			at: 'o-CSI' put: (self oCSIAsASN1: aHlr);
			at: 'ss-CSI' put: (self ssCSIAsASN1: aHlr);
			at: 'o-BcsmCamelTDP-CriteriaList' put: (self obcsmTDPCriteriaList: aHlr);
			at: 'mo-sms-CSI' put: (self moCSIAsASN1: aHlr);
			yourself);
		yourself