as yet unclassified
absentSubscriberDataOn: anError
	"Return absentSubscriberV3 now...Added to the MWD list. 3 is hardcoded
	as the reference to 23.040 does not describe it."
	^ anError
		at: 'absentSubscriberDiagnosticSM' put: 3;
		yourself