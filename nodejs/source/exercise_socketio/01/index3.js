//오류만 뜸
var app = require('express')();
var fs = require('fs');
const options = {
    ca: fs.readFileSync('petcommunity.p12'),
    key: fs.readFileSync('petcommunity_key.pem'),
    cert: fs.readFileSync('petcommunity_cert.pem'),
};
var https = require('https').createServer(options, app);
var io = require('socket.io')(https);


/*
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index2.html');
});
*/
io.on('connection', (socket) => {
    console.log('a user connected');
    socket.on('disconnect', () => {
        console.log('user disconnected');
      });
  });
io.on('connection', (socket) => {
    socket.on('chat message', (msg) => {
        io.emit('chat message', msg);
        console.log('message: ' + msg);
    });
});

https.listen(3000, '192.168.0.18', () => {
  console.log('listening on *:3000');
});