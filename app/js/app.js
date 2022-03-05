import {menu} from './components/menu.js';
import {routes} from "./router.js";

menu('.app__menu')
routes(location.pathname.split('/').filter((v)=> v !== '' )[0])
window.addEventListener('popstate', function(e) {
    routes(location.pathname.split('/').filter((v)=> v !== '' )[0], false)
});
