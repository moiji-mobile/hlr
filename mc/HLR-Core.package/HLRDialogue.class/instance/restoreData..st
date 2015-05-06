dataRestorationPackage
restoreData: anInvocation
	<consumer: 'VLR'>
	<package: 'dataRestorationPackage-v3'>
	
	| imsi |

	self flag: #todo. "Check if the VLR address matches ours?"
	imsi := 	anInvocation argument imsi fromTBCD.
	logger logDebug: 'restoreData' with: { 'imsi' -> imsi }.
	(HLRRestoreDataOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.