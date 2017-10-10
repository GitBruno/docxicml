#!/usr/bin/env python

import sys
import conversion

if __name__ == "__main__":
    # execute only if run as a script
    try:
        filePath = sys.argv[1]
    except IndexError:
        raise IndexError('docxicml needs path to source file as first argument')
    
    conversion.convert(filePath, None);
