	/**
	 * This function is used, for example in "Hospital" want to register a new practitioner.
	 */

	ReturnType AddPractitioner (
		1 : required list<Identifier> identifier,
		2 : optional list<HumanName> name,
		3 : optional list<ContactPoint> contact,
		4 : optional AdministrativeGender gender,
		5 : optional i32 birthDate,
		6 : optional list<Address> address,
	)

	/**
	 * Used when practitioner start a examination on a patient. Every examination have their 
	 * own clinical document.
	 */

	ReturnType CreateClinicalDocument (
		1 : required Identifier medicalRecordNumber,
	)

	/**
	 *
	 */
	 
	ReturnType AddEncounter (
		1 : required string clinicalDocumentId,
		2 : required list<Participant> participant,
		3 : required Period period,
	)

	/**
	 * Used when nurse/doctor measure and observe the patient such as height, weight, temperature, 
	 * blood pressure (sistole, diastole), breath (per minute).
	 */
	 
	ReturnType AddObservation (
		1 : required string clinicalDocumentId,
		2 : required ObservationMeasurement measureOf,
		3 : required ObservationMetric metric,
		4 : required double observedValue,
		5 : required i64 effectiveTime,
	)

	/**
	 * Used when doctor get the initial condition of the patient whether it from the patient it 
	 * self or diagnosis
	 */
	 
	ReturnType AddCondition (
		1 : required string clinicalDocumentId,
		2 : required string condition,
		3 : required string encounterId,
	)

	/**
	 * Used when doctor write the plan of care to the patient after getting the patient condition. 
	 * Usually, used after addCondition function.
	 */
	 
	ReturnType AddCarePlan (
		1 : required string clinicalDocumentId,
		2 : required string careplan,
		3 : required string encounterId,
	)

	/**
	 * Find clinical document using medical record identifier
	 */
	 
	Composite FindClinicalDocumentByMedicalRecordNumber (
		1 : required Identifier medicalRecordNumber,
	)

	/**
	 * Used when request document want to be printed to physical paper.
	 */
	 
	string GetClincalDocumentInHTML (	
		1 : required string clinicalDocumentId,
	)

	/**
	 * Used when doctor want to request procedure to laboratory or radiology, or request medication 
	 * to farmalogy. This create a composite document that should be inserted by procedure and medication request.
	 */
	 
	ReturnType CreateRequestDocument (	
		1 : required string parentDocumentId,
	)

	/**
	 * Add a new procedure request to request document.
	 */
	 
	ReturnType AddProcedureRequest (	
		1 : required string requestDocumentId,
		2 : required CodeableConcept procedure,
		3 : required strint reason,
	)

	/**
	 * Add a new medication request to request document.
	 */
	 
	ReturnType AddMedicationRequest (	
		1 : required string requestDocumentId,
		2 : required Medication medication,
		3 : required list<string> dosageInstruction,
		4 : required list<string> note,
	)

	/**
	 * Used when request document want to be printed to physical paper.
	 */
	 
	string GetRequestDocumentInHTML (	
		1 : required string requestDocumentId,
	)

	/**
	 * Used when practitioner start a examination on a patient. 
	 * Every examination have their own clinical document. ????
	 */
	 
	ReturnType CreateHospitalizationDocument (	
		1 : required Identifier medicalRecordNumber,
	)

	/**
	 * Used when hospitalized patient given a medication such as O2 Therapy, IV, bandage, etc.
	 */
	 
	ReturnType AddMedicationStatement (	
		1 : required string hospitalizationDocumentId,
		2 : required Medication medication,
		3 : required i64 effectiveTime,
	)