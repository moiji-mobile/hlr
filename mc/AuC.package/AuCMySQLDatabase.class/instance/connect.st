as yet unclassified
connect
	connection connect.
	kiQuery := connection prepare: 'SELECT* from imsi WHERE imsi = ?'.
	sqnUpdate := connection prepare: 'UPDATE imsi SET SQN=? WHERE IMSI=? AND SQN=?'.
	subscriberInformation := connection prepare: 'UPDATE subscriberinformation SET CURRENTSAI=?, SAITIME=NOW() WHERE CURRENTIMSI=?'