# CHIME PYPI server

This is the repository and index for @chime-experiment and @radiocosmology Python packages that are commonly installed as dependencies.

It follows [PEP 503](https://www.python.org/dev/peps/pep-0503/).

To install a package from this server, add the index `--extra-index-url https://chime-experiment.github.io/pypi-server/simple/` to your `pip3` calls.

For example:

```
pip3 install caput --extra-index-url https://chime-experiment.github.io/pypi-server/simple/
```

and `pip3` will look for packages in this server before it checks the PYPI server.

To additionally ensure that a package looks for its dependencies here, the package should be listed by name in `setup.py` or `requirements.txt`, with no reference to a url.

For example, do this:

setup.py

```
install_requires=[
"caput",
"ch_util",
]
```

or

requirements.txt

```
caput
ch_util
```

Do *not* do this:

setup.py

```
install_requires=[
"caput @ git+https://github.com/hellothere/caput.git",
"ch_util @ git+sshL//git@github.com/hellobackyourself/ch_util.git",
]
```

## To contribute an additional package in `simple/index.html`

If it is a private package, add an entry for its url

```
<a href="git+ssh://git@github.com/radiocosmology/caput#egg=caput-20.10.0+12.gc7f5bc3">caputmeh</a>
<a href="git+ssh://git@github.com/chime-experiment/chimedb_config#egg=chimedb-config-0.0.2">chimedb-config</a>
<a href="git+ssh://git@github.com/chime-experiment/ch_util#egg=ch-util-20.10.0+12.gbe3c80f">ch-util</a>
```

Note that it requires a **direct package version** in the link target. This version will need to be updated every time the package is tagged and released.

If it is a public package, its wheel can be built and placed in the repository.

Create a directory in `simple/` with the [normalized name of the project](https://www.python.org/dev/peps/pep-0503/#normalized-names). Add its wheels to this directory.

Wheels can be built with the command:

```
python3 setup.py -q bidst_wheel
```

`tar.gz`s can be built with the command:

```
python3 setup.py -q sdist
```

Then add an index to that packages directory:

```
<a href="/caput/">caput</a>
<a href="/chimedb/">chimedb</a>
```

Make sure that the href is encompassed by `/`.

The package will then need to be rebuilt in its host repository on every tagged release. Talk to FOO about how to do that.
