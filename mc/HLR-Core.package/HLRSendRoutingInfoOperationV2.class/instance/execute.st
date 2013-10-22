as yet unclassified
execute
	hlr database newQuery
		msisdn: msisdn;
		onSuccess: [:subscriber |
			self onSuccess: subscriber];
		onFailure: [:reason |
			self onFailure: reason];
		start.