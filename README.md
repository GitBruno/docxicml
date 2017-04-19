
DOCX to ICML converter 
======================

docxicml is designed to convert .docx documents to ICML. It's main intend is to help getting content ready for hybrid publishing. It aims to produce simple and clean snippets by using semantic information only, therefore ignoring things like font-info and colours. Unlike Pandoc, docxicml believes (and assumes that) styles are applied semantically, and therefore keeps style references.

This package is standing on the shoulders of [Python-Mammoth](https://github.com/mwilliamson/python-mammoth) it creates dynamic style maps and adds an XSLT stylesheet to transform the HTML to ICML.

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

Word is still the most used text editing tool in use. docxicml makes it easy to port DOCX documents to InDesign (ICML).

The reason for this tool is threefold:

 1. Prepare content for hybrid publishing
 2. Keep page breaks when moving from DOCX to InDesign
 3. Remove all non-semantical style over-rides (eg keep unstyled italics, bolds etc)


Usage
-----

Convert a word document to `xhtml` and `icml` with the following command:

    docxicml source.docx

Both HTML and ICML will be saved on the same location as source.doc


Supported Elements
------------------
The following features are currently supported:

* Paragraph Styles

* Character Styles

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

* Breaks  
  (Line, Column, Page)


Installation
------------

docxicml requires [XSLT 2.0][] or above. I chose [Saxon][] to provide the implementation, but you can roll your own.

[XSLT 2.0]: https://www.w3.org/TR/xslt20/
[Saxon]: http://www.saxonica.com/

#### Standard installation ####

Install Saxon (XSLT 2.0):

    brew install saxon

Install docxicml:

    make install


Limitations
-----------
As it stands, there is lots of room for improvements. First and foremost we need to finalise implementation of all the [elements listed above](#supported-elements). 

In the future it would be good if we could round-trip the files. Eg Convert IDML back to DOCX, this way we can keep all files updated when there is a change.


Getting Help
------------

Found a bug? Please [file an Issue][] on GitHub.

[file an issue]: http://github.com/gitbruno/docxicml/issues
