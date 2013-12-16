sccp
remoteSCCPAddress
	^remoteSCCPAddress ifNil: [
		(SCCPAddress createForSSN: remoteSSN)
			routedOnSSN: false;
			gtiFromAddr:  (SCCPGlobalTitleTranslation new
								nature: SCCPGlobalTitle naiInternationalNumber;
								plan: SCCPGlobalTitle npISDN;
								addr: remoteGlobalTitle;
								translation: 0;
								yourself);
			yourself]