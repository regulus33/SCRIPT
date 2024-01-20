# Tree
`brew install tree`
Prints the directory structure like so:
```
.
├── README.md
├── REFERENCE.md
├── requirements.txt
├── src
│   └── ai_chop
├── tests
│   └── ai_audio_chop_test.py
└── venv
    ├── bin
    ├── lib
    └── pyvenv.cfg

```
You can tell it how many levels deep with `-L`

and exclude a cluttered dir with `-I`

Here I exclude `audio_files`

```bash
tree -L 2 -I 'exclude_dir'
```
