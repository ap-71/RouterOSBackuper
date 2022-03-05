import {main} from "./pages/main.js";
import {backups} from "./pages/backups.js";
import {tunnels} from "./pages/tunnels.js";
import {discovery} from "./pages/discovery.js";
import {test_page} from "./pages/test_page.js";

// let history_ = {
//     prevPage: '',
//     nextPage: ''
// }
export let routes = (page, change_addr_line=true) => {
    if(change_addr_line){
        change_address_line(page);
    }
      switch (page) {
        case 'main':
            main()
            break;
        case 'backups':
            backups()
            break;
        case 'tunnels':
            tunnels()
            break;
        case 'discovery':
            discovery()
            break;
        case 'test_page':
            test_page()
            break;
    }}

export let change_address_line = (new_address) => {
    // window.history.pushState(null, null, new_address);
    // try {
    // history_.nextPage = history_.prevPage.replace('/', '')
    // history_.prevPage = new_address
    history.pushState({}, new_address, new_address);
    //   return;
    // } catch(e) {}
    // location.hash = '#' + new_address;

}