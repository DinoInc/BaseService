

/*

struct AddPractitioner
{
	1 : required list<Identifier> identifier,
	2 : optional list<HumanName> name,
	3 : optional list<ContactPoint> contact,
	4 : optional AdministrativeGender gender,
	5 : optional i32 birthDate,
	6 : optional list<Address> address,
}

struct CreateClinicalDocument
{
	1 : required Identifier medicalRecordNumber,
}

struct AddEncounter
{
	1 : required string clinicalDocumentId,
	2 : required list<Participant> participant,
	3 : required Period period,
}

struct AddObservation
{
	1 : required string clinicalDocumentId,
	2 : required ObservationMeasurement measureOf,
	3 : required ObservationMetric metric,
	4 : required double observedValue,
	5 : required i64 effectiveTime,
}

struct AddCondition
{
	1 : required string clinicalDocumentId,
	2 : required string condition,
	3 : required string encounterId,
}

struct AddCarePlan
{
	1 : required string clinicalDocumentId,
	2 : required string careplan,
	3 : required string encounterId,
}

struct FindClinicalDocumentByMedicalRecordNumber
{
	1 : required Identifier medicalRecordNumber,
}

struct GetClincalDocumentInHTML
{	
	1 : required string clinicalDocumentId,
}

struct CreateRequestDocument
{	
	1 : required string parentDocumentId,
}

struct AddProcedureRequest
{	
	1 : required string requestDocumentId,
	2 : required CodeableConcept procedure,
	3 : required strint reason,
}

struct AddMedicationRequest
{	
	1 : required string requestDocumentId,
	2 : required Medication medication,
	3 : required list<string> dosageInstruction,
	4 : required list<string> note,
}

struct GetRequestDocumentInHTML
{	
	1 : required string requestDocumentId,
}

struct CreateHospitalizationDocument
{	
	1 : required Identifier medicalRecordNumber,
}

struct AddMedicationStatement
{	
	1 : required string hospitalizationDocumentId,
	2 : required Medication medication,
	3 : required i64 effectiveTime,
}

*/