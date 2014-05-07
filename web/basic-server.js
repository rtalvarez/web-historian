var http = require("http");
var handler = require("./request-handler");
var urlParse = require("url");

var port = 8080;
var ip = "127.0.0.1";
var server = http.createServer(function(request, response){

  var path = urlParse.parse(request.url);
  path = path.pathname;
});
  //handler.handleRequest


console.log("Listening on http://" + ip + ":" + port);
server.listen(port, ip);

