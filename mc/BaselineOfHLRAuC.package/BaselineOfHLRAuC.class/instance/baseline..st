as yet unclassified
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec baseline: 'Voyage' with: [
				spec
					repository: 'github://pharo-nosql/voyage/mc';
					loads: 'mongo'].
		spec project: 'Garage' with: [
				spec
					className: #ConfigurationOfGarage;
					versionString: '0.2';
					loads: #('mysql' );
					repository: 'http://smalltalkhub.com/mc/DBXTalk/Garage/main/' ].
		spec project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.63';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main' ].
		spec project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/TCAP/main/' ].
		spec project: 'CDR' with: [
				spec
					className: #ConfigurationOfCDR;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/ChargingDataRecord/main/' ].
		spec project: 'OsmoGSM' with: [
				spec
					className: #ConfigurationOfOsmoGSM;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/GSM/main/' ].
		spec 
			package: 'HLR-Core' with: [
				spec requires: #('TCAP' 'CDR' 'OsmoGSM' ). ];
			package: 'HLR-Camel' with: [
				spec requires: #('HLR-Core' ). ];
			package: 'HLR-Voyage' with: [
				spec requires: #('HLR-Core' 'Voyage' ). ];
			package: 'AuC' with: [
				spec requires: #('HLR-Core' 'Garage' ). ].
		spec 
			group: 'core' with: #('HLR-Core' );
			group: 'camel' with: #('HLR-Camel' );
			group: 'auc' with: ('AuC');
			group: 'default' with: #('core' 'camel' 'auc' 'HLR-Voyage' 'RFB' ).  ].