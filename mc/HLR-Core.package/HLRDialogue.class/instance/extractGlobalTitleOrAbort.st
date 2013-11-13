as yet unclassified
extractGlobalTitleOrAbort
	| address gt |
	address := self container transaction address.
	gt := address parseGlobalTitle.
	
	"Abort if there is no GT"
	gt ifNil: [^self requestTcUAbort: (self uAbortCause: 0)].

	"Abort if it is not a IMSI"
	gt nature = SCCPGlobalTitle naiInternationalNumber
		ifFalse: [^self requestTcUAbort: (self uAbortCause: 0)].
	gt plan = SCCPGlobalTitle npLand
		ifFalse: [^self requestTcUAbort: (self uAbortCause: 0)].
	^gt