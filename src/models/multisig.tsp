import "../types/core.tsp";
import "./common.tsp";

model MultisigAccountGraphInfoDTO {
  @doc("Level of the multisig account.")
  @example(1)
  level: integer;

  @doc("Array of multisig accounts for this level.")
  multisigEntries: MultisigAccountInfoDTO[];
}

model MultisigAccountInfoDTO {
  multisig: MultisigDTO;
}

model MultisigDTO {
  version: StateVersion;
  accountAddress: Address;

  @doc("Number of signatures needed to approve a transaction.")
  minApproval: UInt32;

  @doc("Number of signatures needed to remove a cosignatory.")
  minRemoval: UInt32;

  @doc("Addresses of the cosignatory accounts.")
  cosignatoryAddresses: Address[];

  @doc("Multisig accounts where the account is cosignatory.")
  multisigAddresses: Address[];
}

model MultisigNetworkPropertiesDTO {
  @doc("Maximum number of multisig levels.")
  @example("3")
  maxMultisigDepth?: string;

  @doc("Maximum number of cosignatories per account.")
  @example("25")
  maxCosignatoriesPerAccount?: string;

  @doc("Maximum number of accounts a single account can cosign.")
  @example("25")
  maxCosignedAccountsPerAccount?: string;
}

