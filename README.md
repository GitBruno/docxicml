

docx-cavate DOCX to ICML converter 
==================================

docx-cavate is designed to convert .docx documents, such as those created by Microsoft Word, and convert them to Textile and ICML. It's main intend is to help getting content ready for both digital and print publishing. It aims to produce simple and clean snippets by using semantic information only, therefore ignoring things like font-info and colours. Unlike Pandoc, docx-cavate believes and assumes that styles are applied semantically, and therefore keeps any style references bewteen formats.

This package is standing on the shoulders of [Python-Mammoth](https://github.com/mwilliamson/python-mammoth) to convert the docx to html, and [html2textile](https://bitbucket.org/ergo/html2textile) to convert HTML to Textile. Then it uses an XSLT stylesheet to transform the HTML to ICML.

There's a large mismatch between the structure used by .docx and the structure of Texttile and IDML, this means that the conversion is unlikely to be perfect for more complicated documents.

Contents
--------

 1. [Rationale](#rationale)
 2. [Usage](#usage)
 3. [Supported Elements](#supported-elements)
 4. [Installation](#installation)
 5. [Limitations](#limitations)
 6. [Getting Help](#getting-help)


Rationale
---------

Word (The elephant in the room) is still the most used text editing tool in use. docx-cavate makes it easy to port DOCX documents via HTML to Textile and ICML.

The reason for this tool is threefold:

 1. Prepare content for hybrid publishing
 2. Keep a clean output independent source file (Textile)
 3. Remove all style over-rides except when semantical (eg unstyled italics)


Usage
-----

Convert a word document to `xhtml` `textile` and `icml` with the following command:

    docx-cavate source.docx


Supported Elements
------------------
The following features are currently supported:

* Custom Paragraph Styles

* Custom Character Styles

* Bold and italics  
  (Underlines and colours are ignored)

* Strikethrough

* Headings

* Lists

* Tables  
  (Yet to be implemented)
  
* Footnotes and endnotes  
  (Yet to be implemented)

* Images  
  (Yet to be implemented)

* Superscript and subscript  
  (Yet to be implemented)

* Links  
  (Yet to be implemented)

* Line breaks  
  (Yet to be implemented)

* Comments
  (Yet to be implemented)


Installation
------------

docx-cavate requires [XSLT 2.0][] or above. I chose [Saxon][] to provide the implementation, but you can roll your own.

[XSLT 2.0]: https://www.w3.org/TR/xslt20/
[Saxon]: http://www.saxonica.com/

#### Standard installation ####

Install Saxon (XSLT 2.0):

    brew install saxon

Install docx-cavate:

    make install


Limitations
-----------
As it stands, this tool is still a prototype and there is lots of room for improvements. First and foremost we need to finalise implementation of all the [elements listed above](#supported-elements). 

In the future it would be good if we could round-trip the files. Eg save a Textile file back to DOCX, this way we can keep all files updated when there is a change. (And there is always a change!)


Getting Help
------------

If you have any difficulties with docx-cavate, or would like to see a new feature, please [file an Issue][] on GitHub.

[file an issue]: http://github.com/gitbruno/docx-cavate/issues
