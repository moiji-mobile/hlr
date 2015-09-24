as yet unclassified
finishWithRoute: aSubscriber subscriberInfo: aSubscriberInfo
	"TODO: include other info?"

	invocation returnResultLastUsing: [ :result |
		result
			at: 'imsi' put: aSubscriber imsiAsTBCD;
			expandAt: 'extendedRoutingInfo' using: [ :routingInfo |
				routingInfo expandAt: 'camelRoutingInfo' using: [ :camelRouting |
					camelRouting expandAt: 'gmscCamelSubscriptionInfo' using: [ :subscriptionInfo |
						(aSubscriber gmscCamelSubscriptionInfo: subscriptionInfo for: hlr) ] ] ];
			replaceContentAt: 'subscriberInfo' with: (aSubscriberInfo privAt: 'subscriberInfo');
			at: 'vmsc-Address' put: aSubscriber mscNumber toE164 ].
	dialogue requestTcEnd: false.