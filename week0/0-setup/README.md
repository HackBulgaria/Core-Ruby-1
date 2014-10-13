# Setup

Installing Ruby 2.1.3, isn't newbie friendly. Here are our tips on how to
install it on your favourite OS.

## Windows

The easiest way to get Ruby 2.1.3 on Windows is this [Ruby Installer][]. Don't
forget to add the `C:\Ruby-213\bin` to the beginning of `%PATH%`.
[Here][Windows Path] is how to do it.

## Linux & OSX

Follow the instructions on [rbenv installation page][]. After rbenv is
installed, run the following in a fresh terminal session.

```bash
rbenv install 2.1.3 && rbenv global 2.1.3
```

[Ruby Intaller]: http://rubyinstaller.org/
[Windows Path]: http://www.computerhope.com/issues/ch000549.htm
[rbenv installation page]: https://github.com/sstephenson/rbenv#installation
