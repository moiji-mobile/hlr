as yet unclassified
testFindSubscriber
	| sub |

	dataBase newQuery
		imsi: self availableIMSI;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = self availableIMSI.
	self assert: sub msisdn = self availableMSISDN.