converting
valuesOn: ssInfo
self halt.
	(ssInfo expandFieldNamed: 'ss-Data')
		ss_Code: (ByteArray with: ssCode);
		ss_Status: self ssStatus.
	subscriptionOption ifNotNil: [  
		(ssInfo expandFieldNamed: 'ss-SubscriptionOption')
			at: subscriptionOption key put: subscriptionOption value].
	^ ssInfo 