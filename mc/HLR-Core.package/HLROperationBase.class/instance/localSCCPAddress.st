sccp
localSCCPAddress
	^ (SCCPAddress createForSSN: #hlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: hlrAddress;
							translation: 0;
							yourself);
		yourself