as yet unclassified
removeMessageWaitingEntryFor: aSubscriber serviceCentre: serviceCentreAddress 
	aSubscriber removeFromWaitingList: serviceCentreAddress.
	self updateSubscriber: aSubscriber.