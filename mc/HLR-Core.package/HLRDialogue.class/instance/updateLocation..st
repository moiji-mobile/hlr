locationUpdatingPackage
updateLocation: anInvocation
	<consumer: 'VLR'>
	<package: 'locationUpdatingPackage-v3'>

	| imsi mscNumber vlrNumber |

	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument imsi).

	"Assume these numbers are E164 numbers"
	mscNumber := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument msc_Number) allButFirst.
	vlrNumber := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument vlr_Number) allButFirst.

	(HLRUpdateLocationOperation for: imsi)
		mscNumber: mscNumber;
		vlrNumber: vlrNumber;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.