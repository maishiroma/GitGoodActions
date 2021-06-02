# -*- coding: utf-8 -*-

from setuptools import setup, find_packages
from distutils.core import Command
import platform


class DisabledCommands(Command):
    user_options = []

    def initialize_options(self):
        raise Exception('This command is disabled')

    def finalize_options(self):
        raise Exception('This command is disabled')


# with open('README.md') as f:
#     readme = f.read()

# Sometimes requirements in setup.py are supposed to be just whats required to run
# the application. This this case thats teh same as requirements.txt
# For more info: https://packaging.python.org/discussions/install-requires-vs-requirements/
if platform.system().lower() == "windows":
    requirements = [line.strip() for line in open("win-requirements.txt").readlines()]
else:
    requirements = [line.strip() for line in open("requirements.txt").readlines()]

# Version here doesnt matter much since we are not
# installing this outside of our repo or shipping
# to pypi
setup(
    version='1.0.0',
    name='test',
    description='Test Description',
    # long_description=readme,
    author='SomeGuy',
    author_email='someGuy@dontemailme.com',
    url='https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    packages=find_packages(exclude=('tests')),
    include_package_data=True,
    install_requires=requirements,
    cmdclass={'register': DisabledCommands,
              'upload': DisabledCommands},
    scripts=['src/test.py'],
    entry_points={'console_scripts': ['test = test:main']},
)