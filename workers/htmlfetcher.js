// eventually, you'll have some code here that uses the code in `archive-helpers.js`
// to actually download the urls you want to download.
var httpRequest = require('http-request');
var _ = require('underscore');
var archive = require('../helpers/archive-helpers.js');
var fs = require ('fs');
var list;
var archivedSites;

// urls <- content of file
// reject all urls that we already archived
// archive all other urls
//
// _(getUrls()).reject(isArchived).map(archive);
// async

var writeSite = function(url, data){
  fs.writeFile(archive.paths.archivedSites+url, data, function(err){
    if (err) { console.log(err); }
  });
};

fs.readFile(archive.paths.list, function(err, data){
  if(err){
    console.log(err);
  }else{
    list = data.toString().replace(/\n/g,' ').split(' ');
    fs.readdir(archive.paths.archivedSites, function(err, files){
      if(err){
        console.log(err);
      }else{
        archivedSites = files;
        console.log(archivedSites);
        for (var i=0; i<list.length; i++){
          if(!_.indexOf(archivedSites, list[i])){
            httpRequest.get('http://' + list[i], function(err, res){
              if (err) {
                console.log(err);
              } else {
               // writeSite(list[i], res.buffer.toString());
              }
            });
          }
        }
      }
    }
);}

});


