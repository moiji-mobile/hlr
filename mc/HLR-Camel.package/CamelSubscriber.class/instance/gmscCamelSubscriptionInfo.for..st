as yet unclassified
gmscCamelSubscriptionInfo: subscriptionInfo for: aHlr 

	^ subscriptionInfo 
		expandAt: 't-CSI' using: [ :tcsi | self mtCSI: tcsi for:  aHlr ];
		expandAt: 'o-CSI' using: [ :ocsi | self oCSI: ocsi for: aHlr ];
		expandAt: 'o-BcsmCamelTDP-CriteriaList' using: [ :list |  
			self obcsmTDPCriteriaList: list for: aHlr ];
		yourself.