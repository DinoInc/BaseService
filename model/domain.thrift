namespace go domain

enum enumContactPointUse {
	home
	work
	temp
	old
	mobile
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
enum enumNarrativeStatus {
	generated
	extensions
	additional
	empty
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
enum enumPatientGender {
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
enum enumAddressType {
	postal
	physical
	both
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
enum enumPatientResourceType {
	Patient
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
	1: optional string id
	2: optional list<Extension> extension
	3: optional string system
	4: optional string display
	5: optional string version
	6: optional string code
}
struct Meta {
	1: optional string lastUpdated
	2: optional list<string> profile
	3: optional list<Coding> security
	4: optional list<Coding> tag
	5: optional string id
	6: optional list<Extension> extension
	7: optional string versionId
}
struct Resource {
	1: optional list<Extension> extension
	2: optional Meta meta
	3: optional string implicitRules
	4: optional string language
	5: optional string id
}
struct Narrative {
	1: optional string id
	2: optional list<Extension> extension
	3: optional enumNarrativeStatus status
	4: optional string div
}
struct DomainResource {
	1: optional list<Extension> modifierExtension
	2: optional Narrative text
	3: optional string id
	4: optional list<Extension> extension
	5: optional Meta meta
	6: optional string implicitRules
	7: optional string language
}
struct BackboneElement {
	1: optional string id
	2: optional list<Extension> extension
	3: optional list<Extension> modifierExtension
}
struct CodeableConcept {
	1: optional list<Coding> coding
	2: optional string text
	3: optional string id
	4: optional list<Extension> extension
}
struct Patient_Animal {
	1: optional CodeableConcept genderStatus
	2: optional CodeableConcept species
	3: optional CodeableConcept breed
	4: optional string id
	5: optional list<Extension> extension
	6: optional list<Extension> modifierExtension
}
struct Patient_Communication {
	1: optional string id
	2: optional list<Extension> extension
	3: optional list<Extension> modifierExtension
	4: optional CodeableConcept language
}
struct Period {
	1: optional string start
	2: optional string id
	3: optional list<Extension> extension
	4: optional string periodEnd
}
struct Address {
	1: optional list<string> line
	2: optional string country
	3: optional string id
	4: optional string district
	5: optional string postalCode
	6: optional Period period
	7: optional enumAddressUse addressUse
	8: optional string state
	9: optional list<Extension> extension
	10: optional enumAddressType type
	11: optional string text
	12: optional string city
}
struct Reference {
	1: optional string reference
	2: optional string display
	3: optional string id
	4: optional list<Extension> extension
}
struct HumanName {
	1: optional list<string> suffix
	2: optional string text
	3: optional list<string> given
	4: optional enumHumanNameUse humannameUse
	5: optional string family
	6: optional list<string> prefix
	7: optional Period period
	8: optional string id
	9: optional list<Extension> extension
}
struct ContactPoint {
	1: optional string id
	2: optional list<Extension> extension
	3: optional Period period
	4: optional string value
	5: optional enumContactPointUse contactpointUse
	6: optional enumContactPointSystem system
}
struct Patient_Contact {
	1: optional list<Extension> modifierExtension
	2: optional string id
	3: optional Reference organization
	4: optional list<Extension> extension
	5: optional Period period
	6: optional list<CodeableConcept> relationship
	7: optional HumanName name
	8: optional list<ContactPoint> telecom
	9: optional Address address
	10: optional enumPatientContactGender gender
}
struct Identifier {
	1: optional string id
	2: optional list<Extension> extension
	3: optional enumIdentifierUse identifierUse
	4: optional string system
	5: optional string value
	6: optional Period period
	7: optional CodeableConcept type
	8: optional Reference assigner
}
struct Attachment {
	1: optional string id
	2: optional string language
	3: optional string hash
	4: optional string title
	5: optional string creation
	6: optional string data
	7: optional string url
	8: optional list<Extension> extension
	9: optional string contentType
}
struct Patient_Link {
	1: optional list<Extension> extension
	2: optional list<Extension> modifierExtension
	3: optional string id
	4: optional Reference other
	5: optional enumPatientLinkType type
}
struct Patient {
	1: optional CodeableConcept maritalStatus
	2: optional Meta meta
	3: optional list<Patient_Communication> communication
	4: optional list<Patient_Contact> contact
	5: optional enumPatientGender gender
	6: optional string birthDate
	7: optional list<Patient_Link> link
	8: optional string language
	9: optional list<Extension> modifierExtension
	10: optional Patient_Animal animal
	11: optional list<Address> address
	12: optional list<ContactPoint> telecom
	13: optional string deceasedDateTime
	14: optional list<Extension> extension
	15: optional string implicitRules
	16: optional list<Reference> generalPractitioner
	17: optional Reference managingOrganization
	18: optional list<Identifier> identifier
	19: optional list<Attachment> photo
	20: optional Narrative text
	21: optional string id
	22: optional enumPatientResourceType resourceType
	23: optional list<HumanName> name
}
