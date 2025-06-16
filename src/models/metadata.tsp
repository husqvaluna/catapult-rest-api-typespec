import "../types/core.tsp";
import "./common.tsp";

model MetadataEntryDTO {
  version: StateVersion;
  compositeHash: Hash256;
  sourceAddress: Address;
  targetAddress: Address;
  scopedMetadataKey: MetadataKey;
  targetId?: MosaicId | NamespaceId;
  metadataType: MetadataTypeEnum;

  @doc("Metadata value.")
  @format("hex") value: string;
}

model MetadataInfoDTO {
  @example("65204AB4242726662686A453")
  id: ID;
  metadataEntry: MetadataEntryDTO;
}

model MetadataNetworkPropertiesDTO {
  @doc("Maximum metadata value size.")
  @example("1024")
  maxValueSize?: string;
}

model MetadataPage is Page<MetadataInfoDTO>;
