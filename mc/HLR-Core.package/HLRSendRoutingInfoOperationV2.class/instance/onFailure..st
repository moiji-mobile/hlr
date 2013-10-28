as yet unclassified
onFailure: aString
	"Failed to find the subscriber. Close the dialogue for now"
	self flag: #todo. "Error handling ROSError"
	dialogue requestTcEnd: false.