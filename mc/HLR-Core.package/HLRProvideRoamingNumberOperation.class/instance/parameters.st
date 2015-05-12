execution
parameters
	^ASN1Dictionary new
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'msc-Number' put: subscriber mscNumber toE164;
		at: 'msisdn' put: subscriber msisdn toE164;
		yourself.
