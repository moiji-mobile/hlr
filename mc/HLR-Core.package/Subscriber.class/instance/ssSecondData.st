access
ssSecondData
	| array |
	"MAP/TCAP/ASN1 is a mess.. we need to avoid segmentation on SCCP
	so we group things into various bits.."
	
	array := ASN1Array new.
	array add: (ASN1Dictionary new
				at: 'ss-Data' put: connectedLineIdentificationRestriction toAsn1;
				yourself).

	"TODO: we might need to check if all of it fits.."
	self provisionedSS keysAndValuesDo: [:key :value |
		array add: (ASN1Dictionary new
					at: 'ss-Data' put: value toAsn1;
					yourself)].
	^array