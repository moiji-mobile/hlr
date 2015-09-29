as yet unclassified
finishForward: aSubscriber number: aMSISDN
	invocation returnResultLastUsing: [ :result | 
		result
			at: 'imsi' put: aSubscriber imsiAsTBCD;
			expandAt: 'extendedRoutingInfo' using: [ :extendedRoutingInfo |
				extendedRoutingInfo 
					expandAt: 'camelRoutingInfo' using: [ :camelRoutingInfo | 
						camelRoutingInfo 
							expandAt: 'forwardingData'  using: [ :forwardingData |
								forwardingData at: 'forwardedToNumber' put: aMSISDN ];
							expandAt: 'gmscCamelSubscriptionInfo' using: [ :subscriptionInfo |
								aSubscriber gmscCamelSubscriptionInfo: subscriptionInfo for: hlr ] ] ] ].
					
	dialogue requestTcEnd: false.