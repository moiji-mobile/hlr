as yet unclassified
operationSucceeded: anOperation with: aResult 
	"Central hook for extensions.. use Announcements in the future"
	database connectOrFail: [
		logger logError: 'Failed to connect to database. Not updating' with: #().
		^self].

	"Assume it is an HLRIMSIOperation"
	anOperation dialogue transaction remoteAddress parseGlobalTitle ifNotNil: [:gt |
		database updateSubscriberInformation: anOperation foundSubscriber remoteGlobalTitle: gt address].