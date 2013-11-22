execution
parameters
	^ASN1Dictionary new
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'msc-Number' put: subscriber mscNumberAsE164;
		at: 'msisdn' put: subscriber msisdnAsE164;
		yourself.
