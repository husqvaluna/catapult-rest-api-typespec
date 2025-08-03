import "../types/core.tsp";
import "./common.tsp";

model AccountRestrictionsInfoDTO {
  accountRestrictions: AccountRestrictionsDTO;
}

model AccountRestrictionsPage is Page<AccountRestrictionsInfoDTO>;

model AccountRestrictionsDTO {
  version: StateVersion;
  address: Address;
  restrictions: AccountRestrictionDTO[];
}

model AccountRestrictionDTO {
  restrictionFlags: AccountRestrictionFlagsEnum;

  @doc("Address, mosaic id, or transaction type to restrict.")
  values: (UnresolvedAddress | UnresolvedMosaicId | TransactionTypeEnum)[];
}

model AccountRestrictionNetworkPropertiesDTO {
  @doc("Maximum number of account restriction values.")
  maxAccountRestrictionValues?: string;
}

model MosaicAddressRestrictionDTO {
  id: ID;

  mosaicRestrictionEntry: MosaicAddressRestrictionEntryWrapperDTO;
}

model MosaicAddressRestrictionEntryDTO {
  key: RestrictionKey;

  @doc("Restriction value.")
  value: string;
}

model MosaicAddressRestrictionEntryWrapperDTO {
  version: StateVersion;
  compositeHash: Hash256;
  entryType: MosaicRestrictionEntryTypeEnum;
  mosaicId: MosaicId;
  targetAddress: Address;
  restrictions: MosaicAddressRestrictionEntryDTO[];
}

model MosaicGlobalRestrictionDTO {
  id: ID;

  mosaicRestrictionEntry: MosaicGlobalRestrictionEntryWrapperDTO;
}

model MosaicGlobalRestrictionEntryDTO {
  key: RestrictionKey;
  restriction: MosaicGlobalRestrictionEntryRestrictionDTO;
}

model MosaicGlobalRestrictionEntryRestrictionDTO {
  referenceMosaicId: MosaicId;
  restrictionValue: RestrictionValue;
  restrictionType: MosaicRestrictionTypeEnum;
}

model MosaicGlobalRestrictionEntryWrapperDTO {
  version: StateVersion;
  compositeHash: Hash256;
  entryType: MosaicRestrictionEntryTypeEnum;
  mosaicId: MosaicId;
  restrictions: MosaicGlobalRestrictionEntryDTO[];
}

model MosaicRestrictionNetworkPropertiesDTO {
  @doc("Maximum number of mosaic restriction values.")
  maxMosaicRestrictionValues?: string;
}

model MosaicRestrictionsPage is Page<MosaicAddressRestrictionDTO | MosaicGlobalRestrictionDTO>;
