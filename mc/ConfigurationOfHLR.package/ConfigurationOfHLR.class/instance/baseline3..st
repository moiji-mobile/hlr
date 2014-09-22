baselines
baseline3: spec
	<version: '3'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main'.
		spec 
			project: 'Phexample' with: [
				spec
					className: #ConfigurationOfPhexample;
					versionString: '1.2';
					repository: 'http://smalltalkhub.com/mc/Phexample/Phexample/main' ];
			project: 'Osmocom' with: [
				spec
					className: #ConfigurationOfOsmocom;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ];
			project: 'CDR' with: [
				spec
					className: #ConfigurationOfCDR;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ];
			project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: '0.2.1';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ];
			project: 'ASN1' with: [
				spec
					className: #ConfigurationOfASN1;
					versionString: '0.8.26';
					repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main' ];
			project: 'VoyageMongo' with: [
				spec
					className: #ConfigurationOfVoyageMongo;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/estebanlm/Voyage/main' ];
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.61';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main' ].
		spec 
			package: 'HLR-Core' with: [
				spec requires: #('TCAP' 'CDR' 'ASN1' ). ];
			package: 'HLR-Camel' with: [
				spec requires: #('HLR-Core' ). ];
			package: 'HLR-Voyage' with: [
				spec requires: #('HLR-Core' 'VoyageMongo' ). ].
		spec 
			group: 'core' with: #('HLR-Core' );
			group: 'camel' with: #('HLR-Camel' );
			group: 'default' with: #('core' 'camel' 'HLR-Voyage' 'RFB' ). ].
