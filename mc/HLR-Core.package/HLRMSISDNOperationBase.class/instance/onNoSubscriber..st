as yet unclassified
onNoSubscriber: aString
	"Failed to find the subscriber. Close the dialogue for now"
	invocation returnError: 'unknownSubscriber' with: nil.
	dialogue requestTcEnd: false.