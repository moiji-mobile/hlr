as yet unclassified
connect
	connection connect.
	sqnUpdate := connection prepare: 'UPDATE imsi SET SQN=? WHERE IMSI=? AND SQN=?'.
	subscriberInformation := connection prepare: 'UPDATE subscriberinformation SET CURRENTSAI=?, SAIMAPVERSION=?, SAITIME=NOW() WHERE SUBSCRIBER_ICCID=?'