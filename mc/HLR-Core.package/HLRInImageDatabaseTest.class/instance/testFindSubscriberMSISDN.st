as yet unclassified
testFindSubscriberMSISDN
	| sub |

	dataBase newMSISDNQuery
		msisdn: self availableMSISDN;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = self availableIMSI.
	self assert: sub msisdn = self availableMSISDN.