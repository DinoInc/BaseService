namespace go domain

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
enum enumPatientResourceType {
	Patient
}
enum enumPatientContactGender {
	male
	female
	other
	unknown
}
enum enumPersonLinkAssurance {
	level1
	level2
	level3
	level4
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
enum enumPersonResourceType {
	Person
}
enum enumContactPointUse {
	home
	work
	temp
	old
	mobile
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
enum enumAddressType {
	postal
	physical
	both
}
enum enumNarrativeStatus {
	generated
	extensions
	additional
	empty
}
enum enumPatientGender {
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
struct Extension {
	1: optional string url
	2: optional string valueId
}
struct Element {
	1: optional list<Extension> extension
	2: optional string id
}
struct Coding {
	1: optional string display
	2: optional string system
	3: optional string version
	4: optional list<Extension> extension
	5: optional string id
	6: optional string code
}
struct Meta {
	1: optional list<string> profile
	2: optional list<Extension> extension
	3: optional string id
	4: optional list<Coding> security
	5: optional list<Coding> tag
	6: optional string versionId
	7: optional string lastUpdated
}
struct Resource {
	1: optional string language
	2: optional list<Extension> extension
	3: optional string id
	4: optional Meta meta
	5: optional string implicitRules
}
struct Narrative {
	1: optional list<Extension> extension
	2: optional string id
	3: optional string div
	4: optional enumNarrativeStatus status
}
struct DomainResource {
	1: optional Narrative text
	2: optional string language
	3: optional list<Extension> extension
	4: optional string id
	5: optional Meta meta
	6: optional string implicitRules
	7: optional list<Extension> modifierExtension
}
struct Reference {
	1: optional list<Extension> extension
	2: optional string id
	3: optional string reference
	4: optional string display
}
struct BackboneElement {
	1: optional list<Extension> extension
	2: optional string id
	3: optional list<Extension> modifierExtension
}
struct Person_Link {
	1: optional list<Extension> extension
	2: optional string id
	3: optional list<Extension> modifierExtension
	4: optional Reference target
	5: optional enumPersonLinkAssurance assurance
}
struct Attachment {
	1: optional string id
	2: optional string language
	3: optional string data
	4: optional string url
	5: optional string title
	6: optional string creation
	7: optional string contentType
	8: optional string hash
	9: optional list<Extension> extension
}
struct Period {
	1: optional list<Extension> extension
	2: optional string id
	3: optional string start
	4: optional string periodEnd
}
struct CodeableConcept {
	1: optional list<Extension> extension
	2: optional string id
	3: optional list<Coding> coding
	4: optional string text
}
struct Identifier {
	1: optional CodeableConcept type
	2: optional list<Extension> extension
	3: optional string id
	4: optional Period period
	5: optional Reference assigner
	6: optional string system
	7: optional string value
	8: optional enumIdentifierUse identifierUse
}
struct ContactPoint {
	1: optional string id
	2: optional enumContactPointUse contactpointUse
	3: optional string value
	4: optional Period period
	5: optional enumContactPointSystem system
	6: optional list<Extension> extension
}
struct Address {
	1: optional string city
	2: optional string postalCode
	3: optional list<string> line
	4: optional string country
	5: optional Period period
	6: optional enumAddressUse addressUse
	7: optional list<Extension> extension
	8: optional string state
	9: optional enumAddressType type
	10: optional string text
	11: optional string district
	12: optional string id
}
struct HumanName {
	1: optional list<string> given
	2: optional enumHumanNameUse humannameUse
	3: optional list<string> suffix
	4: optional string id
	5: optional string text
	6: optional list<string> prefix
	7: optional Period period
	8: optional list<Extension> extension
	9: optional string family
}
struct Person {
	1: optional Narrative text
	2: optional string id
	3: optional enumPersonResourceType resourceType
	4: optional list<Extension> modifierExtension
	5: optional Attachment photo
	6: optional list<Identifier> identifier
	7: optional list<ContactPoint> telecom
	8: optional list<Address> address
	9: optional string language
	10: optional list<Person_Link> link
	11: optional list<HumanName> name
	12: optional list<Extension> extension
	13: optional string implicitRules
	14: optional string birthDate
	15: optional Reference managingOrganization
	16: optional enumPersonGender gender
	17: optional Meta meta
}
struct Patient_Contact {
	1: optional string id
	2: optional list<ContactPoint> telecom
	3: optional Address address
	4: optional Period period
	5: optional list<Extension> extension
	6: optional list<Extension> modifierExtension
	7: optional HumanName name
	8: optional enumPatientContactGender gender
	9: optional Reference organization
	10: optional list<CodeableConcept> relationship
}
struct Patient_Communication {
	1: optional list<Extension> modifierExtension
	2: optional CodeableConcept language
	3: optional list<Extension> extension
	4: optional string id
}
struct Patient_Link {
	1: optional Reference other
	2: optional enumPatientLinkType type
	3: optional string id
	4: optional list<Extension> modifierExtension
	5: optional list<Extension> extension
}
struct Patient_Animal {
	1: optional string id
	2: optional list<Extension> modifierExtension
	3: optional CodeableConcept species
	4: optional CodeableConcept breed
	5: optional CodeableConcept genderStatus
	6: optional list<Extension> extension
}
struct Patient {
	1: optional string language
	2: optional CodeableConcept maritalStatus
	3: optional list<Reference> generalPractitioner
	4: optional string deceasedDateTime
	5: optional list<Attachment> photo
	6: optional list<Patient_Communication> communication
	7: optional list<Patient_Link> link
	8: optional string id
	9: optional Meta meta
	10: optional string implicitRules
	11: optional string birthDate
	12: optional Reference managingOrganization
	13: optional enumPatientGender gender
	14: optional list<Extension> modifierExtension
	15: optional Narrative text
	16: optional list<Extension> extension
	17: optional enumPatientResourceType resourceType
	18: optional list<Patient_Contact> contact
	19: optional list<Identifier> identifier
	20: optional list<ContactPoint> telecom
	21: optional list<Address> address
	22: optional list<HumanName> name
	23: optional Patient_Animal animal
}
