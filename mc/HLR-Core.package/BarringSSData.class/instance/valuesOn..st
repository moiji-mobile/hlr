as yet unclassified
valuesOn: ssInfo
	| info |
	self halt.
	info := (ssInfo expandFieldNamed: 'callBarringInfo')
		ss_Code: (ByteArray with: ssCode).
	(info expandFieldNamed: 'callBarringFeatureList') 
		addUsing: [ :item |
			item ss_Status: self ssStatus  ].
	subscriptionOption ifNotNil: [  
		(ssInfo expandFieldNamed: 'ss-SubscriptionOption')
			at: subscriptionOption key put: subscriptionOption value].
	^ ssInfo 