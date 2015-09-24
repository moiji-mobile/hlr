insert-subscriber
subscriberDataGPRSAsASN1For: aSubscriber type: aType
	|  data gprsSubscriptionData |
	data := aType newValue
		at: 'msisdn' put: aSubscriber msisdn toE164;
		at: 'category' put: aSubscriber subscriberCategory;
		at: 'subscriberStatus' put: aSubscriber subscriberStatus;
		yourself.
	aSubscriber teleServiceListForGPRSOn: (data expandFieldNamed: 'teleserviceList').
	(data expandFieldNamed: 'odb-Data') 
		at: 'odb-GeneralData' put: (self odbGeneralDataFor: aSubscriber).
	gprsSubscriptionData :=(data expandFieldNamed: 'gprsSubscriptionData')
		at: 'completeDataListIncluded' put: nil;
		yourself.
	(gprsSubscriptionData expandFieldNamed: 'gprsDataList')
		addUsing: [ :pdpContext |
			 pdpContext 
				at: 'pdp-ContextId' put: 1;
				at: 'pdp-Type' put: #[1 33];
				at: 'qos-Subscribed' put: #[35 113 31];
				at: 'vplmnAddressAllowed' put: #null;
				at: 'apn' put: aSubscriber applicationPointName ].
	data at: 'networkAccessMode' put: 'packetAndCircuit'.

	^ { data }	