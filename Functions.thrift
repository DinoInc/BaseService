include "FHIR.thrift"

namespace go BaseService

struct ReturnType {
	1: required i32 code
	2: optional string resource
	3: optional string target
	4: optional string value
	5: required string message
}

service BaseService {

	/**
	 *
	 * This function is used, for example in "Front Office" want to register a new patient.
	 * The new patient will get a new Medical Record (MR) identifier linked to his/her Person
	 * object that also linked to his/her Patient object.
	 *
	 * issue MR: by default is [TRUE]
	 * [FALSE IF] when in emergency situation such as "IGD".The person will not get a new 
	 * Medical Record number because of lack of patient data and could not confirm whether
	 * the patient has been registered on hospital or not. New Patient object will be created
	 * without any Person object linked.
	 *
	 */

	ReturnType AddPatient (
		1 : required list<FHIR.Identifier> identifier,
		2 : list<FHIR.HumanName> name,
		3 : list<FHIR.ContactPoint> contact,
		4 : optional FHIR.AdministrativeGender gender,
		5 : optional i32 birthDate,
		6 : optional list<FHIR.Address> address,
		7 : required bool issueMR,
	)

}
