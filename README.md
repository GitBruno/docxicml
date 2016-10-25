

Elephant .docx to ICML converter
================================

Elephant is designed to convert .docx documents, such as those created by Microsoft Word, and convert them to ICML. (An IDML snippet type for Adobe Indesign)
Elephant aims to produce simple and clean snippets by using semantic information only, therefore ignoring styling as font-info, colour, etc.

There's a large mismatch between the structure used by .docx and the structure of IDML, meaning that the conversion is unlikely to be perfect for more complicated documents. Elephant assumes styles are only used to semantically mark up your document.


Contents
--------

 1. [Rationale](#rationale)
 2. [Usage](#usage)
 3. [Supported Tags](#supported-tags)
 4. [Installation](#installation)
 5. [Getting Help](#getting-help)


Rationale
---------

Word is still the most used text editing tool in use. Elephant makes it easy to port DOCX documents via HTML to ICML.

The reason for this tool is threefold:

 1. Keep a clean output independent source file
 2. Keep any semantic styles like italics even they are not styles properly
 3. Remove style over-rides (Only keep character/paragraph style references)


Usage
-----

To convert a file use the following command:

    python elephant sourcedoc


Supported Elements
------------------
The following features are currently supported:

* Custom Paragraph Styles

* Custom Character Styles

* Bold, italics

* Headings

* Lists
  Yet to be implemented

* Tables
  Yet to be implemented
  
* Footnotes and endnotes.
  Yet to be implemented

* Images
  Yet to be implemented

* Underlines, strikethrough, superscript and subscript.
  Yet to be implemented

* Links.
  Yet to be implemented

* Line breaks.
  Yet to be implemented

* Text boxes. The contents of the text box are treated as a separate paragraph
  that appears after the paragraph containing the text box.
  Yet to be implemented

* Comments.
  Yet to be implemented


Installation
------------

Elephant requires [Mammoth][] and [XSLT 2.0][]. I chose the famous [Saxon][] to provide the implementation.

[Mammoth]: https://github.com/mwilliamson/python-mammoth
[XSLT 2.0]: https://www.w3.org/TR/xslt20/
[Saxon]: https://sourceforge.net/projects/saxon/

#### Standard installation ####

Install Saxon:

    brew install saxon

Install Mammoth

    pip install mammoth



Getting Help
------------

If you have any difficulties with keep-style-refs, or would like to see a new feature, please [file an Issue][] on GitHub.

[file an issue]: http://github.com/gitbruno/keep-style-refs/issues
