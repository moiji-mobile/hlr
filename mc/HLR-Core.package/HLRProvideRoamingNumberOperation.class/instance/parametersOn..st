execution
parametersOn: aValue
	^ aValue
		at: 'imsi' put: subscriber imsiAsTBCD;
		at: 'msc-Number' put: subscriber mscNumber toE164;
		at: 'msisdn' put: subscriber msisdn toE164;
		yourself.
