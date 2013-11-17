supplementary-services
activateSupplementaryServiceForCode: aSSCode
	| ssData |

	ssData := self supplementaryServiceStateFor: aSSCode.
	ssData makeActive.