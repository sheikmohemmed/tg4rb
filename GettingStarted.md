# What are we dealing with here? #

**tg4w** is a _translator_, so it sits logically between two other pieces of software, translating the output from one into the input of the other. These two pieces of software are:

  * **TestGen4Web**
> > This is the Firefox extension that allows you to record your actions on the browser. You press the "Record" button, go around clicking links, buttons and filling forms, press "Stop", and you end up with a XML file that describes what you just did. This XML file is what **tg4w** takes as input.

  * **FireWatir**
> > This is a library for Ruby that allows you to control an instance of Firefox with code like `ff.text_field(:name,"q").set("ruby")`.
> > As it's not a program _per se_, we don't actually give it _input_. We write code that uses its classes and methods to reproduce the actions we recorded with TestGen4Web. That code is what **tg4w** outputs.

So the first thing we need is to get those two working. As tg4w required a few changes from both TestGen4Web and FireWatir, and those aren't yet present in current releases, **we'll have to patch things up from svn** _(for FireWatir, you can wait for version 1.1 which is just around the corner)_.

# Patching TestGen4Web #

First we need to install the current release of the extension. Go to:

http://developer.spikesource.com/frs/?group_id=14&release_id=71

download and install the latest version (0.41.1-beta). This will create a directory `{3c20433a-61bc-42fe-831d-415860e17283}` under `~/.mozilla/firefox/vllrmpro.default/extensions` (or wherever else your firefox extensions are kept).

Enter that directory, download the patch and apply it:

```
cd ~/.mozilla/firefox/vllrmpro.default/extensions/\{3c20433a-61bc-42fe-831d-415860e17283\}
wget http://tg4rb.googlecode.com/svn/trunk/tg4w_release_patch.txt
patch -p0 < tg4w_patch.txt
```

And, voilá! Restart your Firefox and you should see... well, nothing different. The patch basically deals with how the XML file is generated.

This part now done, we need to get FireWatir.


# FireWatir from SVN #

**If you have FireWatir >= 1.1, you don't need this**. Else, check out the code from svn into a directory of your choice:

```
cd ~/work
svn checkout http://firewatir.googlecode.com/svn/trunk/ firewatir
```

Get the patch and apply it:

```
cd ~/work/firewatir
wget http://tg4rb.googlecode.com/svn/trunk/firewatir_patch.txt
patch -p0 < firewatir_patch.txt
```

Now we build the gem again and install it:

```
cd ~/work/firewatir/FireWatir
gem build firewatir.gemspec
sudo gem install firewatir-1.0.2
```

And that's it. The foundations are laid, now let's get to **tg4rb** itself.


# tg4rb: from Gem #

Dead simple:

`sudo gem install tg4rb`

If RubyForge doesn't have it up yet, or if you need to install it in your cottage in the woods with no internet access, you can download it from:

http://tg4rb.googlecode.com/files/tg4rb-1.0.0.gem

and then run:

`sudo gem install path-to-file`


# tg4rb: from SVN #

TODO

# What now? #

You've got everything installed, so [go do your first example](ExampleOne.md)!