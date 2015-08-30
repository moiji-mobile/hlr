as yet unclassified
connect
	logger logNotice: 'Opening MySQL connection' with: {}.
	connection connect.
	sqnUpdate := connection prepare: 'UPDATE imsi SET SQN=? WHERE IMSI=? AND SQN=?'.
	subscriberInformation := connection prepare: 'UPDATE subscriberinformation SET CURRENTSAI=?, SAIMAPVERSION=?, SAITIME=NOW() WHERE SUBSCRIBER_ICCID=?'.
	logger logNotice: 'Opened MySQL connection' with: {}.