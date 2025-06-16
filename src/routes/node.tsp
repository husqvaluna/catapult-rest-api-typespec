import "../types/core.tsp";
import "../models";
import "../parameters.tsp";

using Http;
using OpenAPI;

@tag("Node routes")
@route("/node")
namespace Catapult.Node {
  @get
  @route("/health")
  @summary("Get the node health information")
  @doc("Supplies information regarding the connection and services status.")
  @operationId("getNodeHealth")
  op getNodeHealth(): NodeHealthInfoDTO | {
    @statusCode statusCode: 503;
    @body body: NodeHealthInfoDTO;
  };

  @get
  @route("/info")
  @summary("Get the node information")
  @doc("Supplies additional information about the application running on a node.")
  @operationId("getNodeInfo")
  op getNodeInfo(): NodeInfoDTO;

  @get
  @route("/peers")
  @summary("Get peers information")
  @doc("Gets the list of peers visible by the node.")
  @operationId("getNodePeers")
  op getNodePeers(): Body<NodeInfoDTO[]>;

  @get
  @route("/storage")
  @summary("Get the storage information of the node")
  @doc("Returns storage information about the node.")
  @operationId("getNodeStorage")
  op getNodeStorage(): StorageInfoDTO;

  @get
  @route("/time")
  @summary("Get the node time")
  @doc("Gets the node time at the moment the reply was sent and received.")
  @operationId("getNodeTime")
  op getNodeTime(): NodeTimeDTO;

  @get
  @route("/server")
  @summary("Get the version of the running REST component")
  @doc("Returns the version of the running catapult-rest component.")
  @operationId("getServerInfo")
  op getServerInfo(): ServerInfoDTO;

  @get
  @route("/unlockedaccount")
  @summary("Get the unlocked harvesting account public keys.")
  @doc("Returns array of unlocked account public keys.")
  @operationId("getUnlockedAccount")
  op getUnlockedAccount(): UnlockedAccountDTO;
}
