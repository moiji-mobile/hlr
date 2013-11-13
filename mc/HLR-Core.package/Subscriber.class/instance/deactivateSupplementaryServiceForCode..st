supplementary-services
deactivateSupplementaryServiceForCode: aSSCode
	| ssData |

	ssData := self supplementaryServiceStateFor: aSSCode.
	ssData
		operative;
		provisioned;
		notRegistered;
		notActive.