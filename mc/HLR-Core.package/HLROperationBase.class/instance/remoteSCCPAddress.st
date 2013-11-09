sccp
remoteSCCPAddress
	^(SCCPAddress createForSSN: remoteSSN)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: remoteAddress;
							translation: 0;
							yourself);
		yourself.