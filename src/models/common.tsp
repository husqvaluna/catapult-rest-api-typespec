import "@typespec/http";
import "../types/core.tsp";

using Http;

model ModelError {
  @example("InvalidArgument")
  code: string;
  @example("The argument is invalid.")
  message: string;
}

model Mosaic {
  id: MosaicId;
  amount: Amount;
}

model UnresolvedMosaic {
  id: UnresolvedMosaicId;
  amount: Amount;
}

model Pagination {
  @example(1)
  pageNumber: integer;
  @example(10)
  pageSize: integer;
}

model Page<T> {
  data: T[];
  pagination: Pagination;
}

@doc("The merkle path information clients can use to proof the state of the given entity.")
model MerkleStateInfoDTO {
  raw: MerkleTreeRaw;

  @doc("Merkle tree parsed from merkle tree raw.")
  tree: (MerkleTreeBranchDTO | MerkleTreeLeafDTO)[];
}

@doc("Merkle tree branch node.")
model MerkleTreeBranchDTO {
  @doc("Merkle tree node type.")
  @example(0)
  type: MerkleTreeNodeTypeEnum;

  @doc("Branch link path.")
  @example("484196B44369B764")
  path: string;

  @doc("Encoded branch link path.")
  @example("484196B44369B764")
  encodedPath: string;

  @doc("Nibble count.")
  @example(1)
  nibbleCount: integer;

  @doc("Branch link bitmask.")
  @example("0000000000000000")
  linkMask: string;

  @doc("Branch links (max 16).")
  links: MerkleTreeBranchLinkDTO[];

  @doc("Hash of the branch node.")
  branchHash: Hash256;
}

@doc("Merkle tree leaf node.")
model MerkleTreeLeafDTO {
  @doc("Merkle tree node type.")
  @example(255)
  type: MerkleTreeNodeTypeEnum;

  @doc("Leaf path.")
  @example("484196B44369B764")
  path: string;

  @doc("Encoded leaf path.")
  @example("484196B44369B764")
  encodedPath: string;

  @doc("Nibble count.")
  @example(1)
  nibbleCount: integer;

  @doc("Leaf value (sha256 hash).")
  @example("484196B44369B764")
  value: string;

  @doc("Hash of the leaf node.")
  leafHash: Hash256;
}

@doc("Merkle tree branch link.")
model MerkleTreeBranchLinkDTO {
  @doc("Branch link nibble bit index (hexadecimal).")
  @example("F")
  bit: string;

  @doc("Branch link hash.")
  link: Hash256;
}

model accountIds {
  @doc("Array of public keys.")
  publicKeys?: PublicKey[];

  @doc("Array of addresses.")
  addresses?: Address[];
}

model addresses {
  @doc("Array of addresses.")
  addresses?: Address[];
}

model cosignature {
  parentHash?: Hash256;
  signature?: Signature;
  signerPublicKey?: PublicKey;
  version?: CosignatureVersion;
}

model mosaicIds {
  @doc("Array of mosaic identifiers.")
  mosaicIds?: MosaicId[];
}

model namespaceIds {
  @doc("Array of namespace identifiers.")
  namespaceIds?: NamespaceId[];
}

model transactionHashes {
  @doc("Array of transaction hashes.")
  hashes?: Hash256[];
}

model transactionIds {
  @doc("Array of transaction identifiers.")
  transactionIds?: string[];
}

model transactionPayload {
  @doc("Transaction payload in hexadecimal format.")
  @example("0123456789ABCDEF")
  payload?: string;
}

/*
 * Plugin related configuration properties.
 */
model PluginsPropertiesDTO {
  accountlink?: AccountKeyLinkNetworkPropertiesDTO;
  aggregate?: AggregateNetworkPropertiesDTO;
  lockhash?: HashLockNetworkPropertiesDTO;
  locksecret?: SecretLockNetworkPropertiesDTO;
  metadata?: MetadataNetworkPropertiesDTO;
  mosaic?: MosaicNetworkPropertiesDTO;
  multisig?: MultisigNetworkPropertiesDTO;
  `namespace`?: NamespaceNetworkPropertiesDTO;
  restrictionaccount?: AccountRestrictionNetworkPropertiesDTO;
  restrictionmosaic?: MosaicRestrictionNetworkPropertiesDTO;
  transfer?: TransferNetworkPropertiesDTO;
}

model AggregateNetworkPropertiesDTO {
  @doc("Maximum number of transactions per aggregate.")
  @example("100")
  maxTransactionsPerAggregate?: string;

  @doc("Maximum number of cosignatures per aggregate.")
  @example("25")
  maxCosignaturesPerAggregate?: string;

  @doc("Set to true if cosignatures must exactly match component signers. Set to false if cosignatures should be validated externally.")
  @example(true)
  enableStrictCosignatureCheck?: boolean;

  @doc("Set to true if bonded aggregates should be allowed. Set to false if bonded aggregates should be rejected.")
  @example(true)
  enableBondedAggregateSupport?: boolean;

  @doc("Maximum lifetime a bonded transaction can have before it expires.")
  @example("48h")
  maxBondedTransactionLifetime?: string;
}

model TransferNetworkPropertiesDTO {
  @doc("Maximum transaction message size.")
  @example("1024")
  maxMessageSize?: string;
}

model AccountKeyLinkNetworkPropertiesDTO {
  @doc("to trigger plugin load")
  @example("true")
  dummy?: string;
}
