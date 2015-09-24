as yet unclassified
gmscCamelSubscriptionInfoFor: aHlr 

	^ASN1Dictionary new
		at: 't-CSI' put: (self mtCSIAsASN1: aHlr);
		at: 'o-CSI' put: (self oCSIAsASN1: aHlr);
		at: 'o-BcsmCamelTDP-CriteriaList' put: (self obcsmTDPCriteriaList: aHlr);
		yourself.