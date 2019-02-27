## TWWGPXporter

The name sucks, I know.  
  
This is a work in progress. The idea is to make creating, exporting, and displaying GPX files easy with Objective-C, since I'm too stubborn to learn Swift. 
  
Currently this project can do the following:  
- Create GPX files
- Parse GPX files (GPXParser isn't fully implemented but it will parse most GPX files just fine. The parser is kind of slow - it takes about 30 seconds to parse a GPX file with ~20k points)
- Draw the GPX file onto a map.
  
Eventually it'll do more, but for now it's very basic.
  
  
Included is an example GPX file that I exported from a ride I uploaded to Strava. The project will display that file on a map for you as an example.
