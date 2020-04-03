from setuptools import setup


def do_setup():
    with open('requirements.txt') as fp:
        install_requires = fp.read()
    setup(
        name='primes',
        version='0.1',
        description='Find prime factorizations',
        url='https://github.com/man40/primes',
        author='Manol Manolov',
        author_email='man40dev@gmail.com',
        license='MIT',
        packages=['primes'],
        zip_safe=False,
        scripts=['primes/bin/primes'],
        install_requires=install_requires)


if __name__ == "__main__":
    do_setup()
