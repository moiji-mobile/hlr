execution
onNoSubscriber: reason
	self logError:
			('HLR failed to find subscriber IMSI(<1p>) Reason(<2p>)'
			expandMacrosWith: imsi with: reason) area: #hlr.

	"We would like to return unknownSubscriber this is not available
	in all cases."
	(invocation errorNamed: 'unknownSubscriber') isNil
		ifTrue: [
			self endWithErrorNamed: 'unexpectedDataValue']
		ifFalse: [
			self endWithErrorNamed: 'unknownSubscriber' using: [ :item | 
				item at: 'unknownSubscriberDiagnostic' put: 'imsiUnknown' ]]