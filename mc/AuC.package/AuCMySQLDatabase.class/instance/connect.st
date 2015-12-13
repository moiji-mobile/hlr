as yet unclassified
connect
	logger logNotice: 'Opening MySQL connection' with: {}.
	self discardOldConnection.
	connection := GADriver fromConnectionString: connectionString.
	connection connect.
	sqnUpdate := connection prepare: 'UPDATE imsi SET SQN=? WHERE IMSI=? AND (SQN=? OR SQN IS NULL)'.
	subscriberInformation := connection prepare: 'UPDATE subscriberinformation SET CURRENTSAI=?, SAIMAPVERSION=?, SAITIME=NOW() WHERE SUBSCRIBER_ICCID=?'.
	logger logNotice: 'Opened MySQL connection' with: {}.