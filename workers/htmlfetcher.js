// eventually, you'll have some code here that uses the code in `archive-helpers.js`
// to actually download the urls you want to download.
var httpRequest = require('http-request');
var _ = require('underscore');
var archive = require('../helpers/archive-helpers.js');
var fs = require ('fs');
var async = require('async');
var list;
var fullPathsList = [];
var archivedSites;

// _(getUrls()).reject(isArchived).map(archive);
// async

var writeSite = function(url, data){
  //console.log('writing site: ', data);
  fs.writeFile(archive.paths.archivedSites+url, data.buffer.toString(), function(err){
    if (err) { console.log('writing error: ', err); }
  });
};

var readTextFile = function(callback){
  fs.readFile(archive.paths.list, function(err, data){
    if (err) {
      console.log('File not found by readTextFile');
    } else {
      list = data.toString().replace(/\n/g,' ').split(' ');
      callback(asyncDownloadWrite);
    }
  });
};

var appendToList = function(callback){
  for(var i=0; i<list.length; i++){
    fullPathsList[i] = archive.paths.archivedSites +list[i];
  }
  console.log(list);
  callback();
};

var readArchiveDirectory = function(callback){
  fs.readdir(archive.paths.archivedSites, function(err, files){
    if(err){
      console.log('reading error: ', err);
    }else{
      archivedSites = files;
      callback();
    }
  });
};

var download = function(website){
  httpRequest.get(website, function(err, data){
    console.log(website);
    if(err){
      console.log('downloading error: ', err);
    }else{
      writeSite(website, data);
    }
  });
};

readTextFile(appendToList);

var asyncDownloadWrite = function(){
  async.reject(fullPathsList, fs.exists, function(results){
    console.log('filter results: ', results);
    async.each(results, function(file){
      var webSite = file.slice(file.indexOf('www'));
      download(webSite);
    },
    function(err){
      if(err){console.log('filtering error: ', err);}
    });
  });
};






























