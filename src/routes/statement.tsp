import "../types/core.tsp";
import "../models";
import "../parameters.tsp";

using Http;
using OpenAPI;

@tag("Receipt routes")
@route("/statements")
namespace Catapult.Statement {
  @tag("Receipt routes")
  @route("/resolutions")
  namespace Resolution {
    @get
    @route("/address")
    @summary("Get receipts address resolution statements")
    @doc("""
Gets an array of address resolution statements.
""")
    @operationId("searchAddressResolutionStatements")
    op searchAddressResolutionStatements(
      ...Parameters.heightQuery,
      ...Parameters.paginationParameters,
    ): ResolutionStatementPage | ResourceNotFoundError | ConflictError;

    @get
    @route("/mosaic")
    @summary("Get receipts mosaic resolution statements")
    @doc("""
Gets an array of mosaic resolution statements.
""")
    @operationId("searchMosaicResolutionStatements")
    op searchMosaicResolutionStatements(
      ...Parameters.heightQuery,
      ...Parameters.paginationParameters,
    ): ResolutionStatementPage | ResourceNotFoundError | ConflictError;
  }

  @get
  @route("/transaction")
  @summary("Search transaction statements")
  @doc("""
Gets an array of transaction statements.
""")
  @operationId("searchReceipts")
  op searchReceipts(
    ...Parameters.heightQuery,
    ...Parameters.fromHeightQuery,
    ...Parameters.toHeightQuery,
    ...Parameters.receiptTypeQuery,
    ...Parameters.recipientAddressQuery,
    ...Parameters.senderAddressQuery,
    ...Parameters.targetAddressQuery,
    ...Parameters.artifactIdQuery,
    ...Parameters.paginationParameters,
  ): TransactionStatementPage | ResourceNotFoundError | ConflictError;
}
