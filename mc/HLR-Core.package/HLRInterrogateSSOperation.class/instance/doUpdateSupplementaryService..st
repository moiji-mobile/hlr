execution
doUpdateSupplementaryService: aSSCode
	| ssData result |
	ssData := subscriber supplementaryServiceForCode: aSSCode ifAbsent: [
				SSData new
					ssCode: aSSCode;
					notProvisioned;
					notRegistered;
					notActive;
					yourself].
	result := ASN1Dictionary new
		at: 'ss-Status' put: ssData ssStatus. 
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.