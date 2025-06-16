import "../types/core.tsp";
import "../models";
import "../parameters.tsp";

using Http;
using OpenAPI;

@tag("Transaction status routes")
@route("/transactionStatus")
namespace Catapult.TransactionStatus {
  @post
  @summary("Get transaction statuses")
  @doc("Returns an array of transaction statuses for a given array of transaction hashes.")
  @operationId("getTransactionStatuses")
  op getTransactionStatuses(
    @body body: transactionHashes,
  ): Body<TransactionStatusDTO[]> | BadRequestError | ConflictError;

  @get
  @route("/{hash}")
  @summary("Get transaction status")
  @doc("Returns the transaction status for a given hash.")
  @operationId("getTransactionStatus")
  op getTransactionStatus(
    ...Parameters.transactionHashPath,
  ): TransactionStatusDTO | ResourceNotFoundError | ConflictError;
}
