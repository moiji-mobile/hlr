shortMsgGatewayPackage
reportSMDeliveryStatusV3: anInvocation
	<consumer: 'HLR'>
	<package: 'shortMsgGatewayPackage-v3'>
	<operation: 'reportSM-DeliveryStatusV3'>

	| msisdn smsc |
	msisdn := anInvocation argument msisdn fromE164.
	smsc := anInvocation argument serviceCentreAddress fromE164.

	HLRReportSMDeliveryStatusOperationV3 new
		hlr: hlr;
		msisdn: msisdn;
		serviceCentreAddress: smsc;
		dialogue: self;
		invocation: anInvocation;
		deliveryOutcome: anInvocation argument sm_DeliveryOutcome value;
		execute.