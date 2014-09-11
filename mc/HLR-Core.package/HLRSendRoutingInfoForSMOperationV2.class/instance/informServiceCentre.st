as yet unclassified
informServiceCentre
	| param |
	param := ASN1Dictionary new
		at: 'mw-Status' put: mwStatus;
		yourself.
	dialogue requestTcInvokeNamed: self class informServiceCentre parameters:  param class: 1 timeout: 500.