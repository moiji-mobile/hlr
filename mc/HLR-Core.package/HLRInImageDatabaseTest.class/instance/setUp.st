as yet unclassified
setUp
	| subscriber |
	subscriber := Subscriber new
			imsi: self availableIMSI;
			msisdn: self availableMSISDN;
			yourself.
	dataBase := HLRInImageDatabase new
					insert: subscriber;
					yourself. 