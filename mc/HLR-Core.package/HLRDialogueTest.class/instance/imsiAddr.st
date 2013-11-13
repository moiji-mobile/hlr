as yet unclassified
imsiAddr
	"Use the IMSI to the Address the HLR.."
	| gt |
	gt := SCCPGlobalTitleTranslation new
			translation: 0;
			plan: 6;
			nature: 4;
			addr: subscriber imsi;
			asByteArray.
	^self hlrAddr
		globalTitle: gt indicator: 4.