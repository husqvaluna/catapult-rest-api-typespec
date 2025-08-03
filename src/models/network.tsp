import "@typespec/openapi";
import "@typespec/rest";
import "../types/core.tsp";
import "./common.tsp";

model NetworkTypeDTO {
  @doc("Network name.")
  @example("testnet")
  name: string;

  @doc("A short text describing the network.")
  @example("Symbol Sainet Network")
  description: string;
}

model RentalFeesDTO {
  @doc("Estimated effective rental fee to register/extend a namespace per block.")
  effectiveRootNamespaceRentalFeePerBlock: Amount;

  @doc("Estimated effective rental fee to create a subnamespace.")
  effectiveChildNamespaceRentalFee: Amount;

  @doc("Estimated effective rental fee to create a mosaic.")
  effectiveMosaicRentalFee: Amount;
}

model TransactionFeesDTO {
  @doc("Average fee multiplier over the last \"numBlocksTransactionFeeStats\" on the current Network.")
  averageFeeMultiplier: BlockFeeMultiplier;

  @doc("Median fee multiplier over the last \"numBlocksTransactionFeeStats\" on the current Network.")
  medianFeeMultiplier: BlockFeeMultiplier;

  @doc("Highest fee multiplier over the last \"numBlocksTransactionFeeStats\" on the current Network.")
  highestFeeMultiplier: BlockFeeMultiplier;

  @doc("Lowest fee multiplier over the last \"numBlocksTransactionFeeStats\" on the current Network.")
  lowestFeeMultiplier: BlockFeeMultiplier;

  @doc("Minimal fee multiplier on the current connected Node.")
  minFeeMultiplier: BlockFeeMultiplier;
}
