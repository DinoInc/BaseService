include "domain.thrift"

namespace go contract
namespace java contract

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

	domain.Patient AddPatient (
		1 : required domain.Patient patient,
	)

	/**
	 * Function to find Patient using identifier on his/her linked Person object
	 */

	list<domain.Patient> FindPatientByIdentifier (
		1 : required domain.Identifier identifier,
	)

	/**
	 * Function to find Patient using id on his/her Patient object
	 */

	domain.Patient FindPatientById (
		1 : required string id,
	)

	/**
	 * Function to find Patient using HumanName on his/her Patient object
	 */

	list<domain.Patient> FindPatientByName (
		1 : required string name,
	)  

	/**
	 * Function to find Patient using identifier of Person object
	 */

	list<domain.Person> FindPersonByIdentifier (
		1 : required domain.Identifier identifier,
	)

	/**
	 * Function to find Person using id on his/her Person object
	 */

	domain.Person FindPersonById (
		1 : required string id,
	)

	/**
	 * Function to find Person using HumanName on his/her Person object
	 */

	list<domain.Person> FindPersonByName (
		1 : required string name,
	)  
}
