var fs = require('fs');
var path = require('path');
var _ = require('underscore');
var httpRequest = require('http-request');

/*
 * You will need to reuse the same paths many times over in the course of this sprint.
 * Consider using the `paths` object below to store frequently used file paths. This way,
 * if you move any files, you'll only need to change your code in one place! Feel free to
 * customize it in any way you wish.
 */

exports.paths = {
  'siteAssets' : path.join(__dirname, '../web/public'),
  'archivedSites' : path.join(__dirname, '../archives/sites/'),
  'list' : path.join(__dirname, '../archives/sites.txt'),
  'loadingPage' : path.join(__dirname, './public/loading.html')
};

// Used for stubbing paths for jasmine tests, do not modify
exports.initialize = function(pathsObj){
  _.each(pathsObj, function(path, type) {
    exports.paths[type] = path;
  });
};

// The following function names are provided to you to suggest how you might
// modularize your code. Keep it clean!

exports.readListOfUrls = function(request, response, url){
  fs.readFile(exports.paths.list, function(err, data){
    if (err) {
      response.writeHeader(404);
      response.end('File not found by UrlListReader');
    } else {
      response.writeHeader(200);
      var siteList = data.toString().replace(/\n/g,' ').split(' ');

      if(exports.isUrlInList(siteList, url)){
        //fetch html and respond
        fetchSite(request, response, exports.paths.archivedSites+url);
        console.log("found");
      }else{
        //send message and go fetch associated html
        console.log("not found");
        // call addTxt
        fetchSite(request, response, exports.paths.loadingPage);
        //response.write("We have a bot that is working on it");
      }
    }
  });
};

var fetchSite = function(request, response, url){
  console.log(url);
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

exports.isUrlInList = function(siteList, url){
  for (var i=0; i<siteList.length; i++){
    if(siteList[i] === url){return true;}
  }
  return false;
};

exports.addUrlToList = function(url){
  fs.appendFile(exports.paths.list, '\n'+url, function(err){
    if (err){ console.log(err); }
  });
};

exports.isURLArchived = function(){
};

exports.downloadUrls = function(url){
  httpRequest.get('http://' + url, function(err, res){
    if (err) {
      console.log(err);
    } else {
      console.log(res.buffer.toString());
    }
  });
};
