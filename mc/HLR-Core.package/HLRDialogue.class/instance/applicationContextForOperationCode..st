creation
applicationContextForOperationCode: aNumber
	"Some SMSCs from Sweden make a TC-BEGIN without an Application Context.
	Resolve the AC for them"
	aNumber = 45
		ifTrue: [^(self asn1Model bindingNamed: 'shortMsgGatewayContext-v2') value].
	^super applicationContextForOperationCode: aNumber.