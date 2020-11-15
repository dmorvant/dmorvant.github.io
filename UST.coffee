styles = """
/* 
 * DimBot V(2.0)
 * Robot rights protected under BOT License
 */

body {
  background-color: #1a1c24; color: #fff;
  font-size: 13px; line-height: 1.4;
  -webkit-font-smoothing: subpixel-antialiased;
}

/* ...                  
 *
 * ...hello?            
 *
 * Howdy Traveler         
 *
 * I'm glad you arrived. I could greatly use your help.          
 *
 * First quest of mine                     
 *
 * I have a couple Ultrasonic Transducers, which seem to not operate 
 * via trigger/echo(I2C) coding mechanics, but rather by serial output.
 * There is a way (via USB to UART) to express the data 
 * in its serial data form via python.
 * ....
 * This is where I seem to have lost traction, I haven't found
 * any code mechanisms to recieve such input,
 * and yield output data for distance sensing.
 *
 *
 * Without supplementing a resistor to convert the sensor
 * to a slower output for I2C configuration, 
 * How would I accomodate such an endeavor?
 *
 *
 *
 *
 * Downloading Virtual Hope Protocol (v1.0).
 *.
 *..
 *...
 * Download Complete(100%).
 * Hope protocol initiated.
 *
 *
 * Hoping you can help.
 *
 *
 *
 */
"""

openComment = false

writeStyleChar = (which) ->
	# begin wrapping open comments
  if which == '/' && openComment == false
    openComment = true
    styles = $('#style-text').html() + which
  else if which == '/' && openComment == true
    openComment = false
    styles = $('#style-text').html().replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>')
  # wrap style declaration
  else if which == ':'
    styles = $('#style-text').html().replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:')
  # wrap style value 
  else if which == ';'
    styles = $('#style-text').html().replace(/([^:]*)$/, '<em class="value">$1</em>;')
  # wrap selector
  else if which == '{'
    styles = $('#style-text').html().replace(/(.*)$/, '<em class="selector">$1</em>{')
  else
    styles = $('#style-text').html() + which
  $('#style-text').html styles
  $('#style-tag').append which

writeStyles = (message, index, interval) ->
  if index < message.length
    pre = document.getElementById 'style-text'
    pre.scrollTop = pre.scrollHeight
    writeStyleChar message[index++]
    setTimeout (->
      writeStyles message, index, interval
    ), interval
    

# appending the tags I'll need.
$('body').append """
  <style id="style-tag"></style>
	<span id="echo"></span>
	<span id="heart"><i></i></span>
	<pre id="style-text"></pre>
"""

# faster typing in small iframe on codepen homepage
time = if window.innerWidth <= 578 then 4 else 16
  
# starting it off
writeStyles(styles, 0, time)
