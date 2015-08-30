as yet unclassified
operationSucceeded: anOperation with: aResult 
	"Central hook for extensions.. use Announcements in the future"

	super operationSucceeded: anOperation with: aResult.

	anOperation dialogue transaction remoteAddress parseGlobalTitle ifNotNil: [:gt |
		| sub addr |
		sub := anOperation foundSubscriber.
		addr := gt address.
		self updateSubscriberInformation:  sub remoteGlobalTitle: addr version: anOperation acnVersion].