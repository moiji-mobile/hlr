accessing
toAsn1
	"Assume this is the default profile"
	^ASN1Array new
		add: (self class bearerAsn1: self class dataCDA300bps);
		add: (self class bearerAsn1: self class dataCDA1200bps);
		add: (self class bearerAsn1: self class dataCDA120075bps);
		add: (self class bearerAsn1: self class allAlternateSpeechDataCDA);
		add: (self class bearerAsn1: self class allSpeechFollowedByDataCDA);
		add: (self class bearerAsn1: self class padAccessCA300bps);
		add: (self class bearerAsn1: self class padAccessCA1200bps);
		add: (self class bearerAsn1: self class padAccessCA120075bps);
		add: (self class bearerAsn1: self class padAccessCA2400bps);
		add: (self class bearerAsn1: self class padAccessCA4800bps);
		add: (self class bearerAsn1: self class padAccessCA9600bps);
		add: (self class bearerAsn1: self class generalPadAccessCA);
		add: (self class bearerAsn1: self class dataCDS2400bps);
		add: (self class bearerAsn1: self class dataCDS4800bps);
		add: (self class bearerAsn1: self class dataCDS9600bps);
		add: (self class bearerAsn1: self class generalDataCDS);
		add: (self class bearerAsn1: self class allAlternateSpeechDataCDS);
		add: (self class bearerAsn1: self class allSpeechFollowedByDataCDS);
		add: (self class bearerAsn1: self class dataPDS2400bps);
		add: (self class bearerAsn1: self class dataPDS4800bps);
		add: (self class bearerAsn1: self class dataPDS9600bps);
		add: (self class bearerAsn1: self class generalDataPDS);
		yourself