execution
doUpdateSupplementaryService: aSSCode
	| ssData |

	ssData := subscriber supplementaryServiceForCode: aSSCode ifAbsentPut: [ForwardingSSData new ssCode: aSSCode; yourself].
	ssData makeActive.
	ssData forwardedToNumber: forwardedToNumber.
	hlr database updateSubscriber: subscriber.

	self returnResult: aSSCode.