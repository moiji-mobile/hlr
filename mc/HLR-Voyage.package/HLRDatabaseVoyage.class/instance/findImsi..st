accessing
findImsi: anImsi
	^voyageRepository selectOne: SubscriberVoyage where: {'imsi'->anImsi} asDictionary. 