as yet unclassified
hlrSCCPAddress
	"Some duplication with the HLROperationBase. TODO FIXME"
	^ (SCCPAddress createForSSN: #hlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: hlrNumber;
							translation: 0;
							yourself);
		yourself