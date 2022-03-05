import {get_discovery_device} from "../action/getDiscoveryDevice.js";
import {create_card} from "../components/card.js";
import {change_address_line} from "../router.js";

export let discovery = () => {
    get_discovery_device(-1, create_card, true)
}