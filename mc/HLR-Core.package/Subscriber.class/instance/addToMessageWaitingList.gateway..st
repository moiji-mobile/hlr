sms
addToMessageWaitingList: aSmscAddress gateway: anAddress
	self messageWaitingSet add: (anAddress -> aSmscAddress)