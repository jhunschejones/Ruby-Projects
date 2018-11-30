Create a command line tool for formatting text into paragraphs. It should accept the name of a file containing the input text, and should print the formatted text to standard out. For example, if you have a file called "`input.txt`" containing the following text:

```
This is
a badly formatted file. This line is pretty long! It's way more than 80 characters! I feel a line wrap coming on!


This      is a second paragraph with extraneous whitespace.
```

Running the command "`format-text input.txt`" should output the following:

```
This is a badly formatted file. This line is pretty long! It's way more than 80
characters! I feel a line wrap coming on!

This is a second paragraph with extraneous whitespace.
```

The formatting should follow these rules:

* Lines should not exceed 80 characters.
* If the 81st character of a line is in the middle of the word, break the line on the closest previous space.
* If a single word exceeds 80 characters, leave that word * intact on a line by itself (this is an exception to the 80-character-per-line limit).
* One blank line between paragraphs.
* No more than one consecutive space or blank line in the formatted text -- collapse multiples into a single space or line.

Your code must be written in Java, Ruby, or Elixir. Your code must include tests. You may use any testing library you like, but the main code must not require any additional libraries or resources beyond the standard built-in libraries for your language of choice.

Your code will be evaluated on three criteria:

**Correctness:** Does it follow all the instructions?

**Code Quality:** Is it readable and well structured?

**Idiomatic Code Style:** Does it follow the stylistic conventions of the language, such as indentation and capitalization?

Once you have completed the challenge, please create a zip file containing your solution and send it back to us as an attachment in a reply to this email.
