insert-subscriber
subscriberDataGPRSAsASN1For: aSubscriber
	| pdpContext pdpList |
	pdpContext := ASN1Dictionary new
		at: 'pdp-ContextId' put: 1;
		at: 'pdp-Type' put: #[1 33];
		at: 'qos-Subscribed' put: #[35 113 31];
		at: 'vplmnAddressAllowed' put: #null;
		at: 'apn' put: aSubscriber applicationPointName;
		yourself.
	pdpList := ASN1Array new.
	pdpList add: pdpContext.

	^OrderedCollection new
		add: (ASN1Dictionary new
			at: 'msisdn' put: aSubscriber msisdnAsE164;
			at: 'category' put: aSubscriber subscriberCategory;
			at: 'subscriberStatus' put: aSubscriber subscriberStatus;
			at: 'teleserviceList' put: aSubscriber teleServiceListForGPRS;
			at: 'odb-Data' put: 
				(ASN1Dictionary new
					at: 'odb-GeneralData' put: (self odbGeneralDataFor: aSubscriber);
					yourself);
			at: 'gprsSubscriptionData' put: (ASN1Dictionary new
					at: 'completeDataListIncluded' put: nil asAsn1Value;
					at: 'gprsDataList' put: pdpList;
					 yourself);
			at: 'networkAccessMode' put: 'packetAndCircuit';
			yourself);
		yourself
	