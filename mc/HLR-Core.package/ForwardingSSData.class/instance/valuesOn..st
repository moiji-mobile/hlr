as yet unclassified
valuesOn: ssInfo
	| info |
	info := (ssInfo expandFieldNamed: 'forwardingInfo')
		ss_Code: (ByteArray with: ssCode).
	(info expandFieldNamed: 'forwardingFeatureList') 
		addUsing: [ :item |
			item 
				ss_Status: self ssStatus;
				forwardedToNumber: forwardedToNumber;
				forwardingOptions: #[16r0C]  ].
	subscriptionOption ifNotNil: [  
		ssInfo ss_SubscriptionOption: subscriptionOption ].
	^ ssInfo 