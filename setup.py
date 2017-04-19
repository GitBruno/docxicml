#!/usr/bin/env python

import os
import sys
from setuptools import setup

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name='docxicml',
    version='0.1',
    description='Convert Word documents from docx to ICML',
    long_description=read("README"),
    author='Bruno Herfst',
    author_email='mail@brunoherfst.com',
    url='https://github.com/GitBruno/docxicml',
    packages=['docxicml'],
    package_data={
        # Include all XSLT stylesheets
        '': ['*.xslt']
    },
    entry_points={
        "console_scripts": [
            "docxicml=docxicml.cli:main"
        ]
    },
    install_requires=['mammoth','html2textile','lxml','argparse'],
    keywords="docx word office clean html icml",
    license="BSD",
    classifiers=[
		# How mature is this project? Common values are
		#   3 - Alpha
		#   4 - Beta
		#   5 - Production/Stable
		'Development Status :: 3 - Alpha',

		# Indicate who your project is intended for
		'Intended Audience :: Developers',
		# Pick your license as you wish (should match "license" above)
		 'License :: OSI Approved :: BSD License',

		# Specify the Python versions you support here. In particular, ensure
		# that you indicate whether you support Python 2, Python 3 or both.
		'Programming Language :: Python :: 2',
		# 'Programming Language :: Python :: 3',
	],
)