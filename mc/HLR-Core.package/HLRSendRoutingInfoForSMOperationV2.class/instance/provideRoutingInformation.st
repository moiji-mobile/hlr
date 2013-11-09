execution
provideRoutingInformation
	invocation returnResultLast: (ASN1Dictionary new
					at: 'imsi' put: subscriber imsiAsTBCD;
					at: 'locationInfoWithLMSI' put: (ASN1Dictionary new
							at: 'networkNode-Number' put: subscriber mscNumberAsE164;
							yourself);
					yourself).
	dialogue requestTcEnd: false.