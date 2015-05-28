as yet unclassified
queryKiBySubscriber: anImsi
	logger logDebug: 'Query for' with: {'imsi' -> anImsi}.
	kiQuery params: Dictionary new.
	kiQuery at: 1 bind: anImsi.
	^kiQuery execute