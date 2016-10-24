#!/usr/bin/env python

import re, sys, os
import ntpath
import subprocess
import mammoth
import string
from lxml import html, etree

utf8_parser = etree.XMLParser(encoding='utf-8')

pStyleDict = {}
rStyleDict = {}
style_map = ""

# Receive filepath from stdin
def noPath(path):
    head, tail = ntpath.split(path)
    return tail or ntpath.basename(head)

def prePath(path):
    head, tail = ntpath.split(path)
    return head + "/"

try:
    givenFilePath = sys.argv[1]
    base_dir = prePath(givenFilePath)
    fileName = os.path.splitext( noPath(givenFilePath) )[0]
except IndexError:
    raise IndexError('docx_2_html.py needs filename as first argument')

def parse_from_unicode(unicode_str):
    s = unicode_str.encode('utf-8')
    return etree.fromstring(s, parser=utf8_parser)

def main():
    global style_map;
    
    # Build style map from convert messages (missing style warnings)
    with open(givenFilePath, "rb") as docx_file:
        messages = mammoth.convert_to_html(docx_file).messages

    for m in messages:
        if m.type == "warning":
            if 'Unrecognised ' and ' style' and ': ' in m.message:
                styleInfoString = m.message.encode("utf-8")
                styleInfo = styleInfoString.split(': ')
                styleInfo[0] = styleInfo[0].replace('Unrecognised ', '').replace(' style', '')
                styleInfo[1] = styleInfo[1].split(' (')[0]
                addToStyles(styleInfo)
            else:
                print 'WARNING: ' + str(m.message)
        else:
            print m
    
    # Generate the style map that mammoth can use
    # Any custom styles go to a span element with class name -> style name
    for k in pStyleDict:
        className = re.sub('[^A-Za-z0-9]+', '', pStyleDict[k])
        style_map += "\np[style-name='" + pStyleDict[k] + "'] => p." + className + ":fresh"

    for k in rStyleDict:
        className = re.sub('[^A-Za-z0-9]+', '', rStyleDict[k])
        style_map += "\nr[style-name='" + rStyleDict[k] + "'] => span." + className + ":fresh"
    
    # Remove first new line and convert back to unicode string
    style_map = style_map[style_map.index('\n')+1:]
    style_map = unicode(style_map, "utf-8")
    
    print "Generated Stylemap ----------------"
    print style_map
    print "-----------------------------------"
    
    # Now we can convert docx with generated style map
    with open(givenFilePath, "rb") as docx_file:
        result = mammoth.convert_to_html(docx_file, style_map=style_map)
        messages = result.messages # Any messages, such as warnings during conversion
        html = "<body>" + result.value + "</body>" # XML needs a root tag
        
        # Remove non-semantic whitespace and make sure it is XHTML (read XML) 
        # xhtml = re.sub('(?<!>)\n',' ', etree.tostring( parse_from_unicode(html) ) )
        xhtml = etree.tostring( parse_from_unicode(html) )
        
        saveFile = open( os.path.join(base_dir, fileName+".html"), "w+")
        saveFile.write( xhtml )
        saveFile.close()

    # Display any messages, such as warnings during conversion
    for m in messages:
        print m

    subprocess.call(["saxon", "-o:"+os.path.join(base_dir, fileName+".icml"), "-s:"+os.path.join(base_dir, fileName+".html"), "xhtml_2_icml.xslt"])

def addToStyles(styleInfo):
    if styleInfo[0] == 'paragraph':
        pStyleDict[styleInfo[1]] = styleInfo[1]
    elif styleInfo[0] == 'run':
        rStyleDict[styleInfo[1]] = styleInfo[1]
    else:
        print 'ERROR: Not a valid style type: ' + str(styleInfo)

main();
