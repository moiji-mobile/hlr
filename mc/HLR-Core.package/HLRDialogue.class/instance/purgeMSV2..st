purgingPackage
purgeMSV2: anInvocation
	<consumer: 'VLR'>
	<consumer: 'SGSN'>
	<package: 'purgingPackage-v2'>
	| imsi |

	self flag: #todo. "Check the vlr-Number if it is matching?"
	imsi := anInvocation argument imsi fromTBCD.
	logger logDebug: 'purgeMSv2' with: { 'imsi' -> imsi }.
	(HLRPurgeOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.