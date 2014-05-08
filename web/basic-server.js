var http = require("http");
var handler = require("./request-handler");
var urlParse = require("url");
var fs = require("fs");

var port = 8080;
var ip = "127.0.0.1";

var getIndex = function(request, response, path){
  fs.readFile(path, function(err, data){
    if (err) {
      response.writeHeader(404);
      console.log(err);
      response.end("File not found");
    } else {
      response.writeHeader(200);
      response.write(data);
      response.end();
    }
  });
};

var server = http.createServer(function(request, response){

  var path = urlParse.parse(request.url);
  path = path.pathname;
  console.log(request.method, path);
  if(request.method === "GET"){
    getIndex(request, response, "./public/index.html");
  }else{
    handler.handleRequest(request, response);
  }
});


console.log("Listening on http://" + ip + ":" + port);
server.listen(port, ip);

