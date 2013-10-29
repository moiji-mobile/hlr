execution
onNoSubscriber: reason
	self logError:
			('HLR failed to find subscriber IMSI(<1p>) Reason(<2p>)'
			expandMacrosWith: imsi with: reason) area: #hlr.
	invocation returnError: 'unknownSubscriber' with: (
					ASN1Dictionary new
						at: 'unknownSubscriberDiagnostic' put: 'imsiUnknown';
						yourself).
	dialogue requestTcEnd: false