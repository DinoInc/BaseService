enum NameUse_list
{
	NameUse_list_anonymous,
	NameUse_list_maiden,
	NameUse_list_nickname,
	NameUse_list_official,
	NameUse_list_old,
	NameUse_list_temp,
	NameUse_list_usual,
}

enum IdentifierUse_list
{
	IdentifierUse_list_official,
	IdentifierUse_list_secondary,
	IdentifierUse_list_temp,
	IdentifierUse_list_usual,
}

struct NameUse
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional NameUse_list value,
}

struct Period
{
	1 : optional i64 PeriodEnd,
	2 : optional list<binary> extension,
	3 : optional string id,
	4 : optional i64 PeriodStart,
}

struct UnspecifiedType
{
	1 : required string baseObjectType,
	2 : required binary object,
}

struct uri
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional UnspecifiedType value,
}

struct code
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional string value,
}


struct Coding
{
	1 : optional code _code,
	2 : optional string display,
	3 : optional list<binary> extension,
	4 : optional string id,
	5 : optional uri system,
	6 : optional bool userSelected,
	7 : optional string version,
}

struct CodeableConcept
{
	1 : optional list<Coding> coding,
	2 : optional list<binary> extension,
	3 : optional string id,
	4 : optional string text,
}

struct IdentifierUse
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional IdentifierUse_list value,
}

struct Identifier
{
	2 : optional list<binary> extension,
	3 : optional string id,
	4 : optional Period period,
	5 : optional uri system,
	6 : optional CodeableConcept type,
	7 : optional IdentifierUse identifierUse,
	8 : optional string value,
}

struct Reference
{
	1 : optional string display,
	2 : optional list<binary> extension,
	3 : optional string id,
	4 : optional Identifier identifier,
	5 : optional string reference,
}

enum ContactPointSystem_list
{
	ContactPointSystem_list_email,
	ContactPointSystem_list_fax,
	ContactPointSystem_list_other,
	ContactPointSystem_list_pager,
	ContactPointSystem_list_phone,
	ContactPointSystem_list_sms,
	ContactPointSystem_list_url,
}

enum ContactPointUse_list
{
	ContactPointUse_list_home,
	ContactPointUse_list_mobile,
	ContactPointUse_list_old,
	ContactPointUse_list_temp,
	ContactPointUse_list_work,
}

struct ContactPointSystem
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional ContactPointSystem_list value,
}

struct ContactPointUse
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional ContactPointUse_list value,
}

struct positiveInt
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional i64 value,
}

struct ContactPoint
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional Period period,
	4 : optional positiveInt rank,
	5 : optional ContactPointSystem system,
	6 : optional ContactPointUse contactPointUse,
	7 : optional string value,
}

struct HumanName
{
	1 : optional list<binary> extension,
	2 : optional string family,
	3 : optional list<string> given,
	4 : optional string id,
	5 : optional Period period,
	6 : optional list<string> prefix,
	7 : optional list<string> suffix,
	8 : optional string text,
	9 : optional NameUse nameUse,
}

enum AdministrativeGender_list
{
	AdministrativeGender_list_female,
	AdministrativeGender_list_male,
	AdministrativeGender_list_other,
	AdministrativeGender_list_unknown,
}

struct AdministrativeGender
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional AdministrativeGender_list value,
}

enum AddressType_list
{
	AddressType_list_both,
	AddressType_list_physical,
	AddressType_list_postal,
}

enum AddressUse_list
{
	AddressUse_list_home,
	AddressUse_list_old,
	AddressUse_list_temp,
	AddressUse_list_work,
}

struct AddressType
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional AddressType_list value,
}

struct AddressUse
{
	1 : optional list<binary> extension,
	2 : optional string id,
	3 : optional AddressUse_list value,
}

struct Address
{
	1 : optional string city,
	2 : optional string country,
	3 : optional string district,
	4 : optional list<binary> extension,
	5 : optional string id,
	6 : optional list<string> line,
	7 : optional Period period,
	8 : optional string postalCode,
	9 : optional string state,
	10 : optional string text,
	11 : optional AddressType type,
	12 : optional AddressUse addressUse,
}