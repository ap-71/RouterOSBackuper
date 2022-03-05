const express = require('express');
const path = require('path');
const app = express();
const cors = require('cors');

app.use(cors({origin: '*'}));
app.use(express.static(path.join(__dirname, '')))
let route  = (req, res) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'origin, content-type, accept');
    res.sendFile(`${__dirname}/index.html`);
}
// app.get('/', (req, res) => {
// 	res.setHeader('Access-Control-Allow-Origin', '*');
//     res.setHeader('Access-Control-Allow-Headers', 'origin, content-type, accept');
//     res.sendFile(`${__dirname}/index.html`);
// });
app.get('/', route)
app.get('/*', route)

app.listen(3333, () => {
    console.log('Application listening on port 3333!');
});