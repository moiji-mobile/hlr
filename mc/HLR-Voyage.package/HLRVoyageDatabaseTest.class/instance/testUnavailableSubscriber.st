as yet unclassified
testUnavailableSubscriber
	| res |

	dataBase newQuery
		imsi: '6666666666666666666';
		onSuccess: [:subscriber |
			self assert: false];
		onFailure: [:reason |
			res := reason];
		start.

	self assert: res = 'Failed to find IMSI'