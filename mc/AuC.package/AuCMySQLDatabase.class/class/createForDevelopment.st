as yet unclassified
createForDevelopment
	^self new
		connectionString: 'mysql://localhost:3307/phlr?&user=root&password=ich';
		connect;
		yourself