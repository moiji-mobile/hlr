gprsLocationUpdatingPackage
updateGprsLocation: anInvocation
	<consumer: 'SGSN'>
	<package: 'gprsLocationUpdatingPackage-v3'>

	| imsi sgsnNumber sgsnAddress cdr |

	imsi := anInvocation argument imsi fromTBCD.
	sgsnNumber := anInvocation argument sgsn_Number fromE164.
	sgsnAddress := anInvocation argument sgsn_Address fromE164.

	"Inform the cdrClient"
	cdr := hlr cdrClient updateGprsLocationRequest: sgsnNumber imsi: imsi dialogue: self.

	(HLRUpdateGprsLocationOperation for: imsi)
		originatingCallDataRecord: cdr;
		sgsnNumber: sgsnNumber;
		sgsnAddress: sgsnAddress;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.