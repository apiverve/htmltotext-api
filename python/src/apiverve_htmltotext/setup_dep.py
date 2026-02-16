from setuptools import setup, find_packages

setup(
    name='apiverve_htmltotext',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='HTML to Text is a simple tool for converting HTML to text. It returns the text extracted from the HTML.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://htmltotext.apiverve.com?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
