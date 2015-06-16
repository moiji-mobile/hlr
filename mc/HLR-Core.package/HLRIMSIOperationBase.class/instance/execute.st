execution
execute
	hlr database newIMSIQuery
		imsi: imsi;
		onSuccess: [:subscriber |
			logger logDebug: 'Found subscriber by IMSI' with: { 'dialogue' -> dialogue. 'imsi' -> imsi }.
			foundSubscriber := subscriber.
			self onSubscriberFound: subscriber];
		onFailure: [:reason |
			logger logDebug: 'Didn''t find subscriber by IMSI' with: { 'dialogue' -> dialogue. 'imsi' -> imsi. 'reason' -> reason}.
			self onNoSubscriber: reason];
		onSystemFailure: [:reason |
			logger logError: 'Database query failed' with: { 'dialogue' -> dialogue. 'imsi' -> imsi. 'reason' -> reason}.
			self onSystemFailure];
		start.