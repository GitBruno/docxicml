#!/usr/bin/env python

"""

A tool to automatically create a stylemap for the Python-Mammoth converter
https://github.com/mwilliamson/python-mammoth

"""

import mammoth, re

pStyleDict = {}
rStyleDict = {}
style_map = ""

def addToStyles(styleInfo):
    if styleInfo[0] == 'paragraph':
        pStyleDict[styleInfo[1]] = styleInfo[1]
    elif styleInfo[0] == 'run':
        rStyleDict[styleInfo[1]] = styleInfo[1]
    else:
        # Let user know if we find an invalid style type
        print 'INFO: docx-cavate: Not a valid style type: ' + str(styleInfo)

def create_stylemap(docx_fullPath):
    # reset global variabels
    global pStyleDict, rStyleDict, style_map

    pStyleDict = {}
    rStyleDict = {}
    style_map  = ""

    # Build style map from convert messages (missing style warnings)
    with open(docx_fullPath, "rb") as docx_file:
        messages = mammoth.convert_to_html(docx_file, ignore_empty_paragraphs=False).messages

    for m in messages:
        if m.type == "warning":
            if 'Unrecognised ' and ' style' and ': ' in m.message:
                styleInfoString = m.message.encode("utf-8")
                styleInfo = styleInfoString.split(': ')
                styleInfo[0] = styleInfo[0].replace('Unrecognised ', '').replace(' style', '')
                styleInfo[1] = styleInfo[1].split(' (')[0]
                addToStyles(styleInfo)
            else:
                print 'docx-cavate warning: ' + str(m.message)
        else:
            print m

    # Generate the style map that mammoth can use
    # Any custom styles go to a span element with class name -> style name
    for k in pStyleDict:
        # replace spaces in the name with period
        className = re.sub(' ', '.', pStyleDict[k])
        # remove any other special chars
        className = re.sub('[^A-Za-z0-9\-\.]+', '', className)
        style_map += "\np[style-name='" + pStyleDict[k] + "'] => p.x-" + className + ":fresh"

    for k in rStyleDict:
        # replace spaces in the name with period
        className = re.sub(' ', '.', rStyleDict[k])
        # remove any other special chars
        className = re.sub('[^A-Za-z0-9\-\.]+', '', className)
        style_map += "\nr[style-name='" + rStyleDict[k] + "'] => span.x-" + className
    
    style_map += "\nbr[type='line'] => br.line"
    style_map += "\nbr[type='column'] => br.column"
    style_map += "\nbr[type='page'] => br.page"
    

    # add some standard lines
    # style_map += "\nu => span.underline" #Mammoth is ignoring underlines by default

    # Remove first new line and convert back to unicode string
    if style_map.startswith('\n'):
        style_map = style_map[style_map.index('\n')+1:]

    style_map = unicode(style_map, "utf-8")
    
    print "-- generated stylemap -------------"
    print style_map
    print "-----------------------------------"
    
    return style_map
