access
ssFirstData
	"MAP/TCAP/ASN1 is a mess.. we need to avoid segmentation on SCCP
	so we group things into various bits.."
	^ASN1Array new
		add: (ASN1Dictionary new
				at: 'ss-Data' put: callingLineIdentifcationPresentation toAsn1;
				yourself);
		add: (ASN1Dictionary new
				at: 'ss-Data' put: callingLineIdentificationRestriction toAsn1;
				yourself);
		add: (ASN1Dictionary new
				at: 'ss-Data' put: connectedLineIdentificationPresentation toAsn1;
				yourself);
		yourself