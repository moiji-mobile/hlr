as yet unclassified
operationSucceeded: anOperation with: aResult 
	"Central hook for extensions.. use Announcements in the future"

	super operationSucceeded: anOperation with: aResult.

	database connectOrFail: [
		logger logError: 'Failed to connect to database. Not updating' with: #().
		^self].

	anOperation dialogue transaction remoteAddress parseGlobalTitle ifNotNil: [:gt |
		| sub addr |
		sub := anOperation foundSubscriber.
		addr := gt address.
		database updateSubscriberInformation:  sub remoteGlobalTitle: addr version: anOperation acnVersion].