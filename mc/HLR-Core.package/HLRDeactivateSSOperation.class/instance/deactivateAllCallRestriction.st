as yet unclassified
deactivateAllCallRestriction
	| ssData |

	subscriber deactivateSupplementaryServiceForCode: SSData barrAllOutgoingCalls.
	subscriber deactivateSupplementaryServiceForCode: SSData barrIncomingCallRoam.
	hlr database updateSubscriber: subscriber.

	ssData := BarringSSData with: BarringSSData allCallRestriction.
	ssData
		provisioned;
		notRegistered;
		notActive.
	invocation returnResultLast: (ssData toAsn1: dialogue asn1Model).
	dialogue requestTcEnd: false.	