from setuptools import setup, find_packages

setup(
    name='apiverve_htmltotext',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='HTML to Text extracts clean plain text from raw HTML markup, reporting word counts and character counts. It identifies main article bodies automatically, records the extraction method used, and notes whether parsing succeeded.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/htmltotext?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
