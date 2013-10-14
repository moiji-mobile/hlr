purgingPackage
purgeMSV3: anInvocation
	<consumer: 'VLR'>
	<consumer: 'SGSN'>
	<package: 'purgingPackage-v3'>

	| imsi |

	self flag: #todo. "Check the vlr-Number/sgsn-Number if it is matching?"
	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument imsi).
	(HLRPurgeOperationV3 for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.