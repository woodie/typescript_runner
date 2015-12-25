# Typescript from the command-line

I'd like to experiment with TypeScript, and have similarly named files right next to ECMAScript 5 files. I found this was a bit too complicated, the TypeScript compiler wanted to clobber my similarly named JS files. I created a new shebang for this.
```bash
#!/usr/bin/env typescript
```

The command transpiles the TS file to a unique folder in $TMPDIR, then runs the JS output with node. Node ignores to shebang.

```bash
#!/usr/bin/env bash

TSFILE=${@##*/}
JSFILE=${TSFILE/%ts/js}
MD5DIR=`md5 -q ${@}`/
if [ ! -d $TMPDIR$MD5DIR ]; then
  mkdir $TMPDIR$MD5DIR
fi
if [ ! -f $TMPDIR$MD5DIR$JSFILE ]; then
  tsc --outDir $TMPDIR$MD5DIR ${@}
fi
node $TMPDIR$MD5DIR$JSFILE
```

If you chegkout this repo, you can install install the script like this.

```bash
cp bin/typescript /usr/local/bin/
```

If you want to add TypeScript syntax color to vim, take a look at these files.

```bash
./vim/filetype.vim
./vim/syntax/typescript.vim
```

The typescript.vim file is from here:

http://blogs.msdn.com/b/interoperability/archive/2012/10/01/sublime-text-vi-emacs-typescript-enabled.aspx

I had the install and run dos2unix to strip the CTRL-M characters.
