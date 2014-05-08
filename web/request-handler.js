var fs = require("fs");
var path = require('path');
var archive = require('../helpers/archive-helpers');
var siteList;
// require more modules/folders here!

exports.handleRequest = function (req, res) {
  req.on("data", function(url){
    url = url.toString();
    url = url.slice(url.indexOf("w"));
    fetchTxt(req, res, url);
    //res.end(archive.paths.list);
  });
};

var fetchTxt = function(request, response, url){
  fs.readFile("../archives/sites.txt", function(err, data){
    if (err) {
      response.writeHeader(404);
      response.end("File not found by fetchTxt");
    } else {
      response.writeHeader(200);
      siteList = data.toString().replace(/\n/g," ").split(" ");

      if(searchTxt(url)){
        //fetch html and respond
        fetchSite(request, response, "../archives/sites/"+url);
        console.log("found");
      }else{
        //send message and go fetch associated html
        console.log("not found");
        // call addTxt
        fetchSite(request, response, "./public/loading.html");
        //response.write("We have a bot that is working on it");
      }
    }
  });
};

var searchTxt = function(url){
  for (var i=0; i<siteList.length; i++){
    if(siteList[i] === url){return true;}
  }
  return false;
};

var fetchSite = function(request, response, url){
  fs.readFile(url, function(err, data){
    if(err){
      response.writeHeader(404);
      console.log("fetchSite failed");
      response.end();
    }else{
      console.log("fetched: ", url);
      response.writeHeader(200, {"Content-Type": "text/html"});
      response.write(data);
      response.end();
    }
  });
};
























