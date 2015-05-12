as yet unclassified
removeFromWaitingList: aSmscAddress
	self messageWaitingSet removeAllSuchThat: [:assoc | assoc value = aSmscAddress]