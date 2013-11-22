gprsLocationUpdatingPackage
updateGprsLocation: anInvocation
	<consumer: 'SGSN'>
	<package: 'gprsLocationUpdatingPackage-v3'>

	| imsi sgsnNumber sgsnAddress |

	imsi := anInvocation argument imsi fromTBCD.
	sgsnNumber := anInvocation argument sgsn_Number fromE164.
	sgsnAddress := anInvocation argument sgsn_Address fromE164.

	"Inform the cdrClient"
	hlr cdrClient updateGprsLocationRequest: sgsnNumber imsi: imsi.

	(HLRUpdateGprsLocationOperation for: imsi)
		sgsnNumber: sgsnNumber;
		sgsnAddress: sgsnAddress;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.