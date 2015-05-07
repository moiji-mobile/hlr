as yet unclassified
execute
	hlr database newQuery
		msisdn: msisdn;
		onSuccess: [:subscriber |
			logger logDebug: 'Found subscriber by MSISDN' with: { 'dialogue' -> dialogue. 'msisdn' -> msisdn }.
			self onSubscriberFound: subscriber];
		onFailure: [:reason |
			logger logDebug: 'Didn''t find subscriber by MSISDN' with: { 'dialogue' -> dialogue. 'imsi' -> msisdn }.
			self onNoSubscriber: reason];
		start.