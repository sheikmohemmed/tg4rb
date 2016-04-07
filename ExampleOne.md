# Example One: HTML Forms #

## Introduction ##

Before going any further, please make sure you have followed the instructions on the GettingStarted page and have everything there working.

## Recording ##

Make sure you have TestGen4Web's toolbar visible. Press the "Record" button.

Go to:

http://www.htmlprimer.com/guides/HTML/Tutorials/articles/htmlForms.html

Click around, fill out forms and everything (there are many different types of HTML elements on that page), then hit "Stop", "Save" and save the file somewhere you like (say `/tmp/example.xml`).

Then, run:

`tg4rb /tmp/example.xml`

That will create a file with the same path and different extension (.rb).

## Playing back ##

Now all you have to do is run the generated file as a normal ruby script:

`ruby /tmp/example.rb`

That's it! You should see Firefox opening and taking the steps you took while recording.


## Troubleshooting ##

There's a known problem about this example: the XML file from TestGen4Web does not contain enough information so that tg4rb can distinguish between different checkboxes and radio buttons, so probably what you'll see is that only the first one gets checked/unchecked several times. A fix for this is in the works.

Any other problem you find please start an "issue" in the Issue Tracker at:

http://code.google.com/p/tg4rb/issues/list

You can also send questions to our mailing list at tg4rb@googlegroups.com. To subscribe, send an empty email to tg4rb-subscribe@googlegroups.com.