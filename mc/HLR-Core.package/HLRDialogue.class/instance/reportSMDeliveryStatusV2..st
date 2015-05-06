shortMsgGatewayPackage
reportSMDeliveryStatusV2: anInvocation
	<consumer: 'HLR'>
	<package: 'shortMsgGatewayPackage-v2'>
	<operation: 'reportSM-DeliveryStatusV2'>

	| msisdn smsc |
	msisdn := anInvocation argument msisdn fromE164.
	smsc := anInvocation argument serviceCentreAddress fromE164.
	logger logDebug: 'reportSMDeliveryStatusV2' with: { 'msisdn' -> msisdn. 'smsc' -> smsc }.

	HLRReportSMDeliveryStatusOperationV2 new
		hlr: hlr;
		msisdn: msisdn;
		serviceCentreAddress: smsc;
		dialogue: self;
		invocation: anInvocation;
		deliveryOutcome: anInvocation argument sm_DeliveryOutcome value;
		execute.