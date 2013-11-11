execution
onSubscriberFound: aSubscriber
	| needsSync |
	needsSync := false.
	
	"The phone is present again.. update things?!"
	msPresent ifTrue: [
		aSubscriber mobileStationIsPresent.
		needsSync := true.
	].

	memoryAvailable ifTrue: [ 
		aSubscriber memoryAvailable.
		needsSync := true.
	].

	needsSync ifTrue: [
		hlr database updateSubscriber: aSubscriber].
	
	"Now alert the system."
	hlr alertServiceCentresFor: aSubscriber.
	
	"And close the connection"
	dialogue requestTcEnd: false.