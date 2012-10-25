#!/usr/bin/env python

from distutils.core import setup
import os.path

from libbe import version


rev_id = version.version_info['revision']
rev_date = version.version_info['date']

data_files = []

man_path = os.path.join('doc', 'man', 'be.1')
if os.path.exists(man_path):
    data_files.append(('share/man/man1', [man_path]))

setup(
    name='bugs-everywhere',
    version='{}'.format(version.version()),
    description='Bugtracker supporting distributed revision control',
    url='http://bugseverywhere.org/',
    packages=['libbe',
              'libbe.command',
              'libbe.storage',
              'libbe.storage.util',
              'libbe.storage.vcs',
              'libbe.ui',
              'libbe.ui.util',
              'libbe.util'],
    scripts=['be'],
    data_files=data_files,
    )
