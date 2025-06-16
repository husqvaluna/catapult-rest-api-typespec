import "../types/core.tsp";
import "./common.tsp";

model EntityDTO {
  signerPublicKey: PublicKey;

  @doc("Entity version.")
  @example(1)
  version: integer;

  network: NetworkTypeEnum;

  @example(32835)
  type: integer;
}

model SizePrefixedEntityDTO {
  @doc("Entity size in bytes.")
  size: UInt32;
}

model VerifiableEntityDTO {
  signature: Signature;
}

model BlockDTO {
  ...SizePrefixedEntityDTO;
  ...VerifiableEntityDTO;
  ...EntityDTO;
  height: Height;
  timestamp: Timestamp;
  difficulty: Difficulty;
  proofGamma: ProofGamma;
  proofVerificationHash: ProofVerificationHash;
  proofScalar: ProofScalar;
  previousBlockHash: Hash256;
  transactionsHash: Hash256;
  receiptsHash: Hash256;
  stateHash: Hash256;
  beneficiaryAddress: Address;
  feeMultiplier: BlockFeeMultiplier;
}

model BlockInfoDTO {
  id: ID;

  meta: BlockMetaDTO;
  block: BlockDTO | ImportanceBlockDTO;
}

model BlockMetaDTO {
  hash: Hash256;

  totalFee: Amount;

  generationHash: Hash256;

  stateHashSubCacheMerkleRoots: Hash256[];

  @doc("Total number of [transactions](https://docs.symbolplatform.com/concepts/transaction.html) confirmed in this block, including *embedded* transactions (i.e. transactions contained within aggregate transactions).")
  totalTransactionsCount: integer;

  @doc("Number of [transactions](https://docs.symbolplatform.com/concepts/transaction.html) confirmed in this block. This does not count *embedded* transactions (i.e. transactions contained within aggregate transactions).")
  transactionsCount: integer;

  @doc("Number of statements (of any kind) present in this block. Bear in mind that some of them (like [resolution statements](https://docs.symbolplatform.com/concepts/receipt.html#resolution-statement)) are triggered by transactions present in the block, but in general, [transaction statements](https://docs.symbolplatform.com/concepts/receipt.html#transaction-statement) are not.")
  statementsCount: integer;
}

model BlockPage is Page<BlockInfoDTO>;

model ImportanceBlockDTO {
  ...BlockDTO;

  @doc("Number of voting eligible accounts.")
  votingEligibleAccountsCount: UInt32;

  @doc("Number of harvesting eligible accounts.")
  harvestingEligibleAccountsCount: UInt64;

  @doc("Total balance eligible for voting.")
  totalVotingBalance: Amount;

  @doc("Previous importance block hash.")
  previousImportanceBlockHash: Hash256;
}

@doc("Each merkle path item is composed of a hash, and a position relative to the proofHash being evaluated.")
model MerklePathItemDTO {
  position?: PositionEnum;
  hash?: Hash256;
}

model MerkleProofInfoDTO {
  @doc("List of complementary merkle path items needed to recalculate the merkle root.")
  merklePath?: MerklePathItemDTO[];
}

model FinalizedBlockDTO {
  finalizationEpoch: FinalizationEpoch;
  finalizationPoint: FinalizationPoint;
  height: Height;
  hash: Hash256;
}

model BmTreeSignature {
  root: ParentPublicKeySignaturePair;
  bottom: ParentPublicKeySignaturePair;
}

model FinalizationProofDTO {
  version: integer;
  finalizationEpoch: FinalizationEpoch;
  finalizationPoint: FinalizationPoint;
  height: Height;
  hash: Hash256;
  messageGroups: MessageGroup[];
}

model MessageGroup {
  @doc("Message stage")
  stage: StageEnum;

  @doc("Block height corresponding to the first hash.")
  height: Height;

  hashes: Hash256[];
  signatures: BmTreeSignature[];
}

model ParentPublicKeySignaturePair {
  parentPublicKey: PublicKey;
  signature: Signature;
}
