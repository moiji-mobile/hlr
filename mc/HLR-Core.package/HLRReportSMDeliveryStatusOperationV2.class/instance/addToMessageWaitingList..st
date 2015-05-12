execution
addToMessageWaitingList: aSubscriber
	| gateway |
	gateway := dialogue transaction remoteAddress.
	hlr database addMessageWaitingEntryFor: aSubscriber serviceCentre: serviceCentreAddress gateway: gateway.