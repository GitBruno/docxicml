import sys
import os
import argparse
import conversion

def main():
    args      = _parse_args()
    docx_path = args.path
    xslt_path = args.xslt

    result = conversion.convert(
            docx_path,
            xslt_path
        )

    for line in result:
        sys.stderr.write(line)
        sys.stderr.write("\n")

def _parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "path",
        metavar="path",
        help="Path to the .docx file to convert.")

    parser.add_argument(
        "--xslt",
        required=False,
        help="Path to the custom .xslt to use in conversion")

    return parser.parse_args()

if __name__ == "__main__":
    main()
