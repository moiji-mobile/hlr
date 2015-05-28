as yet unclassified
execute
	hlr database newMSISDNQuery
		msisdn: msisdn;
		onSuccess: [:subscriber |
			logger logDebug: 'Found subscriber by MSISDN' with: { 'dialogue' -> dialogue. 'msisdn' -> msisdn }.
			self onSubscriberFound: subscriber];
		onFailure: [:reason |
			logger logDebug: 'Didn''t find subscriber by MSISDN' with: { 'dialogue' -> dialogue. 'msisdn' -> msisdn. 'reason' -> reason}.
			self onNoSubscriber: reason];
		onSystemFailure: [:reason |
			logger logError: 'Database query failed' with: { 'dialogue' -> dialogue. 'msisdn' -> msisdn. 'reason' -> reason}.
			self onSystemFailure];
		start.