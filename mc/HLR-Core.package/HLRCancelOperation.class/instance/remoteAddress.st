sccp
remoteAddress
	^(SCCPAddress createForSSN: #vlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: vlrAddress;
							translation: 0;
							yourself);
		yourself.