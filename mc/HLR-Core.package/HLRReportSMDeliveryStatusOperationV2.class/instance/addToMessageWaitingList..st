execution
addToMessageWaitingList: aSubscriber 
	aSubscriber addToMessageWaitingList: serviceCentreAddress.
	hlr database updateSubscriber: aSubscriber.