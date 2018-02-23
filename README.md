
DOCX to ICML converter 
======================

docxicml is designed to convert MS Word (DOCX) documents to Adobe InDesign (ICML). It aims to produce clean files using semantic information only. 

This converter ignores all non-semantical info like font names and colours. It will however keep track of unstyled italics, bolds and page breaks. Unlike [Pandoc](https://pandoc.org/), docxicml assumes styles are applied semantically and therefore tracks all style references.

This package is standing on the shoulders of [Python-Mammoth](https://github.com/mwilliamson/python-mammoth) it generates a dynamic style map and transform the HTML to ICML using a XSLT stylesheet.

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
* Bold and italic  
* Strikethrough and Underlines  
* Superscript and Subscript  
* Headings  
* Ordered and Unordered Lists  
* Tables (Including headers and footers)  
* Footnotes and endnotes (Yet to be implemented)   
* Line, Column and Page Breaks  
* Hyperlinks (Yet to be implemented)  
* Images (Only embedded EMF) 


Dependencies
------------

docxicml requires [Java 6](https://www.java.com/en/download/) or later. (It uses [SaxonHE](https://sourceforge.net/projects/saxon/files/Saxon-HE/) for [XSLT 2.0](https://www.w3.org/TR/xslt20/) transformations.)


Installation
------------

    make install


Limitations
-----------

As it stands, there is room for improvements. We need to finalise implementation of all [elements](#supported-elements) listed above. It might be a good idea to port this to Javascript so we can run it with easy on a wide variety of systems without installing the Java runtime. Both XSLT processor and Mammoth have Javascript implementations: [mammoth.js](https://github.com/mwilliamson/mammoth.js), [Saxon-JS](www.saxonica.com/saxon-js). It would be usefull to be able to round-trip the files.


Getting Help
------------

Bugs and feature requests are tracked with [GitHub Issue Tracker](http://github.com/gitbruno/docxicml/issues).


[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)

