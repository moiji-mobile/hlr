as yet unclassified
messageWaitingListContains: aSCAddress gateway: aSCCPAddress 
	messageWaitingSet do: [:assoc |
		"Ignore the SCCP address we had."
		assoc value = aSCAddress
			ifTrue: [^true]].
	^false