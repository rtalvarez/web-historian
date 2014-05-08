var fs = require("fs");
var path = require('path');
var archive = require('../helpers/archive-helpers');
var siteList;
// require more modules/folders here!

exports.handleRequest = function (req, res) {
  req.on("data", function(url){
    fetchTxt(req, res, url);
    //res.end(archive.paths.list);
  });
};

var fetchTxt = function(request, response, url){
  fs.readFile("../archives/sites.txt", function(err, data){
    if (err) {
      response.writeHeader(404);
      console.log(err);
      response.end("File not found");
    } else {
      response.writeHeader(200);
      siteList = data.toString().replace(/\n/g," ").split(" ");

      if(searchTxt(url)){
        //fetch html and respond
      }else{
        //send message and go fetch associated html
      }
      response.end();
    }
  });
};

var searchTxt = function(url){
  url = url.slice(url.indexOf("w"));
  for (var i=0; i<siteList.length; i++){
    if(siteList[i] === url){return true;}
  }
  return false;
};
