access
ssFirstData
	"MAP/TCAP/ASN1 is a mess.. we need to avoid segmentation on SCCP
	so we group things into various bits.."
	^ASN1Array new
		add: callingLineIdentifcationPresentation toAsn1;
		add: callingLineIdentificationRestriction toAsn1;
		add: connectedLineIdentificationPresentation toAsn1;
		yourself