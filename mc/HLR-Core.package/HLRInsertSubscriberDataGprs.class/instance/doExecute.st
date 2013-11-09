as yet unclassified
doExecute
	| param pdpContext pdpList |

	pdpContext := ASN1Dictionary new
		at: 'pdp-ContextId' put: 1;
		at: 'pdp-Type' put: '0121';
		at: 'qos-Subscribed' put: '23711f';
		at: 'vplmnAddressAllowed' put: #null;
		at: 'apn' put: subscriber apnAsOctetString;
		yourself.
	pdpList := ASN1Array new.
	pdpList add: pdpContext.

	param := ASN1Dictionary new
		at: 'msisdn' put: subscriber msisdnAsE164;
		at: 'category' put: subscriber subscriberCategory;
		at: 'subscriberStatus' put: subscriber subscriberStatus;
		at: 'teleserviceList' put: subscriber teleServiceListForGPRS;
		at: 'odb-Data' put: 
			(ASN1Dictionary new
				at: 'odb-GeneralData' put: subscriber odbGeneralData;
				yourself);
		at: 'gprsSubscriptionData' put: (ASN1Dictionary new
				at: 'completeDataListIncluded' put: #null;
				at: 'gprsDataList' put: pdpList;
				 yourself);
		at: 'networkAccessMode' put: 'packetAndCircuit';
		yourself.

	self insertSubscriberData: param.