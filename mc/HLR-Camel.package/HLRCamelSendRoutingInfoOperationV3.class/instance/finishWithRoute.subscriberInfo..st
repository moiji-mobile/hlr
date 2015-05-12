as yet unclassified
finishWithRoute: aSubscriber subscriberInfo: aSubscriberInfo
	"TODO: include other info?"
	invocation returnResultLast:
		(ASN1Dictionary new
			at: 'imsi' put: aSubscriber imsiAsTBCD;
			at: 'extendedRoutingInfo' put: (ASN1Dictionary new
				at: 'camelRoutingInfo' put: (ASN1Dictionary new
					at: 'gmscCamelSubscriptionInfo' put: (aSubscriber gmscCamelSubscriptionInfoFor: hlr);
					yourself);
				yourself);
			at: 'subscriberInfo' put: (aSubscriberInfo at: 'subscriberInfo');
			at: 'vmsc-Address' put: aSubscriber mscNumber toE164;
			yourself).

	dialogue requestTcEnd: false.