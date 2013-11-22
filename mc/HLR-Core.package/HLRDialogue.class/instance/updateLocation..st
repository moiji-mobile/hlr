locationUpdatingPackage
updateLocation: anInvocation
	<consumer: 'VLR'>
	<package: 'locationUpdatingPackage-v3'>

	| imsi mscNumber vlrNumber cdr |

	imsi := anInvocation argument imsi fromTBCD.

	"Assume these numbers are E164 numbers"
	mscNumber := anInvocation argument msc_Number fromE164.
	vlrNumber := anInvocation argument vlr_Number fromE164.

	"Inform the CDR client about the request"
	cdr := hlr cdrClient updateLocationRequest: vlrNumber msc: mscNumber imsi: imsi dialogue: self.

	(HLRUpdateLocationOperation for: imsi)
		originatingCallDataRecord: cdr;
		mscNumber: mscNumber;
		vlrNumber: vlrNumber;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.