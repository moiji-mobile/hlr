execution
doUpdateSupplementaryService: aSSCode
	| ssData |

	ssData := subscriber activateSupplementaryServiceForCode: aSSCode.
	ssData forwardedToNumber: forwardedToNumber.
	hlr database updateSubscriber: subscriber.

	self returnResult: aSSCode.