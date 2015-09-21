as yet unclassified
valuesOn: ssInfo
	| info |
	info := (ssInfo expandFieldNamed: 'callBarringInfo')
		ss_Code: (ByteArray with: ssCode).
	(info expandFieldNamed: 'callBarringFeatureList') 
		addUsing: [ :item |
			item ss_Status: self ssStatus  ].
	subscriptionOption ifNotNil: [  
		ssInfo ss_SubscriptionOption: subscriptionOption ].
	^ ssInfo 