access
ssFirstData: aValue
	"MAP/TCAP/ASN1 is a mess.. we need to avoid segmentation on SCCP
	so we group things into various bits.."
	^ aValue
		addUsing: [ :item |  callingLineIdentifcationPresentation valuesOn: item ];
		addUsing: [ :item |  callingLineIdentificationRestriction valuesOn: item ];
		addUsing: [ :item |  connectedLineIdentificationPresentation valuesOn: item ];
		yourself