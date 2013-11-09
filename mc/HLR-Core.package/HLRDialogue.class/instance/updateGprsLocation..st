gprsLocationUpdatingPackage
updateGprsLocation: anInvocation
	<consumer: 'SGSN'>
	<package: 'gprsLocationUpdatingPackage-v3'>

	| imsi sgsnNumber sgsnAddress |

	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument imsi).
	sgsnNumber := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument sgsn_Number) allButFirst.
	sgsnAddress := (ByteArray readHexFrom: anInvocation argument sgsn_Address).

	(HLRUpdateGprsLocationOperation for: imsi)
		sgsnNumber: sgsnNumber;
		sgsnAddress: sgsnAddress;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.