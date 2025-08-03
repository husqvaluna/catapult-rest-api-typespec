import "../types/core.tsp";
import "./common.tsp";

model VrfKeyLinkNetworkPropertiesDTO {
  @doc("to trigger plugin load")
  dummy?: string;
}

model VrfKeyLinkTransactionBodyDTO {
  linkedPublicKey: PublicKey;
  linkAction: LinkActionEnum;
}
