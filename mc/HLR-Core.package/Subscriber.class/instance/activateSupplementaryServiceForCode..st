supplementary-services
activateSupplementaryServiceForCode: aSSCode
	| ssData |

	ssData := self supplementaryServiceStateFor: aSSCode.
	ssData
		operative;
		provisioned;
		notRegistered;
		active.