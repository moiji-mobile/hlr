as yet unclassified
testFindSubscriberMSISDN
	| sub |

	dataBase newQuery
		msisdn: self availableMSISDN;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = self availableIMSI.
	self assert: sub msisdn = self availableMSISDN.