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
	result := invocation resultValue
		ss_Status: ssData ssStatus. 
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.