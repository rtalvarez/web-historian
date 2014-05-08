var fs = require("fs");
var path = require('path');
var archive = require('../helpers/archive-helpers');
var siteList;
// require more modules/folders here!

exports.handleRequest = function (req, res) {
  req.on("data", function(url){
    url = url.toString();
    url = url.slice(url.indexOf("w"));
    archive.readListOfUrls(req, res, url);
    //res.end(archive.paths.list);
  });
};

























