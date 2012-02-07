# Overview

Twittervision is a public installation that uses a modified CRT television to display tweets from specific geo-locations. By changing the direction of Twittervision's antenna and adjusting the amplitude knob, users can zero in on specific latitude and longitude coordinates to pull tweets from any desired location.  Built with Processing.  For the latest verison of the Processing IDE, visit [Processing.org] (http://www.processing.org)

For more info on Twittervision, see my Cargo Collective site [here] (http://cargocollective.com/kohwi#2287982/Twittervision)

#Setup

##Required Libraries

The following procesisng libraries are necessary for running Twittervision.  To install them, put them inside the libraries folder in your Sketchbook.  Make sure you update the `credentials.txt` file with your twitter username and password to enable proper connection to Twitter's Streaming API.

* [Tweet Stream] (https://github.com/mccv/processing-tweet-stream)
* [Arduino] (http://www.arduino.cc/playground/Interfacing/Processing)
* [Fullscreen] (http://www.superduper.org/processing/fullscreen_api/)

##Physical Setup

The code is initially set to control Twittervision without an Arduino.  Use the arrow keys to adjust the direction and range of the search location relative to the `homeLat` and `homeLon` variables in the `location.pde` file.


If using an Arduino, edit the `twittervision.pde` file and uncomment the first 3 commented out lines of the `setup()` function:

```java
/*  
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(speedUpPin, Arduino.INPUT);
  arduino.pinMode(speedDownPin, Arduino.INPUT);
*/
```

as well as the `readArduino()` line in the `draw()` function.

Wire the potentiometer for the range knob to pin 3, and the potentiometer for the antenna to pin 5.  Additionally, you can wire buttons to pin 4 and 7 to control scroll speed adjustment of the twitter stream across the TV.
