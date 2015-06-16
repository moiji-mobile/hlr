as yet unclassified
queryKiBySubscriber: anImsi
	logger logDebug: 'Query for' with: {'imsi' -> anImsi}.
	"Convert String -> Number -> String to be paranoid about injection. This is more than twice
	as fast as a prepared statement."
	^connection execute: ('SELECT * from imsi, subscriber_imsi WHERE imsi=''{1}'' AND imsi.imsi = subscriber_imsi.list_IMSI_IMSI' format: {anImsi asNumber asString})