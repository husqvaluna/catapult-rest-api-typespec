import "../types/core.tsp";
import "../models";
import "../parameters.tsp";

using Http;
using OpenAPI;

@route("/restrictions")
namespace Catapult.Restriction {
  @tag("Restriction Account routes")
  @route("/account")
  namespace Account {
    @get
    @summary("Search account restrictions")
    @doc("""
Returns an array of account restrictions.
""")
    @operationId("searchAccountRestrictions")
    op searchAccountRestrictions(
      ...Parameters.addressQuery,
      ...Parameters.paginationParameters,
    ): AccountRestrictionsPage | ResourceNotFoundError | ConflictError;

    @get
    @route("/{address}")
    @summary("Get the account restrictions")
    @doc("""
Returns the account restrictions for a given address.
""")
    @operationId("getAccountRestrictions")
    op getAccountRestrictions(...Parameters.address): AccountRestrictionsInfoDTO | ResourceNotFoundError | ConflictError;

    @get
    @route("/{address}/merkle")
    @summary("Get the account restrictions merkle")
    @doc("""
Returns the account restrictions merkle for a given address.
""")
    @operationId("getAccountRestrictionsMerkle")
    op getAccountRestrictionsMerkle(...Parameters.address): MerkleStateInfoDTO | ResourceNotFoundError | ConflictError;
  }

  @tag("Restriction Mosaic routes")
  @route("/mosaic")
  namespace Mosaic {
    @get
    @summary("Search mosaic restrictions")
    @doc("Returns an array of mosaic restrictions.")
    @operationId("searchMosaicRestrictions")
    op searchMosaicRestrictions(
      ...Parameters.mosaicIdQuery,
      ...Parameters.entryType,
      ...Parameters.targetAddressQuery,
      ...Parameters.paginationParameters,
    ): MosaicRestrictionsPage | ResourceNotFoundError | ConflictError;

    @get
    @route("/{compositeHash}")
    @summary("Get the mosaic restrictions")
    @doc("Returns the mosaic restrictions for a composite hash.")
    @operationId("getMosaicRestrictions")
    op getMosaicRestrictions(
      ...Parameters.compositeHashPath,
    ): MosaicRestrictionDTO | ResourceNotFoundError | ConflictError;

    @get
    @route("/{compositeHash}/merkle")
    @summary("Get the mosaic restrictions merkle")
    @doc("Returns the mosaic restrictions merkle for a given composite hash.")
    @operationId("getMosaicRestrictionsMerkle")
    op getMosaicRestrictionsMerkle(
      ...Parameters.compositeHashPath,
    ): MerkleStateInfoDTO | ResourceNotFoundError | ConflictError;
  }
}
