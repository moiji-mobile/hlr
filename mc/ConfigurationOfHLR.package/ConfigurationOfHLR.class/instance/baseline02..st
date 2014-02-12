as yet unclassified
baseline02: spec 
        <version: '0.2-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
                spec repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main'.    
                spec 
				package: 'HLR-Core' with: [ spec requires: #('TCAP' 'CDR' 'ASN1') ];
				package: 'HLR-Camel' with: [ spec requires: #('HLR-Core') ];
				package: 'HLR-Voyage' with: [ spec requires: #('HLR-Core' 'VoyageMongo') ] .

			spec
				project: 'Phexample' with: [
					spec
						className: 'ConfigurationOfPhexample';
						versionString: '1.2';
						repository: 'http://smalltalkhub.com/mc/Phexample/Phexample/main' ].	
			spec
				project: 'Osmocom' with: [
					spec
						className: 'ConfigurationOfOsmocom';
						versionString: #'bleedingEdge';
						file: 'ConfigurationOfOsmocom';
						repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ].
					
			spec
				project: 'CDR' with: [
					spec
						className: 'ConfigurationOfCDR';
						versionString: #'bleedingEdge';
						file: 'ConfigurationOfCDR';
						repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ].

			spec
				project: 'TCAP' with: [
					spec
						className: 'ConfigurationOfTCAP';
						versionString: #'bleedingEdge';
						file: 'ConfigurationOfTCAP';
						repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ].

			spec
				project: 'ASN1' with: [
					spec
						className: 'ConfigurationOfASN1';
						versionString: #development;
						file: 'ConfigurationOfASN1';
						repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main' ].
			
			spec project: 'VoyageMongo' with: [ 
				spec 
					className: 'ConfigurationOfVoyageMongo';
					versionString: #stable;
					repository: 'http://smalltalkhub.com/mc/estebanlm/Voyage/main'.].
			
			spec project: 'RFB' with: [
				spec
					className: 'ConfigurationOfRFB';
					versionString: '0.6';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main' ].		
			
                spec
				group: 'core' with: #('HLR-Core');
				group: 'camel' with: #('HLR-Camel');
				group: 'default' with: #('core' 'camel' 'HLR-Voyage' 'RFB') ].