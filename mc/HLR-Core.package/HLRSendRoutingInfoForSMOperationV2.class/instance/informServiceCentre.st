as yet unclassified
informServiceCentre
	| param operation |
	
	operation := dialogue rosOperationNamed: self class informServiceCentre.
	param := operation newArgumentValue
		at: 'mw-Status' put: mwStatus;
		yourself.
	dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.