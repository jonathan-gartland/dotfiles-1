### -*- mode: makefile-gmake -*-

DIRS	      = . .cask
SPECIAL	    =
INIT_SOURCE = $(wildcard *.el)
LIB_SOURCE  = $(wildcard lib/*.el) $(wildcard lisp/*.el) $(wildcard site-lisp/*.el)
TARGET	    = $(patsubst %.el,%.elc, $(LIB_SOURCE))
EMACS	    = emacs
EMACS_BATCH = $(EMACS) -Q -batch
MY_LOADPATH = -L . $(patsubst %,-L %,$(DIRS))
BATCH_LOAD  = $(EMACS_BATCH) $(MY_LOADPATH)

all: $(SPECIAL) $(TARGET)
	for dir in $(DIRS); do \
		$(BATCH_LOAD) -f batch-byte-recompile-directory $$dir; \
	done

%.elc: %.el
	$(BATCH_LOAD) -l load-path -f batch-byte-compile $<

init.elc: init.el
	@rm -f $@
	$(BATCH_LOAD) -l init -f batch-byte-compile $<

clean:
	rm -f autoloads.el* cus-dirs.el *.elc

fullclean: clean
	rm -f $(TARGET)

html:
	@echo Creating html...
	rm -rf ./output
	cp -a ./.output ./output
	@TERM=xterm-256color $(EMACS) -Q -nw --kill --eval \
	"(progn \
	(package-initialize) \
	(require 'org) \
	(setq org-confirm-babel-evaluate nil) \
	(find-file \"skkemacs.org\") \
	(org-export-to-file 'html \"./output/skkemacs.html\") \
	)"
	@echo Done.


### Makefile ends here
