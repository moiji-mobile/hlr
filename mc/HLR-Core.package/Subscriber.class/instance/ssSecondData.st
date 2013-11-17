access
ssSecondData
	| array |
	"MAP/TCAP/ASN1 is a mess.. we need to avoid segmentation on SCCP
	so we group things into various bits.."
	
	array := ASN1Array new.
	array add: connectedLineIdentificationRestriction toAsn1.

	"TODO: we might need to check if all of it fits.."
	self provisionedSS keysAndValuesDo: [:key :value |
		array add: value toAsn1].
	^array