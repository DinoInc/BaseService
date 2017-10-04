namespace go domain

enum enumNarrativeStatus {
	generated
	extensions
	additional
	empty
}
enum enumPatientContactGender {
	male
	female
	other
	unknown
}
enum enumIdentifierUse {
	usual
	official
	temp
	secondary
}
enum enumPersonLinkAssurance {
	level1
	level2
	level3
	level4
}
enum enumContactPointSystem {
	phone
	fax
	email
	pager
	url
	sms
	other
}
enum enumPersonResourceType {
	Person
}
enum enumPatientResourceType {
	Patient
}
enum enumAddressType {
	postal
	physical
	both
}
enum enumPersonGender {
	male
	female
	other
	unknown
}
enum enumPatientLinkType {
	replaced_by
	replaces
	refer
	seealso
}
enum enumPatientGender {
	male
	female
	other
	unknown
}
enum enumContactPointUse {
	home
	work
	temp
	old
	mobile
}
enum enumAddressUse {
	home
	work
	temp
	old
}
enum enumHumanNameUse {
	usual
	official
	temp
	nickname
	anonymous
	old
	maiden
}
struct Extension {
	1: optional string url
	2: optional string valueId
}
struct Element {
	1: optional string id
	2: optional list<Extension> extension
}
struct Coding {
	1: optional string system
	2: optional string display
	3: optional string id
	4: optional list<Extension> extension
	5: optional string version
	6: optional string code
}
struct Meta {
	1: optional string id
	2: optional list<Extension> extension
	3: optional list<Coding> security
	4: optional list<Coding> tag
	5: optional string versionId
	6: optional string lastUpdated
	7: optional list<string> profile
}
struct Resource {
	1: optional string id
	2: optional list<Extension> extension
	3: optional string language
	4: optional Meta meta
	5: optional string implicitRules
}
struct Narrative {
	1: optional string id
	2: optional list<Extension> extension
	3: optional string div
	4: optional enumNarrativeStatus status
}
struct DomainResource {
	1: optional list<Extension> extension
	2: optional string language
	3: optional Meta meta
	4: optional string implicitRules
	5: optional list<Extension> modifierExtension
	6: optional Narrative text
	7: optional string id
}
struct BackboneElement {
	1: optional list<Extension> modifierExtension
	2: optional string id
	3: optional list<Extension> extension
}
struct Reference {
	1: optional string id
	2: optional list<Extension> extension
	3: optional string reference
	4: optional string display
}
struct Person_Link {
	1: optional string id
	2: optional list<Extension> extension
	3: optional list<Extension> modifierExtension
	4: optional Reference target
	5: optional enumPersonLinkAssurance assurance
}
struct Period {
	1: optional string id
	2: optional list<Extension> extension
	3: optional string start
	4: optional string periodEnd
}
struct ContactPoint {
	1: optional enumContactPointUse contactpointUse
	2: optional string value
	3: optional string id
	4: optional list<Extension> extension
	5: optional Period period
	6: optional enumContactPointSystem system
}
struct Address {
	1: optional string country
	2: optional string state
	3: optional string id
	4: optional list<Extension> extension
	5: optional string city
	6: optional string district
	7: optional enumAddressType type
	8: optional string text
	9: optional string postalCode
	10: optional enumAddressUse addressUse
	11: optional Period period
	12: optional list<string> line
}
struct HumanName {
	1: optional string id
	2: optional list<Extension> extension
	3: optional Period period
	4: optional list<string> prefix
	5: optional list<string> suffix
	6: optional list<string> given
	7: optional string text
	8: optional string family
	9: optional enumHumanNameUse humannameUse
}
struct Attachment {
	1: optional string title
	2: optional string creation
	3: optional string hash
	4: optional string language
	5: optional string url
	6: optional string id
	7: optional list<Extension> extension
	8: optional string data
	9: optional string contentType
}
struct CodeableConcept {
	1: optional string id
	2: optional list<Extension> extension
	3: optional list<Coding> coding
	4: optional string text
}
struct Identifier {
	1: optional Period period
	2: optional string id
	3: optional list<Extension> extension
	4: optional Reference assigner
	5: optional enumIdentifierUse identifierUse
	6: optional string value
	7: optional CodeableConcept type
	8: optional string system
}
struct Person {
	1: optional string implicitRules
	2: optional list<Extension> extension
	3: optional enumPersonGender gender
	4: optional string language
	5: optional list<Identifier> identifier
	6: optional list<Extension> modifierExtension
	7: optional Narrative text
	8: optional string id
	9: optional Meta meta
	10: optional list<Person_Link> link
	11: optional list<ContactPoint> telecom
	12: optional list<HumanName> name
	13: optional list<Address> address
	14: optional enumPersonResourceType resourceType
	15: optional string birthDate
	16: optional Attachment photo
	17: optional Reference managingOrganization
}
struct Patient_Link {
	1: optional Reference other
	2: optional enumPatientLinkType type
	3: optional string id
	4: optional list<Extension> extension
	5: optional list<Extension> modifierExtension
}
struct Patient_Communication {
	1: optional list<Extension> extension
	2: optional list<Extension> modifierExtension
	3: optional CodeableConcept language
	4: optional string id
}
struct Patient_Contact {
	1: optional Reference organization
	2: optional Address address
	3: optional list<Extension> extension
	4: optional list<Extension> modifierExtension
	5: optional enumPatientContactGender gender
	6: optional Period period
	7: optional list<CodeableConcept> relationship
	8: optional HumanName name
	9: optional list<ContactPoint> telecom
	10: optional string id
}
struct Patient_Animal {
	1: optional CodeableConcept breed
	2: optional CodeableConcept genderStatus
	3: optional list<Extension> modifierExtension
	4: optional string id
	5: optional list<Extension> extension
	6: optional CodeableConcept species
}
struct Patient {
	1: optional string id
	2: optional list<Identifier> identifier
	3: optional list<Patient_Link> link
	4: optional list<ContactPoint> telecom
	5: optional list<Attachment> photo
	6: optional Reference managingOrganization
	7: optional Narrative text
	8: optional list<Extension> extension
	9: optional list<HumanName> name
	10: optional list<Patient_Contact> contact
	11: optional Patient_Animal animal
	12: optional string implicitRules
	13: optional string language
	14: optional list<Address> address
	15: optional list<Patient_Communication> communication
	16: optional enumPatientResourceType resourceType
	17: optional string deceasedDateTime
	18: optional list<Extension> modifierExtension
	19: optional list<Reference> generalPractitioner
	20: optional CodeableConcept maritalStatus
	21: optional enumPatientGender gender
	22: optional string birthDate
	23: optional Meta meta
}
