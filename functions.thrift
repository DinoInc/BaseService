struct Add_Patient
{
	1 : required list<Identifier> identifier,
	2 : optional list<HumanName> name,
	3 : optional list<ContactPoint> contact,
	4 : optional AdministrativeGender gender,
	5 : optional i32 birthDate,
	6 : optional list<Address> address,
	7 : required bool issueMR,
}

struct Find_Patient_By_Identifier
{
	1 : required Identifier identifier,
}

struct Find_Patient_By_Id
{
	1 : required string id,
}

struct Find_Patient_By_Name
{
	1 : required string name,
}

struct Add_Practitioner
{
	1 : required list<Identifier> identifier,
	2 : optional list<HumanName> name,
	3 : optional list<ContactPoint> contact,
	4 : optional AdministrativeGender gender,
	5 : optional i32 birthDate,
	6 : optional list<Address> address,
}

struct Create_Clinical_Document
{
	1 : required Identifier medicalRecordNumber,
}

struct Add_Encounter
{
	1 : required string clinicalDocumentId,
	2 : required list<Participant> participant,
	3 : required Period period,
}

struct Add_Observation
{
	1 : required string clinicalDocumentId,
	2 : required ObservationMeasurement measureOf,
	3 : required ObservationMetric metric,
	4 : required double observedValue,
	5 : required i64 effectiveTime,
}

struct Add_Condition
{
	1 : required string clinicalDocumentId,
	2 : required string condition,
	3 : required string encounterId,
}

struct Add_CarePlan
{
	1 : required string clinicalDocumentId,
	2 : required string careplan,
	3 : required string encounterId,
}

struct Find_ClinicalDocument_By_MedicalRecordNumber
{
	1 : required Identifier medicalRecordNumber,
}

struct Get_Clincal_Document_In_HTML
{	
	1 : required string clinicalDocumentId,
}

struct Create_RequestDocument
{	
	1 : required string parentDocumentId,
}

struct Add_ProcedureRequest
{	
	1 : required string requestDocumentId,
	2 : required CodeableConcept procedure,
	3 : required strint reason,
}

struct Add_MedicationRequest
{	
	1 : required string requestDocumentId,
	2 : required Medication medication,
	3 : required list<string> dosageInstruction,
	4 : required list<string> note,
}

struct Get_RequestDocument_In_HTML
{	
	1 : required string requestDocumentId,
}

struct Create_HospitalizationDocument
{	
	1 : required Identifier medicalRecordNumber,
}

struct Add_MedicationStatement
{	
	1 : required string hospitalizationDocumentId,
	2 : required Medication medication,
	3 : required i64 effectiveTime,
}



