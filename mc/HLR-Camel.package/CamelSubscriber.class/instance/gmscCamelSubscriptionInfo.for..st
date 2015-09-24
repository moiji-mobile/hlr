as yet unclassified
gmscCamelSubscriptionInfo: info for: aHlr 
	^ info
		expandAt: 't-CSI' using: [ :tcsi | self mtCSI: tcsi for: aHlr ];
		expandAt: 'o-CSI' using: [ :ocsi | self oCSI: ocsi for: aHlr ];
		expandAt: 'o-BcsmCamelTDP-CriteriaList' using: [ :list | self obcsmTDPCriteriaList: list for: aHlr ];
		yourself.