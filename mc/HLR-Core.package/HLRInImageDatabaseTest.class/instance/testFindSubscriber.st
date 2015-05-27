as yet unclassified
testFindSubscriber
	| sub |

	dataBase newIMSIQuery
		imsi: self availableIMSI;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = self availableIMSI.
	self assert: sub msisdn = self availableMSISDN.