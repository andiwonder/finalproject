console.log("index.js here");

// function pause(btn, vid){
// 	console.log(btn);
// 	var vid = document.getElementById('vid');
// 	if (vid.paused ) {
// 		console.log("paused");
// 		vid.play();
// 		btn.innerHtml = 'paused' ;
// 	} else {
// 		console.log("playing");
// 		vid.pause();
// 		btn.innerHtml = 'play' ;
// 	}

// }

var fs = require('fs');
var ytdl = require('ytdl-core');

ytdl('https://www.youtube.com/watch?v=f1d3Rm7sFCY').pipe(fs.createWriteStream('invoker.mp4'));

// var ffmpeg = require("fluent-ffmpeg");
// // make sure you set the correct path to your video file
// var proc = ffmpeg('/vid.mp4')
//   // set video bitrate
//   .videoBitrate(1024)
//   // set target codec
//   .videoCodec('libx264')
//   // set aspect ratio
//   .aspect('16:9')
//   // set size in percent
//   .size('50%')
//   // set fps
//   .fps(24)
//   // set audio bitrate
//   .audioBitrate('128k')
//   // set audio codec
//   .audioCodec('libmp3lame')
//   // set number of audio channels
//   .audioChannels(2)
//   // set custom option
//   .format('mp4')
//   // setup event handlers
//   .on('end', function() {
//     console.log('file has been converted succesfully');
//   })
//   .on('error', function(err) {
//     console.log('an error happened: ' + err.message);
//   })
//   // save to file
//   .save('/path/to/your_target.avi');