authenticationFailureReportPackage
authenticationFailureReport: anInvocation
	<consumer: 'VLR'>
	<consumer: 'SGSN'>
	<package: 'authenticationFailureReportPackage-v3'>

	| imsi |
	imsi := anInvocation argument imsi fromTBCD.
	logger logDebug: 'authenticationFailureReport' with: { 'imsi' -> imsi }.
	anInvocation returnResultLast: nil.
	self requestTcEnd: false.