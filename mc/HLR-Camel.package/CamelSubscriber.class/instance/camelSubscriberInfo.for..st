capabilityHandling
camelSubscriberInfo: subscriberData for: aHlr

	^ subscriberData
		expandAt: 'vlrCamelSubscriptionInfo' using: [ :data | 
			data
				expandAt: 'o-CSI' using: [ :ocsi |  self oCSI: ocsi for: aHlr ];
				expandAt: 'ss-CSI' using: [ :sscsi | self ssCSI: sscsi for: aHlr ];
				expandAt: 'o-BcsmCamelTDP-CriteriaList' using: [ :list | self obcsmTDPCriteriaList: list for: aHlr ];
				expandAt: 'mo-sms-CSI' using: [ :csi | self moCSI: csi for: aHlr ] ];
		yourself