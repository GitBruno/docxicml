
DOCX to ICML converter 
======================

docxicml is designed to convert MS Word (DOCX) documents to Adobe InDesign (ICML). It aims to produce clean files by using semantic information only. 

Therefore ignoring all non-semantical over-rides like font-info and colours. It will however keep unstyled italics, bolds and page breaks. Unlike [Pandoc](https://pandoc.org/), docxicml believes (and assumes that) styles are applied semantically.

This package is standing on the shoulders of [Python-Mammoth](https://github.com/mwilliamson/python-mammoth) it creates dynamic style maps and adds an XSLT stylesheet to transform the HTML to ICML.

Contents
--------

 1. [Usage](#usage)
 2. [Supported Elements](#supported-elements)
 3. [Dependencies](#dependencies)
 5. [Installation](#installation)
 5. [Limitations](#limitations)
 6. [Getting Help](#getting-help)


Usage
-----

Convert a word document (`docx`) to `xhtml` and `icml` with the following command:

    docxicml source.docx

The newly generated files will be at the same location as source document:

    source.docx
    source.xhtml
    source.icml

Supported Elements
------------------
The following elements are supported:

* Paragraph Styles
* Character Styles
* Bold and italic (Underlines and colours are ignored)
* Strikethrough
* Headings
* Lists
* Tables (Partly implemented, headers and footers still to do)
* Footnotes and endnotes (Yet to be implemented)
* Images (Yet to be implemented)
* Superscript and subscript (Yet to be implemented)
* Links (Yet to be implemented)
* Breaks (Line, Column, Page)


Dependencies
------------
docxicml requires [Java 6](https://www.java.com/en/download/) or later.


Installation
------------

    make install


Limitations
-----------
As it stands, there is room for improvements. First and foremost we need to finalise implementation of all [elements](#supported-elements) listed above.

In the future it would be good if we could round-trip; Convert IDML back to DOCX, this way we can keep all files updated when there is a change.


Getting Help
------------

Found a bug? Please [file an Issue][] on GitHub.

[file an issue]: http://github.com/gitbruno/docxicml/issues
