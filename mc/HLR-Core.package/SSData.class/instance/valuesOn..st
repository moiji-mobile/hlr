converting
valuesOn: ssInfo
	(ssInfo expandFieldNamed: 'ss-Data')
		ss_Code: (ByteArray with: ssCode);
		ss_Status: self ssStatus.
	subscriptionOption ifNotNil: [  
		ssInfo ss_SubscriptionOption: subscriptionOption ].
	^ ssInfo 