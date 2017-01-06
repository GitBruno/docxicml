#!/usr/bin/env python

"""

A wrapper for conversion libraries like Mammoth and html2textile
and of course my own XSLT stylesheet

"""

import os, io, re, ntpath, subprocess

import mammoth
from html2textile import *
from lxml import html, etree

import stylemapper

def _noPath(path):
    head, tail = ntpath.split(path)
    return tail or ntpath.basename(head)

def _prePath(path):
    head, tail = ntpath.split(path)
    return head + "/"

def _splitFullPath(fullPath):
    baseDir = _prePath(fullPath)
    fileName = os.path.splitext( _noPath(fullPath) )[0]
    scriptPath = _prePath(os.path.abspath(__file__))
    return {'fullPath': fullPath, 'baseDir': baseDir, 'fileName': fileName, 'scriptPath': scriptPath }

def _parse_from_unicode(unicode_str):
    utf8_parser = etree.XMLParser(encoding='utf-8')
    s = unicode_str.encode('utf-8')
    return etree.fromstring(s, parser=utf8_parser)

def docx_to_html(filePath, style_map):
    pathInfo = _splitFullPath(filePath)
    with open(filePath, "rb") as docx_file:
        result = mammoth.convert_to_html(docx_file, style_map=style_map, ignore_empty_paragraphs=False)
        messages = result.messages # Any messages, such as warnings during conversion
        html = "<body>" + result.value + "</body>" # XML needs a root tag
        
        prettyhtml = etree.tostring(_parse_from_unicode(html) ) #pretty_print=True indesign parses spaces
        
        # remove empy white space at end of paragraphs
        prettyhtml = re.sub("\s+(?=\<\/p\>)", "", prettyhtml)
        # remove double spaces
        prettyhtml = re.sub(" +", " ", prettyhtml)
        # revert to original class names
        prettyhtml = prettyhtml.replace(' class="x-', ' class="')

        htmlPathStr = os.path.join(pathInfo["baseDir"], pathInfo["fileName"] + ".html")
        
        saveFile = open( htmlPathStr, "w+")
        saveFile.write( prettyhtml )
        saveFile.close()



    # Display any messages, such as warnings during conversion
    for m in messages:
        print m
        
    print "INFO: docxcavate finished conversion from DOCX to HTML"

    return htmlPathStr

def html_to_textile(filePath):
    pathInfo = _splitFullPath(filePath)
    html = etree.parse(filePath)
    prettyhtml = etree.tostring(html, pretty_print = True)
    textile = html2textile( prettyhtml );
    texPathStr = os.path.join(pathInfo["baseDir"], pathInfo["fileName"] + ".textile")
    saveFile = io.open( texPathStr, "w+", encoding='utf8')
    saveFile.write( textile )
    saveFile.close()

def html_to_icml(filePath):
    pathInfo = _splitFullPath(filePath)
    icmlPathStr = os.path.join(pathInfo["baseDir"], pathInfo["fileName"] + ".icml")
    # Call a system process
    output = subprocess.check_output(["saxon", "-o:"+icmlPathStr, "-s:"+os.path.join(pathInfo["baseDir"], pathInfo["fileName"] + ".html"), os.path.join(pathInfo["scriptPath"], "xhtml_2_icml.xslt")], stderr=subprocess.STDOUT)
    print output or "INFO: docxcavate finished conversion from HTML to ICML"
    return icmlPathStr

def convert(docxPath):
    # Generate stylemap
    styleMap = stylemapper.create_stylemap(docxPath);
    # XHTML is the heart of all conversion
    htmlPath = docx_to_html(docxPath, styleMap);
    # html_to_textile(htmlPath);
    html_to_icml(htmlPath);
    
