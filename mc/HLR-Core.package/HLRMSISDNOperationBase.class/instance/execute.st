as yet unclassified
execute
	hlr database newQuery
		msisdn: msisdn;
		onSuccess: [:subscriber |
			self onSubscriberFound: subscriber];
		onFailure: [:reason |
			self onNoSubscriber: reason];
		start.