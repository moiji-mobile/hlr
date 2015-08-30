as yet unclassified
updateSubscriberInformation:  sub remoteGlobalTitle: addr version:  acnVersion
	database connectOrFail: [
		logger logError: 'Failed to connect to database. Not updating' with: #().
		^self].

	[
		database updateSubscriberInformation:  sub remoteGlobalTitle: addr version:  acnVersion
	] on: Error do: [:err |
		err logException: 'Failed to update subscriber info' area: #hlr.
	]