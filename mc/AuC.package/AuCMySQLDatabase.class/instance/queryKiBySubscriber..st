as yet unclassified
queryKiBySubscriber: anImsi 
	kiQuery params: Dictionary new.
	kiQuery at: 1 bind: anImsi.
	^kiQuery execute