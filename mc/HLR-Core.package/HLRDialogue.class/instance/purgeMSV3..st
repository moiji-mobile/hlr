purgingPackage
purgeMSV3: anInvocation
	<consumer: 'VLR'>
	<consumer: 'SGSN'>
	<package: 'purgingPackage-v3'>

	| imsi sgsn operation |
	
	imsi := anInvocation argument imsi fromTBCD.
	sgsn := anInvocation argument sgsn_Number.
	self flag: #todo. "Check the vlr-Number/sgsn-Number if it is matching?"
	"Depending on the sgsn-Number we are either a purge from the SGSN or the VLR"
	operation := sgsn isNil
			ifTrue: [HLRPurgeOperationV3 for: imsi]
			ifFalse: [HLRPurgeOperationGPRS for: imsi].

	operation
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.