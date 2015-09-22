converting
valuesOn: ssInfo
	| ssData | 
	ssData := (ssInfo expandFieldNamed: 'ss-Data')
		ss_Code: (ByteArray with: ssCode);
		ss_Status: self ssStatus.
	subscriptionOption ifNotNil: [  
		(ssData expandFieldNamed: 'ss-SubscriptionOption')
			at: subscriptionOption key put: subscriptionOption value].
	^ ssInfo 