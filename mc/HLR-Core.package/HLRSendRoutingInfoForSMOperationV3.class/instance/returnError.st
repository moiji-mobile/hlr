as yet unclassified
returnError
	invocation 
		returnErrorNamed: self class absentSubscriber 
		using: [ :error | self class absentSubscriberDataOn: error ]