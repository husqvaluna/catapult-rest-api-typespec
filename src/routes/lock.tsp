import "../types/core.tsp";
import "../models";
import "../parameters.tsp";

using Http;
using OpenAPI;

@route("/lock")
namespace Catapult.HashLock {
  @route("/hash")
  @tag("Hash Lock routes")
  namespace Hash {
    @get
    @summary("Search hash lock entries")
    @doc("Returns an array of hash locks.")
    @operationId("searchHashLock")
    op searchHashLock(
      ...Parameters.addressQuery,
      ...Parameters.pageSizeQuery,
      ...Parameters.pageNumberQuery,
      ...Parameters.offsetQuery,
      ...Parameters.orderQuery,
    ): HashLockPage | (ConflictResponse & ModelError);

    @tag("Hash Lock routes")
    @route("/{hash}")
    @get
    @summary("Get hash lock information")
    @doc("Gets the hash lock for a given hash.")
    @operationId("getHashLock")
    op getHashLock(...Parameters.hashPath): HashLockInfoDTO | (ConflictResponse & ModelError);

    @tag("Hash Lock routes")
    @route("/{hash}/merkle")
    @get
    @summary("Get hash lock merkle information")
    @doc("Gets the hash lock merkle for a given hash.")
    @operationId("getHashLockMerkle")
    op getHashLockMerkle(...Parameters.hashPath): MerkleStateInfoDTO | (ConflictResponse & ModelError);
  }

  @route("/secret")
  @tag("Secret Lock routes")
  namespace Secret {
    @get
    @summary("Search secret lock entries")
    @doc("Returns an array of secret locks.")
    @operationId("searchSecretLock")
    op searchSecretLock(
      ...Parameters.addressQuery,
      ...Parameters.secretQuery,
      ...Parameters.pageSizeQuery,
      ...Parameters.pageNumberQuery,
      ...Parameters.offsetQuery,
      ...Parameters.orderQuery,
    ): SecretLockPage | (ConflictResponse & ModelError);

    @route("/{compositeHash}")
    @get
    @summary("Get secret lock information")
    @doc("Gets the hash lock for a given composite hash.")
    @operationId("getSecretLock")
    op getSecretLock(...Parameters.compositeHashPath): SecretLockInfoDTO | (ConflictResponse &
      ModelError);

    @route("/{compositeHash}/merkle")
    @get
    @summary("Get secret lock merkle information")
    @doc("Gets the hash lock merkle for a given composite hash.")
    @operationId("getSecretLockMerkle")
    op getSecretLockMerkle(...Parameters.compositeHashPath): MerkleStateInfoDTO | (ConflictResponse &
      ModelError);
  }
}
