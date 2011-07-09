;;; icicles-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (icicle-cd-for-loc-files icicle-locate-file-no-symlinks-other-window
;;;;;;  icicle-locate-file-no-symlinks icicle-locate-file-other-window
;;;;;;  icicle-locate-file icicle-find-file-read-only-other-window
;;;;;;  icicle-find-file-read-only icicle-cd-for-abs-files icicle-file-other-window
;;;;;;  icicle-file icicle-yank-maybe-completing icicle-delete-window
;;;;;;  icicle-select-frame-by-name icicle-other-window-or-frame
;;;;;;  icicle-pop-tag-mark icicle-find-tag icicle-bookmarked-file-list
;;;;;;  icicle-bookmarked-buffer-list icicle-bookmark-set icicle-bookmark-cmd
;;;;;;  icicle-doremi-increment-variable+ icicle-grep-saved-file-candidates
;;;;;;  icicle-dired-project-other-window icicle-dired-project icicle-dired-saved-file-candidates-other-window
;;;;;;  icicle-dired-saved-file-candidates icicle-dired-save-marked-persistently
;;;;;;  icicle-dired-save-marked-to-variable icicle-dired-save-marked-more
;;;;;;  icicle-dired-save-marked icicle-remove-entry-from-saved-completion-set
;;;;;;  icicle-add-entry-to-saved-completion-set icicle-repeat-complex-command
;;;;;;  icicle-customize-apropos-options-of-type icicle-customize-apropos-options
;;;;;;  icicle-customize-apropos-groups icicle-customize-apropos-faces
;;;;;;  icicle-customize-apropos icicle-customize-face-other-window
;;;;;;  icicle-customize-face icicle-send-bug-report icicle-customize-icicles-group
;;;;;;  icicle-lisp-complete-symbol icicle-bbdb-complete-name icicle-dabbrev-completion
;;;;;;  icicle-gud-gdb-complete-command icicle-ess-R-complete-object-name
;;;;;;  icicle-ess-internal-complete-object-name icicle-ess-complete-object-name
;;;;;;  icicle-shell-dynamic-complete-environment-variable icicle-shell-dynamic-complete-filename
;;;;;;  icicle-comint-replace-by-expanded-filename icicle-shell-dynamic-complete-command
;;;;;;  icicle-comint-dynamic-complete-filename icicle-comint-dynamic-complete
;;;;;;  icicle-recompute-shell-command-candidates icicle-shell-command-on-file
;;;;;;  icicle-pp-eval-expression) "icicles-cmd1" "icicles-cmd1.el"
;;;;;;  (19991 46054))
;;; Generated autoloads from icicles-cmd1.el

(autoload 'icicle-pp-eval-expression "icicles-cmd1" "\
Evaluate Emacs-Lisp sexp EXPRESSION, and pretty-print its value.
Add the value to the front of the variable `values'.
With a prefix arg, insert the value into the current buffer at point.
 With a negative prefix arg, if the value is a string, then insert it
 into the buffer without double-quotes (`\"').
With no prefix arg:
 If the value fits on one line (frame width) show it in the echo area.
 Otherwise, show the value in buffer `*Pp Eval Output*'.

This command respects user options
`icicle-pp-eval-expression-print-length',
`icicle-pp-eval-expression-print-level', and
`eval-expression-debug-on-error'.

Emacs-Lisp mode completion and indentation bindings are in effect.

By default, Icicle mode remaps all key sequences that are normally
bound to `eval-expression' or `pp-eval-expression' to
`icicle-pp-eval-expression'.  If you do not want this remapping, then
customize option `icicle-top-level-key-bindings'.

\(fn EXPRESSION &optional INSERT-VALUE)" t nil)

(autoload 'icicle-shell-command-on-file "icicles-cmd1" "\
Read a shell command and invoke it, passing FILE as an argument.

\(fn FILE)" nil nil)

(autoload 'icicle-recompute-shell-command-candidates "icicles-cmd1" "\
Update option `icicle-shell-command-candidates-cache'.
Recompute the available shell commands using your search path.
Return the new option value.
With a prefix argument, the updated option is saved persistently.

If the value of option `icicle-guess-commands-in-path' is not `load',
then turning on Icicle mode (again) resets the cache value to ().
If the value of `icicle-guess-commands-in-path' is `first-use', then
the cache is updated when you next use it, but it is not saved.

\(fn &optional SAVEP)" t nil)

(autoload 'icicle-comint-dynamic-complete "icicles-cmd1" "\
Dynamically perform completion at point.
Calls the functions in `comint-dynamic-complete-functions', but with
Icicles functions substituted, to perform completion until a function
returns non-nil, at which point completion is assumed to have
occurred.

Uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-comint-dynamic-complete-filename "icicles-cmd1" "\
Dynamically complete the filename at point.
Completes if after a filename.  See `comint-match-partial-filename' and
`icicle-comint-dynamic-complete-as-filename'.
This function is similar to `comint-replace-by-expanded-filename', except that
it won't change parts of the filename already entered in the buffer; it just
adds completion characters to the end of the filename.  A completions listing
may be shown in a help buffer if completion is ambiguous.

Completion is dependent on the value of `comint-completion-addsuffix',
`comint-completion-recexact' and `comint-completion-fignore', and the timing of
completions listing is dependent on the value of `comint-completion-autolist'.

Returns t if successful.

Uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-shell-dynamic-complete-command "icicles-cmd1" "\
Dynamically complete the command at point.
Similar to `icicle-comint-dynamic-complete-filename', but this
searches `exec-path' (minus the trailing Emacs library path) for
completion candidates.  Note that this may not be the same as the
shell's idea of the path.

Completion is dependent on the value of `shell-completion-execonly',
plus those that effect file completion.
See `icicle-shell-dynamic-complete-as-command'.

Returns t if successful.

Uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-comint-replace-by-expanded-filename "icicles-cmd1" "\
`comint-replace-by-expanded-filename', but uses Icicles completion.
Dynamically complete, expand, and canonicalize the filename at point.

\(fn)" t nil)

(autoload 'icicle-shell-dynamic-complete-filename "icicles-cmd1" "\
Dynamically complete the filename at point.
Completes only if point is at a suitable position for a filename
argument.

\(fn)" t nil)

(autoload 'icicle-shell-dynamic-complete-environment-variable "icicles-cmd1" "\
`shell-dynamic-complete-environment-variable' but uses Icicles completion.

\(fn)" t nil)

(autoload 'icicle-ess-complete-object-name "icicles-cmd1" "\
`ess-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.
This is `icicle-ess-R-complete-object-name' if `ess-use-R-completion',
and `icicle-ess-internal-complete-object-name' otherwise.

\(fn &optional LISTCOMP)" t nil)

(autoload 'icicle-ess-internal-complete-object-name "icicles-cmd1" "\
`ess-internal-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.

\(fn &optional LISTCOMP)" t nil)

(autoload 'icicle-ess-R-complete-object-name "icicles-cmd1" "\
`ess-R-complete-object-name', but uses Icicles completion.
Completion in R.

\(fn)" t nil)

(autoload 'icicle-gud-gdb-complete-command "icicles-cmd1" "\
`gud-gdb-complete-command', but uses Icicles completion.
Perform completion on the GDB command preceding point.

\(fn &optional COMMAND A B)" t nil)

(autoload 'icicle-dabbrev-completion "icicles-cmd1" "\
Completion on current word.
Like \\[dabbrev-expand], but finds all expansions in the current buffer
and presents suggestions for completion.

With a prefix argument, it searches all buffers accepted by
`dabbrev-friend-buffer-function', to find the completions.

If the prefix argument is 16 (which comes from `C-u C-u'), then it
searches *ALL* buffers.

With no prefix argument, it reuses an old completion list
if there is a suitable one already.

\(fn &optional ARG)" t nil)

(autoload 'icicle-bbdb-complete-name "icicles-cmd1" "\
Complete the user full-name or net-address before point.
Completes only up to the preceding newline, colon, or comma, or the
value of START-POS.

If what has been typed is unique, insert an entry of the form \"User
Name <net-addr>\" (but see `bbdb-dwim-net-address-allow-redundancy').
If it is a valid completion but not unique, you can choose from the
list of completions using Icicles completion.

If your input is completed and `bbdb-complete-name-allow-cycling' is
true, then you can repeat to cycle through the nets for the matching
record.

When called with a prefix arg, display a list of all nets.  You can
control completion behaviour using `bbdb-completion-type'.

\(fn &optional START-POS)" t nil)

(autoload 'icicle-lisp-complete-symbol "icicles-cmd1" "\
Complete the Lisp symbol preceding point against known Lisp symbols.
If there is more than one completion, use the minibuffer to complete.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered, e.g. `commandp'.

If PREDICATE is nil, the context determines which symbols are
considered.  If the symbol starts just after an open-parenthesis, only
symbols with function definitions are considered.  Otherwise, all
symbols with function definitions, values or properties are
considered.

\(fn &optional PREDICATE)" t nil)

(autoload 'icicle-customize-icicles-group "icicles-cmd1" "\
Customize Icicles options and faces.  View their documentation.

\(fn)" t nil)

(autoload 'icicle-send-bug-report "icicles-cmd1" "\
Send a bug report about an Icicles problem.

\(fn)" t nil)

(autoload 'icicle-customize-face "icicles-cmd1" "\
Customize face FACE.
Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down'  - Move to next completion candidate and act
`C-up'    - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`M-!'     - Act on *all* candidates (or all that are saved):
            Customize all in the same buffer.
`C-!'     - Act on *all* candidates (or all that are saved):
            Customize each in a separate buffer.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
or `C-g' to quit.

With a prefix argument, you can enter multiple faces at the same time
with `RET' (in Emacs 22 or later).  This gives you the completion
behavior of `customize-face' in vanilla Emacs.  The advantage is that
the default value is the list of all faces under the cursor.  The
disadvantage is that face candidates are not WYSIWYG in buffer
*Completions*.

This is an Icicles command - see command `icicle-mode'.

\(fn FACE)" t nil)

(autoload 'icicle-customize-face-other-window "icicles-cmd1" "\
Customize face FACE in another window.
Same as `icicle-customize-face' except it uses a different window.

\(fn FACE)" t nil)

(autoload 'icicle-customize-apropos "icicles-cmd1" "\
Customize all user options matching REGEXP.
If ALL is `options', include only options.
If ALL is `faces', include only faces.
If ALL is `groups', include only groups.
If ALL is t (interactively, with prefix arg), include options which
  are not user-settable, as well as faces and groups.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP &optional ALL)" t nil)

(autoload 'icicle-customize-apropos-faces "icicles-cmd1" "\
Customize all user faces matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP)" t nil)

(autoload 'icicle-customize-apropos-groups "icicles-cmd1" "\
Customize all user groups matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP)" t nil)

(autoload 'icicle-customize-apropos-options "icicles-cmd1" "\
Customize all user options matching REGEXP.
With prefix argument, include options which are not user-settable.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.

\(fn REGEXP &optional ARG)" t nil)

(autoload 'icicle-customize-apropos-options-of-type "icicles-cmd1" "\
Customize all loaded customizable options of type TYPE that match REGEXP.
With no prefix arg, each option is defined with `defcustom' type TYPE.
With a prefix arg, either each option is defined with `defcustom' type
 TYPE or its current value is compatible with TYPE.

If TYPE is nil (the default value) then all `defcustom' variables are
potential candidates.

Use `S-TAB', `next', and `prior', to match regexp input - this lets
you see which options will be available in the customize buffer.

\(fn TYPE REGEXP)" t nil)

(autoload 'icicle-repeat-complex-command "icicles-cmd1" "\
Edit and re-evaluate the last complex command, or ARGth from last.
A complex command is one that used the minibuffer.
ARG is the prefix argument numeric value.

You can edit the past command you choose before executing it.  The
Lisp form of the command is used.  If the command you enter differs
from the previous complex command, then it is added to the front of
the command history.

Icicles completion is available for choosing a past command.  You can
still use the vanilla Emacs bindings `\\<minibuffer-local-map>\\[next-history-element]' and `\\[previous-history-element]' to cycle inputs,
and `\\[repeat-matching-complex-command]' to match regexp input, but Icicles input cycling (`up',
`down', `next', `prior', `home', `end') and apropos completion
\(`S-TAB') are superior and more convenient.

\(fn ARG)" t nil)

(autoload 'icicle-add-entry-to-saved-completion-set "icicles-cmd1" "\
Add ENTRY to saved completion-candidates set SET-NAME.
ENTRY is normally a single candidate (a string).
 With a prefix arg, however, and if option
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, then
 ENTRY is the name of an Emacs fileset (Emacs 22 or later).
TYPE is the type of entry to add: `Fileset' or `Candidate'.

\(fn SET-NAME ENTRY TYPE)" t nil)

(autoload 'icicle-remove-entry-from-saved-completion-set "icicles-cmd1" "\
Remove an entry from saved completion-candidates set SET-NAME.
SET-NAME can be an Icicles saved completions set (cache file) or the
name of an Emacs fileset.

The entry to remove can be a single completion candidate (a string) or
an Emacs fileset.  You can thus remove a file name from a fileset or
remove a fileset from an Icicles saved completion set.  (You can also
remove a file name from a saved completion set.)  If a saved set has
both a file and a fileset of the same name, then both are removed.

To use filesets here, use Emacs 22 or later, load library `filesets',
use `(filesets-init)', and ensure that option
`icicle-filesets-as-saved-completion-sets-flag' is non-nil.

\(fn SET-NAME)" t nil)

(icicle-define-command icicle-remove-saved-completion-set "Remove an entry from `icicle-saved-completion-sets'.\nSave the updated option.\nYou are prompted to also delete the associated cache file.\nYou can add entries to `icicle-saved-completion-sets' using command\n`icicle-add/update-saved-completion-set'." icicle-remove-saved-set-action "Remove set of completion candidates named: " icicle-saved-completion-sets nil t nil 'icicle-completion-set-history nil nil ((icicle-whole-candidate-as-text-prop-p t) (icicle-use-candidates-only-once-flag t)) nil nil (icicle-remove-Completions-window))

(autoload 'icicle-dired-save-marked "icicles-cmd1" "\
Save the marked file names in Dired as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn &optional ARG)" t nil)

(autoload 'icicle-dired-save-marked-more "icicles-cmd1" "\
Add the marked file names in Dired to the saved candidates set.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates are still saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-<'.
You can use the saved set of candidates for operations such as

\(fn &optional ARG)" t nil)

(autoload 'icicle-dired-save-marked-to-variable "icicles-cmd1" "\
Save the marked file names in Dired as a candidate set to a variable.
You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn)" t nil)

(autoload 'icicle-dired-save-marked-persistently "icicles-cmd1" "\
Save the marked file names in Dired as a persistent set.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.

\(fn FILESETP)" t nil)

(autoload 'icicle-dired-saved-file-candidates "icicles-cmd1" "\
Open Dired on a set of files and directories of your choice.
If you have saved a set of file names using \\<minibuffer-local-completion-map>`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix argument, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-dired-saved-file-candidates-other-window "icicles-cmd1" "\
Open Dired in other window on set of files & directories of your choice.
If you have saved a set of file names using \\<minibuffer-local-completion-map>`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix arg, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-dired-project "icicles-cmd1" "\
Open Dired on a saved project.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `bookmark+.el'.

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-dired-project-other-window "icicles-cmd1" "\
Open Dired on a saved project in another window.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `bookmark+.el'.

\(fn PROMPT-FOR-DIR-P)" t nil)

(autoload 'icicle-grep-saved-file-candidates "icicles-cmd1" "\
Run `grep' on the set of completion candidates saved with \\<minibuffer-local-completion-map>`\\[icicle-candidate-set-save]'.
Saved names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the default
directory.

\(fn COMMAND-ARGS)" t nil)

(icicle-define-command icicle-execute-extended-command "Read command name, then read its arguments and call it.\nThis is `execute-extended-command', turned into a multi-command.\n\nBy default, Icicle mode remaps all key sequences that are normally\nbound to `execute-extended-command' to\n`icicle-execute-extended-command'.  If you do not want this remapping,\nthen customize option `icicle-top-level-key-bindings'." icicle-execute-extended-command-1 (format "Execute command%s: " (if current-prefix-arg (format " (prefix %d)" (prefix-numeric-value current-prefix-arg)) "")) obarray nil t nil 'extended-command-history nil nil ((last-command last-command) (use-file-dialog nil) (alt-fn nil) (orig-must-pass-after-match-predicate icicle-must-pass-after-match-predicate) (icicle-must-pass-after-match-predicate #'(lambda (c) (commandp (intern c)))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "command")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "command"))) new-last-cmd) nil nil (setq this-command new-last-cmd))

(icicle-define-command icicle-command-abbrev "Read command name or its abbreviation, read command args, call command.\nRead input, then call `icicle-command-abbrev-action' to act on it.\n\nIf `icicle-add-proxy-candidates-flag' is non-nil, then command\nabbreviations, as well as commands, are available as completion\ncandidates.  Otherwise, only commands are available.  You can toggle\nthis user option using `\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]'in the minibuffer.\n\nWhen an abbreviation is available, you can treat it just like a\ncommand.  The rest of this description covers the behavior of choosing\nan abbreviation.\n\nIf an abbreviation matches a single command name, then that command is\ninvoked.  If it matches more than one, then you can use completion to\nchoose one.\n\nHyphens (`-') in command names divide them into parts.  For example,\n`find-file' has two parts: `find' and `file'.  Each character of a\ncommand abbreviation corresponds to one part of each of the commands\nthat match the abbreviation.  For example, abbreviation `ff' matches\ncommands `find-file' and `focus-frame', and abbreviation `fg' matches\n`find-grep'.\n\nUser option `icicle-command-abbrev-match-all-parts-flag' = nil means\nthat an abbreviation need not match all parts of a command name; it\nneed match only a prefix.  For example, nil means that abbreviation\n`ff' also matches `find-file-other-window' and `fg' also matches\n`find-grep-dired'." icicle-command-abbrev-action prompt obarray nil nil nil 'icicle-command-abbrev-history nil nil ((prompt "Command or abbrev: ") (last-command last-command) (icicle-sort-comparer 'icicle-command-abbrev-used-more-p) (icicle-proxy-candidates (let ((ipc nil) abv) (dolist (entry icicle-command-abbrev-alist ipc) (setq abv (symbol-name (cadr entry))) (unless (member abv ipc) (push abv ipc))))) (use-file-dialog nil) (alt-fn nil) (orig-must-pass-after-match-predicate icicle-must-pass-after-match-predicate) (icicle-must-pass-after-match-predicate #'(lambda (c) (commandp (intern c)))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "command")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "command")))) (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt)) nil (setq icicle-proxy-candidates nil))

(icicle-define-command icicle-command-abbrev-command "Read command name, then read its arguments and call command." icicle-execute-extended-command-1 (format "Command abbreviated%s%s: " (cond ((and icicle-current-input (not (string= "" icicle-current-input))) (format " `%s'" icicle-current-input)) (icicle-candidate-nb (format " `%s'" (elt icicle-completion-candidates icicle-candidate-nb))) (t "")) (if current-prefix-arg (format " (prefix %d)" (prefix-numeric-value current-prefix-arg)) "")) icicle-commands-for-abbrev nil t nil 'extended-command-history nil nil ((use-file-dialog nil) (alt-fn nil) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "command")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "command"))) (icicle-add-proxy-candidates-flag nil) (last-command last-command) new-last-cmd) nil nil (setq this-command new-last-cmd) 'NON-INTERACTIVE)

(icicle-define-command icicle-execute-named-keyboard-macro "Read the name of a keyboard macro, then execute it." icicle-execute-extended-command-1 (format "Execute keyboard macro%s: " (if current-prefix-arg (format " (prefix %d)" (prefix-numeric-value current-prefix-arg)) "")) obarray nil t nil 'icicle-kmacro-history nil nil ((last-command last-command) (alt-fn nil) (orig-must-pass-after-match-predicate icicle-must-pass-after-match-predicate) (icicle-must-pass-after-match-predicate #'(lambda (fn) (setq fn (intern fn)) (and (commandp fn) (arrayp (symbol-function fn))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "command")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "command")))))

(when (require 'kmacro nil t) (icicle-define-command icicle-kmacro "Execute a keyboard macro according to its position in `kmacro-ring'.\nMacros in the keyboard macro ring are given names `1', `2', and so on,\nfor use as completion candidates.\n\nWith prefix argument, repeat macro that many times (but see below).\nIf a macro is still being defined, end it first, then execute it.\n\nSince this is a multi-command, you can execute any number of macros\nany number of times in a single invocation.  In particular, you can\nexecute a given macro repeatedly using `C-RET' (be sure you use `TAB'\nfirst, to make it the current candidate).\n\nIf you use a prefix arg for `icicle-kmacro', then each multi-command\naction (e.g. `C-RET') repeats the macro that number of times.  However\nif you use a prefix arg for an individual action, then the action\nrepeats the macro that number of times.  Without its own prefix arg,\nan action uses the base prefix arg you used for `icicle-kmacro'." icicle-kmacro-action (format "Execute keyboard macro%s: " (if current-prefix-arg (format " (prefix %s)" (prefix-numeric-value current-prefix-arg)) "")) (let ((count 0)) (setq icicle-kmacro-alist (mapcar #'(lambda (x) (cons (format "%d" (setq count (1+ count))) x)) (reverse (if nil kmacro-ring (cons (kmacro-ring-head) kmacro-ring)))))) nil 'no-exit-wo-match nil 'icicle-kmacro-history (and (kmacro-ring-head) (null kmacro-ring) "1") nil ((pref-arg current-prefix-arg)) (progn (when defining-kbd-macro (kmacro-end-or-call-macro current-prefix-arg) (error "Done")) (unless (or (kmacro-ring-head) kmacro-ring) (error "No keyboard macro defined")))) (defun icicle-kmacro-action (cand) "Action function for `icicle-kmacro'." (when (get-buffer orig-buff) (set-buffer orig-buff)) (when (window-live-p orig-window) (select-window orig-window)) (let* ((count (if current-prefix-arg (prefix-numeric-value current-prefix-arg) pref-arg)) (macro (cadr (assoc cand icicle-kmacro-alist)))) (unless macro (error "No such macro: `%s'" cand)) (execute-kbd-macro macro count #'kmacro-loop-setup-function) (when (> count 1) (message "(%d times)" count)))))

(icicle-define-command icicle-set-option-to-t "Set option to t.  This makes sense for binary (toggle) options.\nBy default, completion candidates are limited to user options that\nhave `boolean' custom types.  However, there are many \"binary\" options\nthat allow other non-nil values than t.\n\nYou can use a prefix argument to change the set of completion\ncandidates, as follows:\n\n - With a non-negative prefix arg, all user options are candidates.\n - With a negative prefix arg, all variables are candidates." (lambda (opt) (set (intern opt) t) (message "`%s' is now t" opt)) "Set option to t: " obarray nil 'must-confirm nil (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil ((enable-recursive-minibuffers t) (icicle-use-candidates-only-once-flag t) (alt-fn nil) (icicle-must-pass-after-match-predicate (cond ((and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg))) #'(lambda (x) (setq x (intern x)) (and (boundp x) (user-variable-p x) (eq nil (symbol-value x))))) (current-prefix-arg #'(lambda (x) (setq x (intern x)) (and (boundp x) (eq nil (symbol-value x))))) (t #'(lambda (x) (setq x (intern x)) (and (boundp x) (icicle-binary-option-p x) (eq nil (symbol-value x))))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "option")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "option")))))

(icicle-define-command icicle-clear-history "Clear a minibuffer history of selected entries.\nYou are prompted for the history to clear, then you are prompted for\nthe entries to delete from it.  You can use multi-command completion\nfor both inputs.  That is, you can act on multiple histories and\ndelete multiple entries from each.\n\nFor convenience, you can use `S-delete' the same way as `C-RET': Each\nof them deletes the current entry candidate from the history.\n\nWith a prefix argument, empty the chosen history completely\n(you are not prompted to choose history entries to delete).\n\n`icicle-act-before-cycle-flag' is bound to t here during completion of\nhistory entries, so `C-next' and so on act on the current candidate." icicle-clear-history-1 "History to clear: " icicle-clear-history-hist-vars nil t nil nil (symbol-name minibuffer-history-variable) nil ((pref-arg current-prefix-arg) (enable-recursive-minibuffers t) (icicle-transform-function 'icicle-remove-duplicates) (icicle-clear-history-hist-vars `((,(symbol-name minibuffer-history-variable)) (,(symbol-name 'icicle-previous-raw-file-name-inputs)) (,(symbol-name 'icicle-previous-raw-non-file-name-inputs)))) (icicle-delete-candidate-object 'icicle-clear-history-entry)) (mapatoms #'(lambda (x) (when (and (boundp x) (consp (symbol-value x)) (stringp (car (symbol-value x))) (string-match "-\\(history\\|ring\\)\\'" (symbol-name x))) (push (list (symbol-name x)) icicle-clear-history-hist-vars)))))

(icicle-define-command icicle-clear-current-history "Clear current minibuffer history of selected entries.\nYou are prompted for the history entries to delete.\n\nWith a prefix argument, however, empty the history completely\n(you are not prompted to choose history entries to delete).\n\n`icicle-act-before-cycle-flag' is bound to t here during completion of\nhistory entries, so `C-next' and so on act on the current candidate." icicle-clear-history-entry "Clear input: " (mapcar #'list (symbol-value icicle-clear-history-hist)) nil t nil nil nil nil ((pref-arg current-prefix-arg) (enable-recursive-minibuffers t) (icicle-transform-function 'icicle-remove-duplicates) (icicle-use-candidates-only-once-flag t) (icicle-show-Completions-initially-flag t) (icicle-clear-history-hist minibuffer-history-variable)) (when pref-arg (icicle-ding) (if (not (yes-or-no-p (format "Are you sure you want to empty `%s' completely? " minibuffer-history-variable))) (error "") (set minibuffer-history-variable nil) (error "History `%s' is now empty" minibuffer-history-variable))))

(icicle-define-command icicle-reset-option-to-nil "Set option to nil.  This makes sense for binary and list options.\nBy default, the set of completion candidates is limited to user\noptions.  Note: it is *not* limited to binary and list options.\nWith a prefix arg, all variables are candidates." (lambda (opt) (set (intern opt) nil) (message "`%s' is now nil" opt)) "Clear option (set it to nil): " obarray nil t nil (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil ((enable-recursive-minibuffers t) (icicle-use-candidates-only-once-flag t) (alt-fn nil) (icicle-must-pass-after-match-predicate (if current-prefix-arg #'(lambda (x) (setq x (intern x)) (and (boundp x) (symbol-value x))) #'(lambda (x) (setq x (intern x)) (and (boundp x) (user-variable-p x) (symbol-value x))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "option")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "option")))))

(icicle-define-command icicle-toggle-option "Toggle option's value.  This makes sense for binary (toggle) options.\nBy default, completion candidates are limited to user options that\nhave `boolean' custom types.  However, there are many \"binary\" options\nthat allow other non-nil values than t.\n\nYou can use a prefix argument to change the set of completion\ncandidates, as follows:\n\n - With a non-negative prefix arg, all user options are candidates.\n - With a negative prefix arg, all variables are candidates." (lambda (opt) (let ((sym (intern opt))) (set sym (not (eval sym))) (message "`%s' is now %s" opt (eval sym)))) "Toggle value of option: " obarray nil 'must-confirm nil (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil ((enable-recursive-minibuffers t) (alt-fn nil) (icicle-must-pass-after-match-predicate (cond ((and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg))) #'(lambda (c) (user-variable-p (intern c)))) (current-prefix-arg #'(lambda (c) (boundp (intern c)))) (t #'(lambda (c) (icicle-binary-option-p (intern c)))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "option")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "option")))))

(icicle-define-command icicle-increment-option "Increment option's value using the arrow keys (`up', `down').\nCompletion candidates are limited to options that have `integer',\n`float', and `number' custom types.\nThis command needs library `doremi.el'." (lambda (opt) (let ((sym (intern opt)) (icicle-must-pass-after-match-predicate orig-must-pass-after-match-predicate)) (icicle-doremi-increment-variable+ sym (icicle-read-number "Increment (amount): ") t) (message "`%s' is now %s" opt (eval sym)))) "Increment value of option: " obarray nil 'must-confirm nil (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil ((enable-recursive-minibuffers t) (alt-fn nil) (orig-must-pass-after-match-predicate icicle-must-pass-after-match-predicate) (icicle-must-pass-after-match-predicate #'(lambda (s) (memq (get (intern s) 'custom-type) '(number integer float)))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "option")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "option")))) (unless (require 'doremi nil t) (error "This command needs library `doremi.el'.")))

(icicle-define-command icicle-increment-variable "Increment variable's value using the arrow keys (`up', `down').\nWith a prefix arg, only numeric user options are candidates.\nWith no prefix arg, all variables are candidates, even those that are\n not numeric. \nThis command needs library `doremi.el'." (lambda (var) (let ((sym (intern var)) (icicle-must-pass-after-match-predicate orig-must-pass-after-match-predicate)) (icicle-doremi-increment-variable+ sym (icicle-read-number "Increment (amount): ") prefix-arg) (message "`%s' is now %s" var (eval sym)))) "Increment value of variable: " obarray nil 'must-confirm nil (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil ((enable-recursive-minibuffers t) (prefix-arg current-prefix-arg) (alt-fn nil) (orig-must-pass-after-match-predicate icicle-must-pass-after-match-predicate) (icicle-must-pass-after-match-predicate (if prefix-arg #'(lambda (s) (memq (get (intern s) 'custom-type) '(number integer float))) #'(lambda (s) (boundp (intern s))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type (if prefix-arg "option" "variable"))))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type (if prefix-arg "option" "variable"))))) (unless (require 'doremi nil t) (error "This command needs library `doremi.el'.")))

(autoload 'icicle-doremi-increment-variable+ "icicles-cmd1" "\
Increment VARIABLE by INCREMENT (default 1).
Use arrow key `up' or `down' or mouse wheel to increase or decrease.
You can use the `Meta' key (e.g. `M-up') to increment in larger steps.

Interactively, you can choose VARIABLE using completion.
With a prefix arg, only user options are available to choose from.
Raises an error if VARIABLE's value is not a number.

\(fn VARIABLE &optional INCREMENT OPTIONP)" t nil)

(icicle-define-command icicle-bookmark-list "Choose a list of bookmark names.\nIf `icicle-bookmark-types' is non-nil, then it is a list of bookmark\ntypes and only bookmarks of those types are candidates.\n\nYou can use `S-delete' during completion to delete a candidate bookmark.\nThe list of bookmark names (strings) is returned." (lambda (name) (push (icicle-substring-no-properties (icicle-transform-multi-completion name)) bmk-names)) "Choose bookmark (`RET' when done): " icicle-candidates-alist nil (not icicle-show-multi-completion-flag) nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history) (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil ((enable-recursive-minibuffers t) (completion-ignore-case bookmark-completion-ignore-case) (icicle-list-use-nth-parts '(1)) (icicle-candidate-properties-alist (if (not icicle-show-multi-completion-flag) nil (if (facep 'file-name-shadow) '((2 (face file-name-shadow)) (3 (face bookmark-menu-heading))) '((3 (face bookmark-menu-heading)))))) (icicle-transform-function (if (interactive-p) nil icicle-transform-function)) (icicle-whole-candidate-as-text-prop-p t) (icicle-transform-before-sort-p t) (icicle-delete-candidate-object 'icicle-bookmark-delete-action) (types icicle-bookmark-types) (icicle-candidates-alist nil) (bmk-names nil) (icicle-sort-orders-alist (append '(("in *Bookmark List* order") ("by bookmark name" . icicle-alpha-p)) (and (featurep 'bookmark+) (append '(("by last bookmark access" (bmkp-bookmark-last-access-cp) icicle-alpha-p) ("by bookmark visit frequency" (bmkp-visited-more-cp) icicle-alpha-p)) (and (icicle-set-intersection types '("info" "region")) '(("by Info location" (bmkp-info-cp) icicle-alpha-p))) (and (icicle-set-intersection types '("gnus" "region")) '(("by Gnus thread" (bmkp-gnus-cp) icicle-alpha-p))) (and (icicle-set-intersection types '("url" "region")) '(("by URL" (bmkp-url-cp) icicle-alpha-p))) (and (icicle-set-difference types '("bookmark-list" "desktop" "gnus" "info" "man" "url")) '(("by bookmark type" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp bmkp-local-file-type-cp bmkp-handler-cp) icicle-alpha-p))) (and (icicle-set-difference types '("bookmark-list" "desktop" "dired" "non-file")) '(("by file name" (bmkp-file-alpha-cp) icicle-alpha-p))) (and (icicle-set-intersection types '("local-file" "file" "dired" "region")) '(("by local file type" (bmkp-local-file-type-cp) icicle-alpha-p) ("by local file size" (bmkp-local-file-size-cp) icicle-alpha-p) ("by last local file access" (bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("by last local file update" (bmkp-local-file-updated-more-recently-cp) icicle-alpha-p))) (and (not (equal types '("desktop"))) '(("by last buffer or file access" (bmkp-buffer-last-access-cp bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p))) (and (get-buffer "*Bookmark List*") '(("marked before unmarked (in *Bookmark List*)" (bmkp-marked-cp) icicle-alpha-p))))) '(("by previous use alphabetically" . icicle-historical-alphabetic-p) ("case insensitive" . icicle-case-insensitive-string-less-p)))) (icicle-candidate-help-fn #'(lambda (cand) (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag) (setq cand (funcall icicle-get-alist-candidate-function cand)) (setq cand (cons (caar cand) (cdr cand)))) (if (featurep 'bookmark+) (if current-prefix-arg (bmkp-describe-bookmark-internals cand) (bmkp-describe-bookmark cand)) (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand)))))) (progn (message "Gathering bookmarks...") (unless types (setq types '(all))) (dolist (type types) (setq icicle-candidates-alist (nconc icicle-candidates-alist (if (not (featurep 'bookmark+)) (mapcar #'(lambda (cand) (list (icicle-candidate-short-help (icicle-bookmark-help-string cand) (icicle-bookmark-propertize-candidate cand)))) (if (eq type 'all) bookmark-alist (funcall (intern (format "bmkp-%s-alist-only" type))))) (bookmark-maybe-load-default-file) (mapcar (if icicle-show-multi-completion-flag #'(lambda (bmk) (condition-case nil (let* ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk)) (file (bookmark-get-filename bmk)) (buf (bmkp-get-buffer-name bmk)) (file/buf (if (and buf (equal file bmkp-non-file-filename)) buf file)) (tags (bmkp-get-tags bmk))) (cons `(,(icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) ,file/buf ,@(and tags (list (format "%S" tags)))) guts)) (error nil))) #'(lambda (bmk) (condition-case nil (let ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk))) (cons (icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) guts)) (error nil)))) (bmkp-sort-and-remove-dups (if (eq type 'all) bookmark-alist (funcall (intern (format "bmkp-%s-alist-only" type))))))))))) (icicle-bookmark-cleanup-on-quit) (prog1 (setq bmk-names (nreverse (delete "" bmk-names))) (icicle-bookmark-cleanup) (when (interactive-p) (message "Bookmarks: %S" bmk-names))))

(autoload 'icicle-bookmark-cmd "icicles-cmd1" "\
Set bookmark or visit bookmark(s).
With a negative prefix arg, visit bookmark(s), using
  `icicle-bookmark-other-window' (see that command for more info).

Otherwise, set a bookmark, as follows:

* No prefix arg: Prompt for the bookmark name.

  If feature `bookmark+' is present:

  . You can use (lax) completion for the bookmark name.
    The candidates are bookmarks in the current buffer (or all
    bookmarks if there are none in this buffer).

  . If the region is active and nonempty, then use the buffer name
    followed by the region prefix as the default name.

  If feature `bookmark+' is not present, then completion is not
  available, and the default bookmark name is the last one used in
  this buffer.

  Note: You can use command `icicle-bookmark-set' with a numeric
  prefix arg if you want to complete against all bookmark names,
  instead of those for the current buffer.

* Plain prefix arg (`C-u'): Same as no prefix arg, but do not
  overwrite any existing bookmark that has the same name.

* Non-negative numeric prefix arg: Do not prompt for bookmark name.
  If feature `bookmark+' is present and the region is active and
    nonempty, then use the buffer name followed by a prefix of the
    region text as the bookmark name.
  Otherwise, use the buffer name followed by the text of the current
    line, starting at point.
  Use at most `icicle-bookmark-name-length-max' chars, in either case.
  If the prefix arg is 0, then do not overwrite any existing bookmark
    that has the same name.

By default, Icicle mode remaps all key sequences that are normally
bound to `bookmark-set' to `icicle-bookmark-cmd'.  If you do not want
this remapping, then customize option `icicle-top-level-key-bindings'.
In particular, you might prefer to remap `bookmark-set' to
`icicle-bookmark-set' (see Note, above).

\(fn &optional PARG)" t nil)

(autoload 'icicle-bookmark-set "icicles-cmd1" "\
With Bookmark+, this is `bookmark-set' with Icicles multi-completions.
In particular, you can use (lax) completion for the bookmark name.
Without library `bookmark+.el', this is the same as vanilla Emacs
`bookmark-set'.

\(fn &optional NAME PARG INTERACTIVEP)" t nil)

(icicle-define-command icicle-bookmark "Jump to a bookmark.\nWith a plain prefix argument (`C-u'), reverse the effect of option\n`icicle-bookmark-refresh-cache-flag'.\n\nDuring completion, you can use `S-delete' on a bookmark to delete it.\n\nIf you also use library `bookmark+.el', then:\n\n * `C-M-RET' shows detailed info about the current bookmark candidate.\n   `C-u C-M-RET' shows the complete, internal info for the bookmark.\n   Likewise, for the other candidate help keys: `C-M-down' etc.\n   (And the mode line always shows summary info about the bookmark.)\n   \n * You can use `C-,' to sort bookmarks in many different ways,\n   according to their properties.\n\n * In *Completions*, the candidate bookmarks are highlighted according\n   to their type.  You can customize the highlighting faces used:\n\n  `bmkp-bad-bookmark'              - possibly bad bookmark\n  `bmkp-bookmark-list'             - bookmark list\n  `bmkp-buffer'                    - buffer\n  `bmkp-desktop'                   - desktop\n  `bmkp-function'                  - function bookmark\n  `bmkp-gnus'                      - Gnus article\n  `bmkp-info'                      - Info node\n  `bmkp-local-directory'           - local directory\n  `bmkp-local-file-with-region'    - local file with a region\n  `bmkp-local-file-without-region' - local file without a region\n  `bmkp-man'                       - `man' page\n  `bmkp-non-file'                  - non-file (no current buffer)\n  `bmkp-remote-file'               - remote-file\n  `bmkp-sequence'                  - sequence bookmark\n  `bmkp-url'                       - URL\n\n * In *Completions*, if option `icicle-show-multi-completion-flag' is\n   non-nil, then each completion candidate is a multi-completion:\n\n    a. the bookmark name\n    b. the bookmark file or buffer name\n    c. any tags\n\n   You can match any parts of the multi-completion.  You can toggle\n   the option (for the next command) using `M-m' during completion.\n   For example, you can match all bookmarks that have tags by typing:\n\n     C-M-j . * C-M-j S-TAB\n\n   (Each `C-M-j' inserts `^G\n', which is `icicle-list-join-string'.)\n\n * You can narrow the current completion candidates to bookmarks of a\n   given type:\n\n   `C-M-b'   - non-file (buffer) bookmarks\n   `C-M-B'   - bookmark-list bookmarks\n   `C-M-d'   - Dired bookmarks\n   `C-M-f'   - file bookmarks\n   `C-M-F'   - local-file bookmarks\n   `C-M-g'   - Gnus bookmarks\n   `C-M-I'   - Info bookmarks\n   `C-M-K'   - desktop bookmarks\n   `C-M-m'   - `man' pages\n   `C-M-r'   - bookmarks with regions\n   `C-M-u'   - URL bookmarks\n   `C-M-w'   - W3M (URL) bookmarks\n   `C-M-@'   - remote-file bookmarks\n   `C-M-.'   - bookmarks for the current buffer\n   `C-M-= b' - bookmarks for specific buffers\n   `C-M-= f' - bookmarks for specific files\n\n   See also the individual multi-commands for different bookmark\n   types: `icicle-bookmark-info-other-window' etc.\n\nIf you also use library `crosshairs.el', then the visited bookmark\nposition is highlighted." (lambda (cand) (icicle-bookmark-jump (icicle-transform-multi-completion cand))) prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history) (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil ((enable-recursive-minibuffers t) (completion-ignore-case bookmark-completion-ignore-case) (prompt "Bookmark: ") (icicle-list-use-nth-parts '(1)) (icicle-candidate-properties-alist (if (not icicle-show-multi-completion-flag) nil (if (facep 'file-name-shadow) '((2 (face file-name-shadow)) (3 (face bookmark-menu-heading))) '((3 (face bookmark-menu-heading)))))) (icicle-transform-function (if (interactive-p) nil icicle-transform-function)) (icicle-whole-candidate-as-text-prop-p t) (icicle-transform-before-sort-p t) (icicle-delete-candidate-object 'icicle-bookmark-delete-action) (icicle-sort-orders-alist (append '(("in *Bookmark List* order") ("by bookmark name" . icicle-alpha-p)) (and (featurep 'bookmark+) '(("by last bookmark access" (bmkp-bookmark-last-access-cp) icicle-alpha-p) ("by bookmark visit frequency" (bmkp-visited-more-cp) icicle-alpha-p) ("by last buffer or file access" (bmkp-buffer-last-access-cp bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("marked before unmarked (in *Bookmark List*)" (bmkp-marked-cp) icicle-alpha-p) ("by local file type" (bmkp-local-file-type-cp) icicle-alpha-p) ("by file name" (bmkp-file-alpha-cp) icicle-alpha-p) ("by local file size" (bmkp-local-file-size-cp) icicle-alpha-p) ("by last local file access" (bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("by last local file update" (bmkp-local-file-updated-more-recently-cp) icicle-alpha-p) ("by Info location" (bmkp-info-cp) icicle-alpha-p) ("by Gnus thread" (bmkp-gnus-cp) icicle-alpha-p) ("by URL" (bmkp-url-cp) icicle-alpha-p) ("by bookmark type" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp bmkp-local-file-type-cp bmkp-handler-cp) icicle-alpha-p))) '(("by previous use alphabetically" . icicle-historical-alphabetic-p) ("case insensitive" . icicle-case-insensitive-string-less-p)))) (icicle-candidate-help-fn #'(lambda (cand) (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag) (setq cand (funcall icicle-get-alist-candidate-function cand)) (setq cand (cons (caar cand) (cdr cand)))) (if (featurep 'bookmark+) (if current-prefix-arg (bmkp-describe-bookmark-internals cand) (bmkp-describe-bookmark cand)) (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand))))) (icicle-candidates-alist (if (not (featurep 'bookmark+)) (mapcar #'(lambda (cand) (list (icicle-candidate-short-help (icicle-bookmark-help-string cand) (icicle-bookmark-propertize-candidate cand)))) (bookmark-all-names)) (bookmark-maybe-load-default-file) (mapcar (if icicle-show-multi-completion-flag #'(lambda (bmk) (condition-case nil (let* ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk)) (file (bookmark-get-filename bmk)) (buf (bmkp-get-buffer-name bmk)) (file/buf (if (and buf (equal file bmkp-non-file-filename)) buf file)) (tags (bmkp-get-tags bmk))) (cons `(,(icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) ,file/buf ,@(and tags (list (format "%S" tags)))) guts)) (error nil))) #'(lambda (bmk) (condition-case nil (let ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk))) (cons (icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) guts)) (error nil)))) (or (and (or (and (not icicle-bookmark-refresh-cache-flag) (not (consp current-prefix-arg))) (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg))) bmkp-sorted-alist) (setq bmkp-sorted-alist (bmkp-sort-and-remove-dups bookmark-alist))))))) (progn (require 'bookmark) (when (featurep 'bookmark+) (dolist (map '(minibuffer-local-must-match-map minibuffer-local-completion-map)) (define-key (symbol-value map) "\202" 'icicle-bookmark-non-file-narrow) (define-key (symbol-value map) "\204" 'icicle-bookmark-dired-narrow) (define-key (symbol-value map) "\206" 'icicle-bookmark-file-narrow) (define-key (symbol-value map) "\207" 'icicle-bookmark-gnus-narrow) (define-key (symbol-value map) "\215" 'icicle-bookmark-man-narrow) (define-key (symbol-value map) "\222" 'icicle-bookmark-region-narrow) (define-key (symbol-value map) "\225" 'icicle-bookmark-url-narrow) (define-key (symbol-value map) "\227" 'icicle-bookmark-w3m-narrow) (define-key (symbol-value map) "\200" 'icicle-bookmark-remote-file-narrow) (define-key (symbol-value map) [(control meta 61) 98] 'icicle-bookmark-specific-buffers-narrow) (define-key (symbol-value map) [(control meta 61) 102] 'icicle-bookmark-specific-files-narrow) (define-key (symbol-value map) [(control meta 46)] 'icicle-bookmark-this-buffer-narrow) (define-key (symbol-value map) [(control meta 66)] 'icicle-bookmark-bookmark-list-narrow) (define-key (symbol-value map) [(control meta 70)] 'icicle-bookmark-local-file-narrow) (define-key (symbol-value map) [(control meta 73)] 'icicle-bookmark-info-narrow) (define-key (symbol-value map) [(control meta 75)] 'icicle-bookmark-desktop-narrow)))) (icicle-bookmark-cleanup-on-quit) (icicle-bookmark-cleanup))

(icicle-define-command icicle-bookmark-other-window "Jump to a bookmark in another window.\nSame as `icicle-bookmark', but uses another window." (lambda (cand) (icicle-bookmark-jump-other-window (icicle-transform-multi-completion cand))) prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history) (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil ((enable-recursive-minibuffers t) (completion-ignore-case bookmark-completion-ignore-case) (prompt "Bookmark: ") (icicle-list-use-nth-parts '(1)) (icicle-candidate-properties-alist (if (not icicle-show-multi-completion-flag) nil (if (facep 'file-name-shadow) '((2 (face file-name-shadow)) (3 (face bookmark-menu-heading))) '((3 (face bookmark-menu-heading)))))) (icicle-transform-function (if (interactive-p) nil icicle-transform-function)) (icicle-whole-candidate-as-text-prop-p t) (icicle-transform-before-sort-p t) (icicle-delete-candidate-object 'icicle-bookmark-delete-action) (icicle-sort-orders-alist (append '(("in *Bookmark List* order") ("by bookmark name" . icicle-alpha-p)) (and (featurep 'bookmark+) '(("by last bookmark access" (bmkp-bookmark-last-access-cp) icicle-alpha-p) ("by bookmark visit frequency" (bmkp-visited-more-cp) icicle-alpha-p) ("by last buffer or file access" (bmkp-buffer-last-access-cp bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("marked before unmarked (in *Bookmark List*)" (bmkp-marked-cp) icicle-alpha-p) ("by local file type" (bmkp-local-file-type-cp) icicle-alpha-p) ("by file name" (bmkp-file-alpha-cp) icicle-alpha-p) ("by local file size" (bmkp-local-file-size-cp) icicle-alpha-p) ("by last local file access" (bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("by last local file update" (bmkp-local-file-updated-more-recently-cp) icicle-alpha-p) ("by Info location" (bmkp-info-cp) icicle-alpha-p) ("by Gnus thread" (bmkp-gnus-cp) icicle-alpha-p) ("by URL" (bmkp-url-cp) icicle-alpha-p) ("by bookmark type" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp bmkp-local-file-type-cp bmkp-handler-cp) icicle-alpha-p))) '(("by previous use alphabetically" . icicle-historical-alphabetic-p) ("case insensitive" . icicle-case-insensitive-string-less-p)))) (icicle-candidate-help-fn #'(lambda (cand) (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag) (setq cand (funcall icicle-get-alist-candidate-function cand)) (setq cand (cons (caar cand) (cdr cand)))) (if (featurep 'bookmark+) (if current-prefix-arg (bmkp-describe-bookmark-internals cand) (bmkp-describe-bookmark cand)) (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand))))) (icicle-candidates-alist (if (not (featurep 'bookmark+)) (mapcar #'(lambda (cand) (list (icicle-candidate-short-help (icicle-bookmark-help-string cand) (icicle-bookmark-propertize-candidate cand)))) (bookmark-all-names)) (bookmark-maybe-load-default-file) (mapcar (if icicle-show-multi-completion-flag #'(lambda (bmk) (condition-case nil (let* ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk)) (file (bookmark-get-filename bmk)) (buf (bmkp-get-buffer-name bmk)) (file/buf (if (and buf (equal file bmkp-non-file-filename)) buf file)) (tags (bmkp-get-tags bmk))) (cons `(,(icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) ,file/buf ,@(and tags (list (format "%S" tags)))) guts)) (error nil))) #'(lambda (bmk) (condition-case nil (let ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk))) (cons (icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) guts)) (error nil)))) (or (and (or (and (not icicle-bookmark-refresh-cache-flag) (not (consp current-prefix-arg))) (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg))) bmkp-sorted-alist) (setq bmkp-sorted-alist (bmkp-sort-and-remove-dups bookmark-alist))))))) (progn (require 'bookmark) (when (featurep 'bookmark+) (dolist (map '(minibuffer-local-must-match-map minibuffer-local-completion-map)) (define-key (symbol-value map) "\202" 'icicle-bookmark-non-file-narrow) (define-key (symbol-value map) "\204" 'icicle-bookmark-dired-narrow) (define-key (symbol-value map) "\206" 'icicle-bookmark-file-narrow) (define-key (symbol-value map) "\207" 'icicle-bookmark-gnus-narrow) (define-key (symbol-value map) "\215" 'icicle-bookmark-man-narrow) (define-key (symbol-value map) "\222" 'icicle-bookmark-region-narrow) (define-key (symbol-value map) "\225" 'icicle-bookmark-url-narrow) (define-key (symbol-value map) "\227" 'icicle-bookmark-w3m-narrow) (define-key (symbol-value map) "\200" 'icicle-bookmark-remote-file-narrow) (define-key (symbol-value map) [(control meta 61) 98] 'icicle-bookmark-specific-buffers-narrow) (define-key (symbol-value map) [(control meta 61) 102] 'icicle-bookmark-specific-files-narrow) (define-key (symbol-value map) [(control meta 46)] 'icicle-bookmark-this-buffer-narrow) (define-key (symbol-value map) [(control meta 66)] 'icicle-bookmark-bookmark-list-narrow) (define-key (symbol-value map) [(control meta 70)] 'icicle-bookmark-local-file-narrow) (define-key (symbol-value map) [(control meta 73)] 'icicle-bookmark-info-narrow) (define-key (symbol-value map) [(control meta 75)] 'icicle-bookmark-desktop-narrow)))) (icicle-bookmark-cleanup-on-quit) (icicle-bookmark-cleanup))

(autoload 'icicle-bookmarked-buffer-list "icicles-cmd1" "\
`icicle-buffer-list', but only for bookmarked buffers.

\(fn)" t nil)

(autoload 'icicle-bookmarked-file-list "icicles-cmd1" "\
`icicle-buffer-list', but only for bookmarked buffers.

\(fn)" t nil)

(icicle-define-command icicle-find-first-tag "Find first tag in current tags table whose name matches your input.\nThis is similar to standard command `find-tag', with these\ndifferences:\n\n* This is a multi-command, so you can visit any number of tags.\n\n* Only the first tag of several identical tags is a candidate, so you\n  cannot visit the others.  That is, there is no equivalent to using\n  `M-,' (`tags-loop-continue') after `find-tag' to find additional,\n  identical tags.\n\n* If `crosshairs.el' is loaded, the target position is highlighted.\n\nTo browse all tags (including duplicates) in all tags tables, use the\nmore powerful Icicles multi-command `icicle-find-tag'.\n\nBy default, Icicle mode remaps all key sequences that are normally\nbound to `find-tag-other-window' to `icicle-find-first-tag'.  If you\ndo not want this remapping, then customize option\n`icicle-top-level-key-bindings'." icicle-find-first-tag-action "Find tag: " (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag) nil nil nil nil (funcall (or find-tag-default-function (get major-mode 'find-tag-default-function) 'find-tag-default)) nil ((completion-ignore-case (progn (require 'etags) (if (and (boundp 'tags-case-fold-search) (memq tags-case-fold-search '(t nil))) tags-case-fold-search case-fold-search))) (case-fold-search completion-ignore-case)) nil (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)) (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)))

(icicle-define-command icicle-find-first-tag-other-window "Find first tag in current tags table whose name matches your input.\nSame as `icicle-find-first-tag' except it uses a different window." icicle-find-first-tag-other-window-action "Find tag other window: " (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag) nil nil nil nil (funcall (or find-tag-default-function (get major-mode 'find-tag-default-function) 'find-tag-default)) nil ((completion-ignore-case (progn (require 'etags) (if (and (boundp 'tags-case-fold-search) (memq tags-case-fold-search '(t nil))) tags-case-fold-search case-fold-search))) (case-fold-search completion-ignore-case)) nil (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)) (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)))

(autoload 'icicle-find-tag "icicles-cmd1" "\
Navigate among all tags that match REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You can use completion to choose a tag in the current tags table as
REGEXP.  You can use `\\[icicle-pop-tag-mark]' to return to your starting point.

All matching tags are shown, including duplicate tags from the same or
different source files.  This means that you do not need `M-,' - you
see all tags as candidates to visit.

By default:

* Tags from all tags files are candidates.
* The source file name is shown after a tag, in buffer *Completions*.

A prefix argument changes this default behavior, as follows:

* ARG = 0 or ARG > 0: only the current tag table is used
* ARG = 0 or ARG < 0: source file names are not shown

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag' to `icicle-find-tag'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

If `crosshairs.el' is loaded, then the target position is highlighted.

\(fn REGEXP &optional ARG)" t nil)

(autoload 'icicle-pop-tag-mark "icicles-cmd1" "\
Like `pop-tag-mark', but uses `pop-to-buffer', not `switch-to-buffer'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-tag-mark' to `icicle-pop-tag-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn)" t nil)

(autoload 'icicle-other-window-or-frame "icicles-cmd1" "\
Select a window or frame, by name or by order.
This command combines Emacs commands `other-window' and `other-frame',
together with Icicles multi-commands `icicle-select-window', and
`icicle-select-frame'.  Use the prefix argument to choose, as follows:

 With no prefix arg or a non-zero numeric prefix arg:
  If the selected frame has multiple windows, then this is
  `other-window'.  Otherwise, it is `other-frame'.

 With a zero prefix arg (e.g. `C-0'):
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows in the frame as candidates.
  Otherwise (single-window frame), this is `icicle-select-frame'.

 With plain `C-u':
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows from all visible frames as
  candidates.  Otherwise, this is `icicle-select-frame'.

By default, Icicle mode remaps all key sequences that are normally
bound to `other-window' to `icicle-other-window-or-frame'.  If you do
not want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(icicle-define-command icicle-select-frame "Select frame by its name and raise it.\nA frame name in this context is suffixed as needed by [NUMBER], to\nmake it unique.  For example, in a context where frames are named for\ntheir buffers and you have two frames showing buffer *Help*, one of\nthe frames will be called `*Help*[2]' for use with this command." icicle-select-frame-by-name "Select frame: " icicle-frame-alist nil t nil (if (boundp 'frame-name-history) 'frame-name-history 'icicle-frame-name-history) (cdr (assq 'name (frame-parameters (next-frame (selected-frame))))) nil ((icicle-frame-alist (icicle-make-frame-alist)) (alt-fn nil) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (setq alt-fn (icicle-alt-act-fn-for-type "frame")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "frame")))))

(autoload 'icicle-select-frame-by-name "icicles-cmd1" "\
Select the frame named NAME, and raise it.
Optional argument FRAME-ALIST is an alist of frames to choose from.
Each element has the form (FNAME . FRAME), where FNAME names FRAME.
See `icicle-make-frame-alist' for more about FNAME.

\(fn NAME &optional FRAME-ALIST)" t nil)

(icicle-define-command icicle-select-window "Select window by its name.\nWith no prefix arg, candidate windows are those of the selected frame.\nWith a prefix arg, windows of all visible frames are candidates.\n\nA window name is the name of its displayed buffer, but suffixed as\nneeded by [NUMBER], to make the name unique.  For example, if you have\ntwo windows showing buffer *Help*, one of the windows will be called\n`*Help*[2]' for use with this command." icicle-select-window-by-name "Select window: " icicle-window-alist nil t nil nil (buffer-name (window-buffer (other-window 1))) nil ((icicle-window-alist (icicle-make-window-alist current-prefix-arg))))

(icicle-define-command icicle-delete-windows "Delete windows showing a buffer, anywhere." delete-windows-on "Delete windows on buffer: " (let ((cand-bufs nil)) (dolist (buf (buffer-list)) (when (get-buffer-window buf 0) (push (list (buffer-name buf)) cand-bufs))) cand-bufs) nil t nil 'buffer-name-history (buffer-name (current-buffer)) nil ((icicle-use-candidates-only-once-flag t) (icicle-inhibit-try-switch-buffer t) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "buffer"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "buffer")))))

(autoload 'icicle-delete-window "icicles-cmd1" "\
`delete-window' or prompt for buffer and delete all its windows.
When called from the minibuffer, remove the *Completions* window.

Otherwise:
 With no prefix argument, delete the selected window.
 With a prefix argument, prompt for a buffer and delete all windows,
   on any frame, that show that buffer.

 With a prefix argument, this is an Icicles multi-command - see
 command `icicle-mode'.  Input-candidate completion and cycling are
 available.  While cycling, these keys with prefix `C-' are active:

 `C-RET'   - Act on current completion candidate only
 `C-down'  - Move to next completion candidate and act
 `C-up'    - Move to previous completion candidate and act
 `C-next'  - Move to next apropos-completion candidate and act
 `C-prior' - Move to previous apropos-completion candidate and act
 `C-end'   - Move to next prefix-completion candidate and act
 `C-home'  - Move to previous prefix-completion candidate and act
 `C-!'     - Act on *all* candidates (or all that are saved),
             successively (careful!)

 With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
 `C-M-RET', `C-M-down', and so on) provide help about candidates.

 Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
 or `C-g' to quit.

By default, Icicle mode remaps all key sequences that are normally
bound to `delete-window' to `icicle-delete-window'.  If you do not
want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn BUFFERP)" t nil)

(icicle-define-command icicle-kill-buffer "Kill a buffer.\nWith a positive prefix arg, only buffers visiting files are candidates.\nWith a negative prefix arg, only buffers associated with the selected\nframe are candidates.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names\n `icicle-buffer-extras'             - Extra buffers to display\n `icicle-buffer-match-regexp'       - Regexp that buffers must match\n `icicle-buffer-no-match-regexp'    - Regexp buffers must not match\n `icicle-buffer-predicate'          - Predicate buffer must satisfy\n `icicle-buffer-sort'               - Sort function for candidates\n\nBy default, Icicle mode remaps all key sequences that are normally\nbound to `kill-buffer' to `icicle-kill-buffer'.  If you do not want\nthis remapping, then customize option\n`icicle-top-level-key-bindings'.\n\nNote: The prefix arg is tested, even when this is called\nnoninteractively.  Lisp code can bind `current-prefix-arg' to control\nthe behavior." icicle-kill-a-buffer-and-update-completions "Kill buffer: " (mapcar #'(lambda (buf) (list (buffer-name buf))) bufflist) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'buffer-name-history (buffer-name (current-buffer)) nil (icicle-buffer-bindings))

(icicle-define-command icicle-buffer "Switch to a different buffer.\nWith a positive prefix arg, only buffers visiting files are candidates.\nWith a negative prefix arg, only buffers associated with the selected\nframe are candidates.\n\nYou can use `C-x m' during completion to access buffer (non-file)\n bookmarks, if you use library `bookmark+.el'.\nYou can use `S-delete' during completion to kill a candidate buffer.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names\n `icicle-buffer-extras'             - Extra buffers to display\n `icicle-buffer-match-regexp'       - Regexp that buffers must match\n `icicle-buffer-no-match-regexp'    - Regexp buffers must not match\n `icicle-buffer-predicate'          - Predicate buffer must satisfy\n `icicle-buffer-sort'               - Sort function for candidates\n\nFor example, to show only buffers that are associated with files, set\n`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).\n\nOption `icicle-buffer-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-buffers-ido-like' non-nil gives this command a more\nIdo-like behavior.\n\nSee also command `icicle-buffer-config'.\n\nBy default, Icicle mode remaps all key sequences that are normally\nbound to `switch-to-buffer' to `icicle-buffer'.  If you do not want\nthis remapping, then customize option\n`icicle-top-level-key-bindings'.\n\nNote: The prefix arg is tested, even when this is called\nnoninteractively.  Lisp code can bind `current-prefix-arg' to control\nthe behavior." switch-to-buffer "Switch to buffer: " (mapcar #'(lambda (buf) (list (buffer-name buf))) bufflist) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'buffer-name-history (icicle-default-buffer-names) nil (icicle-buffer-bindings) (progn (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-non-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-non-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-non-file-other-window))) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-command icicle-insert-buffer "Multi-command version of `insert-buffer'.\nWith a positive prefix arg, only buffers visiting files are candidates.\nWith a negative prefix arg, only buffers associated with the selected\nframe are candidates.\n\nYou can use `S-delete' during completion to kill a candidate buffer.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names\n `icicle-buffer-extras'             - Extra buffers to display\n `icicle-buffer-match-regexp'       - Regexp that buffers must match\n `icicle-buffer-no-match-regexp'    - Regexp buffers must not match\n `icicle-buffer-predicate'          - Predicate buffer must satisfy\n `icicle-buffer-sort'               - Sort function for candidates\n\nFor example, to show only buffers that are associated with files, set\n`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).\n\nOption `icicle-buffer-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nSee also command `icicle-buffer-config'.\n\nNote: The prefix arg is tested, even when this is called\nnoninteractively.  Lisp code can bind `current-prefix-arg' to control\nthe behavior." insert-buffer "Buffer: " (mapcar #'(lambda (buf) (list (buffer-name buf))) bufflist) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'buffer-name-history (icicle-default-buffer-names) nil (icicle-buffer-bindings))

(icicle-define-command icicle-buffer-other-window "Switch to a different buffer in another window.\nSame as `icicle-buffer' except it uses a different window." switch-to-buffer-other-window "Switch to buffer in other window: " (mapcar #'(lambda (buf) (list (buffer-name buf))) bufflist) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'buffer-name-history (icicle-default-buffer-names) nil (icicle-buffer-bindings) (progn (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-non-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-non-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-non-file-other-window))) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-command icicle-add-buffer-candidate "Add buffer as an always-show completion candidate.\nAdd the buffer to `icicle-buffer-extras'.  Save the updated option.\nWith a positive prefix arg, only buffers visiting files are candidates.\nWith a negative prefix arg, only buffers associated with the selected\nframe are candidates.\n\nYou can use `S-delete' on any completion candidate to remove it from\n`icicle-buffer-extras'.\n\nNote: The prefix arg is tested, even when this is called\nnoninteractively.  Lisp code can bind `current-prefix-arg' to control\nthe behavior." (lambda (buf) (add-to-list 'icicle-buffer-extras buf) (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras) (message "Buffer `%s' added to always-show buffers" buf)) "Buffer candidate to show always: " (mapcar #'(lambda (buf) (list (buffer-name buf))) bufflist) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'buffer-name-history (icicle-default-buffer-names) nil (icicle-buffer-bindings ((icicle-use-candidates-only-once-flag t))))

(icicle-define-command icicle-remove-buffer-candidate "Remove buffer as an always-show completion candidate.\nRemove the buffer from `icicle-buffer-extras'.\nSave the updated option." icicle-remove-buffer-candidate-action "Remove buffer from always-show list: " (mapcar #'list icicle-buffer-extras) nil t nil 'buffer-name-history (car icicle-buffer-extras) nil ((icicle-use-candidates-only-once-flag t) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "buffer"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "buffer")))) (unless icicle-buffer-extras (error "`icicle-extra-buffers' is empty")))

(icicle-define-command icicle-buffer-config "Choose a configuration of user options for `icicle-buffer'.\nYou can use `S-delete' on any configuration during completion to\nremove it.  See user option `icicle-buffer-configs'.\nSee also commands `icicle-add-buffer-config' and\n`icicle-remove-buffer-config'." (lambda (config-name) (let ((config (assoc config-name icicle-buffer-configs))) (setq icicle-buffer-match-regexp (elt config 1) icicle-buffer-no-match-regexp (elt config 2) icicle-buffer-predicate (elt config 3) icicle-buffer-extras (elt config 4) icicle-buffer-sort (elt config 5)))) "Configuration: " icicle-buffer-configs nil t nil 'icicle-buffer-config-history nil nil ((icicle-delete-candidate-object 'icicle-remove-buffer-config-action)))

(icicle-define-add-to-alist-command icicle-add-buffer-config "Add buffer configuration to `icicle-buffer-configs'.\nYou are prompted for the buffer configuration components.\nFor the list of extra buffers to always display, you can choose them\nusing `C-mouse-2', `C-RET', and so on, just as you would make any\nIcicles multiple choice." #'(lambda nil (let ((name (read-from-minibuffer "Add buffer configuration.  Name: ")) (match-regexp (icicle-read-from-minibuf-nil-default "Regexp to match: " nil nil nil 'regexp-history icicle-buffer-match-regexp)) (nomatch-regexp (icicle-read-from-minibuf-nil-default "Regexp not to match: " nil nil nil 'regexp-history icicle-buffer-no-match-regexp)) (pred (icicle-read-from-minibuf-nil-default "Predicate to satify: " nil nil nil (if (boundp 'function-name-history) 'function-name-history 'icicle-function-name-history) icicle-buffer-predicate)) (sort-fn (icicle-read-from-minibuf-nil-default "Sort function: " nil nil t (if (boundp 'function-name-history) 'function-name-history 'icicle-function-name-history) (and icicle-buffer-sort (symbol-name icicle-buffer-sort)))) (extras (progn (message "Choose extra buffers to show...") (sit-for 1) (icicle-buffer-list)))) (list name match-regexp nomatch-regexp pred extras sort-fn))) icicle-buffer-configs)

(icicle-define-command icicle-buffer-list "Choose a list of buffer names.\nWith a positive prefix arg, only buffers visiting files are candidates.\nWith a negative prefix arg, only buffers associated with the selected\nframe are candidates.\n\nYou can use `S-delete' during completion to kill a candidate buffer.\nThe list of names (strings) is returned.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names\n `icicle-buffer-extras'             - Extra buffers to display\n `icicle-buffer-match-regexp'       - Regexp that buffers must match\n `icicle-buffer-no-match-regexp'    - Regexp buffers must not match\n `icicle-buffer-predicate'          - Predicate buffer must satisfy\n `icicle-buffer-sort'               - Sort function for candidates\n\nNote: The prefix arg is tested, even when this is called\nnoninteractively.  Lisp code can bind `current-prefix-arg' to control\nthe behavior." (lambda (name) (push name buf-names)) "Choose buffer (`RET' when done): " (mapcar #'(lambda (buf) (list (buffer-name buf))) (if current-prefix-arg (if (wholenump (prefix-numeric-value current-prefix-arg)) (icicle-remove-if-not #'(lambda (bf) (buffer-file-name bf)) (buffer-list)) (cdr (assq 'buffer-list (frame-parameters)))) (buffer-list))) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'buffer-name-history nil nil ((buf-names nil) (completion-ignore-case (or (and (boundp 'read-buffer-completion-ignore-case) read-buffer-completion-ignore-case) completion-ignore-case)) (icicle-must-match-regexp icicle-buffer-match-regexp) (icicle-must-not-match-regexp icicle-buffer-no-match-regexp) (icicle-must-pass-after-match-predicate icicle-buffer-predicate) (icicle-extra-candidates icicle-buffer-extras) (icicle-transform-function 'icicle-remove-dups-if-extras) (icicle-sort-comparer (or icicle-buffer-sort icicle-sort-comparer)) (icicle-sort-orders-alist (append (list '("by last access") '("*...* last" . icicle-buffer-sort-*\.\.\.*-last) '("by buffer size" . icicle-buffer-smaller-p) '("by major mode name" . icicle-major-mode-name-less-p) (and (fboundp 'icicle-mode-line-name-less-p) '("by mode-line mode name" . icicle-mode-line-name-less-p)) '("by file/process name" . icicle-buffer-file/process-name-less-p)) (delete '("turned OFF") icicle-sort-orders-alist))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "buffer"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "buffer"))) (icicle-delete-candidate-object 'icicle-kill-a-buffer) (icicle-require-match-flag icicle-buffer-require-match-flag) (icicle-ignore-space-prefix-flag icicle-buffer-ignore-space-prefix-flag) (icicle-use-candidates-only-once-flag t)) nil nil (prog1 (setq buf-names (nreverse (delete "" buf-names))) (when (interactive-p) (message "Buffers: %S" buf-names))))

(icicle-define-command icicle-remove-buffer-config "Remove buffer configuration from `icicle-buffer-configs'.\nSave the updated option." icicle-remove-buffer-config-action "Remove buffer configuration: " (mapcar #'(lambda (config) (list (car config))) icicle-buffer-configs) nil t nil 'icicle-buffer-config-history (caar icicle-buffer-configs) nil ((icicle-use-candidates-only-once-flag t)))

(icicle-define-command icicle-face-list "Choose a list of face names.  The list of names (strings) is returned." (lambda (name) (push (icicle-transform-multi-completion name) face-names)) prompt (mapcar #'icicle-make-face-candidate (face-list)) nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history) nil nil ((prompt "Choose face (`RET' when done): ") (icicle-list-nth-parts-join-string ": ") (icicle-list-join-string ": ") (icicle-list-end-string "") (icicle-list-use-nth-parts '(1)) (icicle-use-candidates-only-once-flag t) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "face"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "face"))) (face-names nil)) (put-text-property 0 1 'icicle-fancy-candidates t prompt) nil (prog1 (setq face-names (nreverse (delete "" face-names))) (when (interactive-p) (message "Faces: %S" face-names))))

(icicle-define-command icicle-color-theme "Change color theme.\nYou can use `S-delete' during completion to remove the current\ncandidate from the list of color themes.\n\nIf you use `C-g' during this command, the previous color-theme\nsnapshot is used to restore that color theme.\n\nRemember too that you can use the pseudo-theme [Reset] to restore the\nlast theme: `M-x color-theme-select [Reset]'.\n\nBy default, each time you invoke this command, a snapshot is first\nmade of the current color theme (or current colors, if no theme is\nused).  Thus, by default, if you use `C-g', the colors restored are\nthose used before you changed themes using this command.\n\nHowever, if you use a prefix arg, then this command takes no new\nsnapshot, unless no snapshot has ever been taken during this Emacs\nsession.  This can be useful when experimenting, to restore not to the\nstate just before this command invocation, but to some previous\nsnapshot.\n\nTo use this command, you must have loaded library `color-theme.el',\navailable from http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme." (lambda (theme) (when (string= "" theme) (error "No theme name entered (empty input)")) (funcall (intern theme))) "Theme: " icicle-color-themes nil t nil (if (boundp 'color-theme-history) 'color-theme-history 'icicle-color-theme-history) nil nil ((icicle-delete-candidate-object 'icicle-color-themes) (prefix-arg current-prefix-arg)) (progn (unless (prog1 (require 'color-theme nil t) (when (and (fboundp 'color-theme-initialize) (not color-theme-initialized)) (condition-case nil (let ((color-theme-load-all-themes t)) (color-theme-initialize) (setq color-theme-initialized t)) (error nil)))) (error "This command requires library `color-theme.el'")) (unless icicle-color-themes (setq icicle-color-themes (delete '("bury-buffer") (mapcar (lambda (entry) (list (symbol-name (car entry)))) color-themes)))) (when (or (not prefix-arg) (not (assq 'color-theme-snapshot color-themes)) (not (commandp 'color-theme-snapshot))) (fset 'color-theme-snapshot (color-theme-make-snapshot)) (setq color-themes (delq (assq 'color-theme-snapshot color-themes) color-themes) color-themes (delq (assq 'bury-buffer color-themes) color-themes) color-themes (append '((color-theme-snapshot "[Reset]" "Undo changes, if possible.") (bury-buffer "[Quit]" "Bury this buffer.")) color-themes)))) (color-theme-snapshot))

(icicle-define-command icicle-completing-yank "Yank an entry from the `kill-ring', choosing it using completion.\nThis is like `yank', but it does not rotate the `kill-ring'.\nThe mark is pushed first, so the yanked text becomes the region.\nYou can sort the candidates to yank - use `C-,'.\nYou can use `S-delete' during completion to remove a candidate entry\nfrom the `kill-ring'." icicle-insert-for-yank "Insert: " (mapcar #'list kill-ring) nil t nil 'icicle-kill-history (car kill-ring) nil ((icicle-transform-function 'icicle-remove-duplicates) (icicle-sort-comparer nil) (icicle-delete-candidate-object 'kill-ring)))

(autoload 'icicle-yank-maybe-completing "icicles-cmd1" "\
`icicle-completing-yank', `icicle-yank', or `icicle-yank-function'.
If called from the minibuffer, call `icicle-yank'.
Otherwise:
 With a negative prefix argument, call `icicle-completing-yank'.
 Otherwise, call the value of user option `icicle-yank-function' (by
 default, `yank').

\(fn &optional ARG)" t nil)

(icicle-define-file-command icicle-delete-file "Delete a file or directory." icicle-delete-file-or-directory "Delete file or directory: " default-directory nil t nil nil (icicle-file-bindings))

(icicle-define-file-command icicle-file-list "Choose a list of file and directory names.\nUse multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,\nand a final-choice key (e.g. `RET', `mouse-2') to choose the last one.\nYou can navigate the directory tree, picking files and directories\nanywhere in the tree.\n\nYou can use `S-delete' during completion to delete a candidate file.\n  Careful: This deletes the file, it does not just remove it as a\n  candidate.\nThe list of file names (strings) is returned.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-file-extras'           - Extra file names to display\n `icicle-file-match-regexp'     - Regexp that file names must match\n `icicle-file-no-match-regexp'  - Regexp file names must not match\n `icicle-file-predicate'        - Predicate file names must satisfy\n `icicle-file-sort'             - Sort function for candidates\n\nFor example, to show only names of files larger than 5000 bytes, set\n`icicle-file-predicate' to:\n\n  (lambda (file) (> (nth 5 (file-attributes file)) 5000))\n\nOption `icicle-file-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-files-ido-like' non-nil gives this command a more\nIdo-like behavior." (lambda (name) (push name file-names)) "Choose file (`RET' when done): " nil nil t nil nil (icicle-file-bindings ((file-names nil) (icicle-comp-base-is-default-dir-p t))) nil nil (prog1 (setq file-names (nreverse (delete "" file-names))) (when (interactive-p) (message "Files: %S" file-names))))

(icicle-define-file-command icicle-directory-list "Choose a list of directory names.\nUse multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,\nand a final-choice key (e.g. `RET', `mouse-2') to choose the last one.\nYou can navigate the directory tree, picking directories anywhere in\nthe tree.\n\nYou can use `S-delete' during completion to delete a candidate (empty)\ndirectory.\n  Careful: This deletes the directory, it does not just remove it as a\n  candidate.\nThe list of directory names (strings) is returned.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-file-extras'           - Extra directory names to display\n `icicle-file-match-regexp'     - Regexp directory names must match\n `icicle-file-no-match-regexp'  - Regexp dir names must not match\n `icicle-file-predicate'        - Predicate the dir names must satisfy\n `icicle-file-sort'             - Sort function for candidates\n\nOption `icicle-file-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-files-ido-like' non-nil gives this command a more\nIdo-like behavior." (lambda (name) (push name dir-names)) "Choose directory (`RET' when done): " nil nil t nil nil (icicle-file-bindings ((dir-names nil) (user-file-pred icicle-file-predicate) (icicle-file-predicate (if user-file-pred #'(lambda (f) (and (file-directory-p f) (funcall user-file-pred f))) #'file-directory-p)) (icicle-comp-base-is-default-dir-p t))) nil nil (prog1 (setq dir-names (nreverse (delete "" dir-names))) (when (interactive-p) (message "Directories: %S" dir-names))))

(icicle-define-file-command icicle-dired "Multi-command version of `dired'.\nDuring completion:\n You can use `C-x m' to access Dired bookmarks, if you use library\n  `bookmark+.el'.\n You can use `C-c +' to create a new directory.\n You can use `M-|' to open Dired on the currently matching file names.\n You can use `S-delete' to delete a candidate file or (empty)\n  directory." (lambda (dir) (dired dir switches)) "Dired (directory): " nil default-directory nil nil nil (icicle-file-bindings ((switches (and current-prefix-arg (read-string "Dired listing switches: " dired-listing-switches))) (icicle-file-sort (or icicle-file-sort 'icicle-dirs-first-p)) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))))) (unless (boundp 'minibuffer-local-filename-completion-map) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-dired-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-dired-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-dired-other-window))) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-file-command icicle-dired-other-window "Multi-command version of `dired-other-window'.\nDuring completion:\n You can use `C-x m' to access Dired bookmarks, if you use library\n  `bookmark+.el'.\n You can use `C-c +' to create a new directory.\n You can use `M-|' to open Dired on the currently matching file names.\n You can use `S-delete' to delete a candidate file or (empty)\n  directory." (lambda (dir) (dired-other-window dir switches)) "Dired in other window (directory): " nil default-directory nil nil nil (icicle-file-bindings ((switches (and current-prefix-arg (read-string "Dired listing switches: " dired-listing-switches))) (icicle-file-sort (or icicle-file-sort 'icicle-dirs-first-p)) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))))) (unless (boundp 'minibuffer-local-filename-completion-map) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-dired-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-dired-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-dired-other-window))) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(autoload 'icicle-file "icicles-cmd1" "\
Visit a file or directory.
With no prefix argument, use relative file names
 (`icicle-find-file').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

By default, Icicle mode remaps all key sequences that are normally bound
to `find-file' to `icicle-file'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(autoload 'icicle-file-other-window "icicles-cmd1" "\
Visit a file or directory in another window.
With no prefix argument, use relative file names
 (`icicle-find-file-other-window').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute-other-window').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-file-other-window' to `icicle-file-other-window'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(icicle-define-command icicle-find-file-absolute "Visit a file or directory, given its absolute name.\nUnlike `icicle-find-file', the completion candidates are absolute, not\nrelative, file names.  By default, the completion candidates are files\nin the current directory, but you can substitute other candidates by\nretrieving a saved candidate set.\n\nNote that completion here matches candidates as ordinary strings.  It\nknows nothing of file names per se.  In particular, you cannot use\nremote file-name syntax.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-hiding-common-match]' to hide the common match portion of\neach candidate.  That can be particularly helpful for files that are\nin a common directory.\n\nWith a prefix argument, you can choose also by date: Completion\ncandidates include the last modification date.\n\nDuring completion:\n You can use `C-x m' to access file bookmarks, if you use library\n  `bookmark+.el'.\n You can use `C-c C-d' (think `cd') to change the `default-directory'.\n You can use `C-c +' to create a new directory.\n You can use `M-|' to open Dired on the currently matching file names.\n You can use `S-delete' to delete a candidate file or (empty)\n  directory.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-file-extras'           - Extra file names to display\n `icicle-file-match-regexp'     - Regexp that file names must match\n `icicle-file-no-match-regexp'  - Regexp file names must not match\n `icicle-file-predicate'        - Predicate file names must satisfy\n `icicle-file-sort'             - Sort function for candidates\n\nFor example, to show only names of files larger than 5000 bytes, set\n`icicle-file-predicate' to:\n\n  (lambda (file) (> (nth 5 (file-attributes file)) 5000))\n\nOption `icicle-file-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-files-ido-like' non-nil gives this command a more\nIdo-like behavior." (lambda (f) (find-file (icicle-transform-multi-completion f) 'WILDCARDS)) prompt (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list) icicle-abs-file-candidates) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) default-directory 'file-name-history default-directory nil (icicle-file-bindings ((prompt "File or directory: ") (icicle-abs-file-candidates (mapcar #'(lambda (file) (if (file-directory-p file) (concat file "/") file)) (directory-files default-directory 'full nil 'nosort))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))) (icicle-special-candidate-regexp (or icicle-special-candidate-regexp ".+/$")) (icicle-candidate-properties-alist (and current-prefix-arg '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and current-prefix-arg '(1))))) (progn (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-completion-map "" 'icicle-cd-for-abs-files) (define-key minibuffer-local-must-match-map "" 'icicle-cd-for-abs-files) (define-key minibuffer-local-completion-map "+" 'icicle-make-directory) (define-key minibuffer-local-must-match-map "+" 'icicle-make-directory) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "" nil) (define-key minibuffer-local-must-match-map "" nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "" nil) (define-key minibuffer-local-must-match-map "" nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-command icicle-find-file-absolute-other-window "Visit a file or directory in another window, given its absolute name.\nSame as `icicle-find-file-absolute' except uses a different window." (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'WILDCARDS)) prompt (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list) icicle-abs-file-candidates) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) default-directory 'file-name-history default-directory nil (icicle-file-bindings ((prompt "File or directory: ") (icicle-abs-file-candidates (mapcar #'(lambda (file) (if (file-directory-p file) (concat file "/") file)) (directory-files default-directory 'full nil 'nosort))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))) (icicle-special-candidate-regexp (or icicle-special-candidate-regexp ".+/$")) (icicle-candidate-properties-alist (and current-prefix-arg '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and current-prefix-arg '(1))))) (progn (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-completion-map "" 'icicle-cd-for-abs-files) (define-key minibuffer-local-must-match-map "" 'icicle-cd-for-abs-files) (define-key minibuffer-local-completion-map "+" 'icicle-make-directory) (define-key minibuffer-local-must-match-map "+" 'icicle-make-directory) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "" nil) (define-key minibuffer-local-must-match-map "" nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "" nil) (define-key minibuffer-local-must-match-map "" nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(autoload 'icicle-cd-for-abs-files "icicles-cmd1" "\
Change `default-directory' during `icicle-find-file-absolute'.

\(fn DIR)" t nil)

(icicle-define-file-command icicle-find-file "Visit a file or directory.\nIf you use a prefix argument when you act on a candidate file name,\nthen you visit the file in read-only mode.\n\nIf you use a prefix arg for the command itself, this reverses the\neffect of using a prefix arg on individual candidates.  That is, with\na prefix arg for the command, files are visited in read-only mode by\ndefault and a prefix arg for an individual file visits it without\nread-only mode.\n\nDuring completion:\n You can use `C-x m' to access file bookmarks, if you use library\n  `bookmark+.el'.\n You can use `C-c +' to create a new directory.\n You can use `M-|' to open Dired on the currently matching file names.\n You can use `S-delete' to delete a candidate file or (empty)\n  directory.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-file-extras'           - Extra absolute file names to display\n `icicle-file-match-regexp'     - Regexp that file names must match\n `icicle-file-no-match-regexp'  - Regexp file names must not match\n `icicle-file-predicate'        - Predicate file names must satisfy\n `icicle-file-sort'             - Sort function for candidates\n\nFor example, to show only names of files larger than 5000 bytes, set\n`icicle-file-predicate' to:\n\n  (lambda (file) (> (nth 5 (file-attributes file)) 5000))\n\nOption `icicle-file-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-files-ido-like' non-nil gives this command a more\nIdo-like behavior." (lambda (file) (let* ((r-o (if (eq this-command 'icicle-candidate-action) (or (and init-pref-arg (not current-prefix-arg)) (and (not init-pref-arg) current-prefix-arg)) init-pref-arg)) (fn (if r-o 'find-file-read-only 'find-file))) (funcall fn file 'WILDCARDS))) (concat "File or directory" (and init-pref-arg " (read-only)") ": ") nil (if (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit)) (condition-case nil (abbreviate-file-name (dired-get-file-for-visit)) (error nil)) default-directory) (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil nil (icicle-file-bindings ((init-pref-arg current-prefix-arg) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))))) (unless (boundp 'minibuffer-local-filename-completion-map) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-file-command icicle-find-file-other-window "Visit a file or directory in another window.\nSame as `icicle-find-file' except it uses a different window.\n\nNote: Unlike standard `find-file-other-window', in Dired the file or\ndirectory on the current line is the default value.  Like\n`find-file-other-window', if you just hit `RET' without entering any\ntext, that is the same as if you first use `M-n' to retrieve the\ndefault value and then hit `RET'.  Thus, if you just want to visit, in\na different window, the current directory instead of the file or\ndirectory of the current line, you should use `\\<minibuffer-local-completion-map>\\[icicle-erase-minibuffer-or-history-element]' to first empty the\nminibuffer.  Or you can just use a different command, such as `\\[dired]',\nto visit the current directory." (lambda (file) (let* ((r-o (if (eq this-command 'icicle-candidate-action) (or (and init-pref-arg (not current-prefix-arg)) (and (not init-pref-arg) current-prefix-arg)) init-pref-arg)) (fn (if r-o 'find-file-read-only-other-window 'find-file-other-window))) (funcall fn file 'WILDCARDS))) (concat "File or directory" (and init-pref-arg " (read-only)") ": ") nil (if (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit)) (condition-case nil (abbreviate-file-name (dired-get-file-for-visit)) (error nil)) default-directory) (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil nil (icicle-file-bindings ((init-pref-arg current-prefix-arg) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))))) (unless (boundp 'minibuffer-local-filename-completion-map) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(autoload 'icicle-find-file-read-only "icicles-cmd1" "\
Visit a file or directory in read-only mode.
If you use a prefix argument when you act on a candidate file name,
then visit the file without read-only mode.

If you use a prefix arg for the command itself, this reverses the
effect of using a prefix arg on individual candidates.  That is, with
a prefix arg for the command, files are not visited in read-only mode
by default and a prefix arg for an individual file visits it in
read-only mode.

\(fn)" t nil)

(autoload 'icicle-find-file-read-only-other-window "icicles-cmd1" "\
Visit a file or directory in read-only mode in another window.
Same as `icicle-find-file-read-only' except use a different window.

\(fn)" t nil)

(icicle-define-command icicle-recent-file "Open a recently used file.\nWith a prefix argument, you can choose also by date: Completion\ncandidates include the last modification date.\n\nNote that completion here matches candidates as ordinary strings.  It\nknows nothing of file names per se.  In particular, you cannot use\nremote file-name syntax.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-hiding-common-match]' to hide the common match portion of\neach candidate.  That can be particularly helpful for files that are\nin a common directory.\n\nDuring completion:\n You can use `C-x m' to access file bookmarks, if you use library\n  `bookmark+.el'.\n You can use `C-c +' to create a new directory.\n You can use `M-|' to open Dired on the currently matching file names.\n You can use `S-delete' to delete a candidate file or (empty)\n  directory.\n\nYou can use any of the alternative-action keys, such as `C-S-RET', to\nremove a candidate file from the recent files list, `recentf-list'.\n(The file itself is not deleted.)\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-file-extras'           - Extra absolute file names to display\n `icicle-file-match-regexp'     - Regexp that file names must match\n `icicle-file-no-match-regexp'  - Regexp file names must not match\n `icicle-file-predicate'        - Predicate file names must satisfy\n `icicle-file-sort'             - Sort function for candidates\n\nFor example, to show only names of files larger than 5000 bytes, set\n`icicle-file-predicate' to:\n\n  (lambda (file) (> (nth 5 (file-attributes file)) 5000))\n\nOption `icicle-file-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-files-ido-like' non-nil gives this command a more\nIdo-like behavior." (lambda (f) (find-file (icicle-transform-multi-completion f) 'WILDCARDS)) prompt (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list) icicle-abs-file-candidates) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'file-name-history (car recentf-list) nil (icicle-file-bindings ((prompt "Recent file: ") (icicle-abs-file-candidates (progn (unless (boundp 'recentf-list) (require 'recentf)) (when (fboundp 'recentf-mode) (recentf-mode 99)) (unless (consp recentf-list) (error "No recently accessed files")) recentf-list)) (icicle-candidate-alt-action-fn 'icicle-remove-from-recentf-candidate-action) (icicle-use-candidates-only-once-alt-p t) (icicle-candidate-properties-alist (and current-prefix-arg '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and current-prefix-arg '(1))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") (mapcar #'icicle-transform-multi-completion files)))))))) (progn (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-completion-map "+" 'icicle-make-directory) (define-key minibuffer-local-must-match-map "+" 'icicle-make-directory) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-command icicle-recent-file-other-window "Open a recently used file in another window.\nSame as `icicle-recent-file' except it uses a different window." (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'WILDCARDS)) prompt (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list) icicle-abs-file-candidates) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'file-name-history (car recentf-list) nil (icicle-file-bindings ((prompt "Recent file: ") (icicle-abs-file-candidates (progn (unless (boundp 'recentf-list) (require 'recentf)) (when (fboundp 'recentf-mode) (recentf-mode 99)) (unless (consp recentf-list) (error "No recently accessed files")) recentf-list)) (icicle-candidate-alt-action-fn 'icicle-remove-from-recentf-candidate-action) (icicle-use-candidates-only-once-alt-p t) (icicle-candidate-properties-alist (and current-prefix-arg '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and current-prefix-arg '(1))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") (mapcar #'icicle-transform-multi-completion files)))))))) (progn (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-completion-map "+" 'icicle-make-directory) (define-key minibuffer-local-must-match-map "+" 'icicle-make-directory) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)))

(icicle-define-command icicle-remove-file-from-recentf-list "Remove file from `recentf-list' - the list of recently used files." icicle-remove-from-recentf-candidate-action "Remove from recent files list, `recentf-list': " (mapcar #'list (progn (unless (boundp 'recentf-list) (require 'recentf)) (when (fboundp 'recentf-mode) (recentf-mode 99)) (unless (consp recentf-list) (error "No recently accessed files")) recentf-list)) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'file-name-history (car recentf-list) nil ((icicle-use-candidates-only-once-flag t)))

(autoload 'icicle-locate-file "icicles-cmd1" "\
Visit a file within a directory or its subdirectories.
With a non-negative (>= 0) prefix argument, you are prompted for the
directory.  Otherwise, the current directory is used.

With a non-positive (<= 0) prefix argument, you can choose also by
date: Completion candidates include the last modification date.

The absolute names of all files within the directory and all of its
subdirectories are targets for completion.  Regexp input is matched
against all parts of the absolute name, not just the file-name part.

Remember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

You can use this command to find all files within your file system
that match a regexp, but be aware that gathering and matching the file
names will take some time.

See also command `icicle-locate-file-no-symlinks', which does the same
thing but without following symbolic links.

Remember that you can save the set of files matching your input using
`\\[icicle-candidate-set-save]' or `\\[icicle-candidate-set-save-persistently]'.  You can then retrieve quickly them later using
`\\[icicle-candidate-set-retrieve]' or `\\[icicle-candidate-set-retrieve-persistent]'.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c C-d' (think `cd') to change the `default-directory'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

Directories in `icicle-ignored-directories' are ignored (skipped).  In
addition, these options control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-require-match-flag' - See `icicle-require-match-flag'
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (> (nth 5 (file-attributes file)) 5000))

\(fn)" t nil)

(autoload 'icicle-locate-file-other-window "icicles-cmd1" "\
Same as `icicle-locate-file' except visit file in a different window.
See also command `icicle-locate-file-no-symlinks-other-window', which
does not follow symbolic links.

\(fn)" t nil)

(autoload 'icicle-locate-file-no-symlinks "icicles-cmd1" "\
`icicle-locate-file' except do not follow symlinks.

\(fn)" t nil)

(autoload 'icicle-locate-file-no-symlinks-other-window "icicles-cmd1" "\
`icicle-locate-file-no-symlinks' except visit file in different window.

\(fn)" t nil)

(icicle-define-command icicle-locate-file-1 "Helper function for `icicle-locate-file(-other-window)'." (lambda (f) (funcall icicle-locate-file-action-fn f)) prompt (mapcar (if (<= (prefix-numeric-value current-prefix-arg) 0) #'icicle-make-file+date-candidate #'list) icicle-abs-file-candidates) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'file-name-history nil nil (icicle-file-bindings ((prompt "File: ") (dir (if (and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg))) (read-file-name "Locate under which directory: " nil default-directory nil) default-directory)) (IGNORED--FOR-SIDE-EFFECT (progn (icicle-highlight-lighter) (message "Gathering files within `%s' (this could take a while)..." dir))) (icicle-abs-file-candidates (icicle-files-within (directory-files dir 'full icicle-re-no-dot) nil no-symlinks-p)) (use-dialog-box nil) (icicle-candidate-properties-alist (and (<= (prefix-numeric-value current-prefix-arg) 0) '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and (<= (prefix-numeric-value current-prefix-arg) 0) '(1))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") (mapcar #'icicle-transform-multi-completion files)))))))) (progn (when (<= (prefix-numeric-value current-prefix-arg) 0) (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory) (define-key minibuffer-local-completion-map "" 'icicle-cd-for-loc-files) (define-key minibuffer-local-must-match-map "" 'icicle-cd-for-loc-files) (define-key minibuffer-local-completion-map "+" 'icicle-make-directory) (define-key minibuffer-local-must-match-map "+" 'icicle-make-directory) (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window)) (define-key minibuffer-local-completion-map "m" 'icicle-bookmark-file-other-window) (define-key minibuffer-local-must-match-map "m" 'icicle-bookmark-file-other-window))) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "" nil) (define-key minibuffer-local-must-match-map "" nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) (define-key minibuffer-local-must-match-map [(control backspace)] nil) (define-key minibuffer-local-completion-map "" nil) (define-key minibuffer-local-must-match-map "" nil) (define-key minibuffer-local-completion-map "+" nil) (define-key minibuffer-local-must-match-map "+" nil) (define-key minibuffer-local-completion-map "m" nil) (define-key minibuffer-local-must-match-map "m" nil)) 'NON-INTERACTIVE)

(autoload 'icicle-cd-for-loc-files "icicles-cmd1" "\
Change `default-directory' during `icicle-locate-file'.
Optional arg NO-SYMLINKS-P non-nil means do not follow symbolic links.

\(fn DIR &optional NO-SYMLINKS-P)" t nil)

(icicle-define-command icicle-find-file-in-tags-table "Visit a file listed in a tags table.\nBy default, the completion candidates are the file names listed in the\ncurrent tags table, but you can substitute other candidates by\nretrieving a saved candidate set.  The default candidates appear as\nthey did in the `etags' command that created the tags table, which\ntypically means without directory names.\n\nCompletion here matches candidates as ordinary strings.  It knows\nnothing of file names per se.  In particular, you cannot use remote\nfile-name syntax.  If a candidate is an absolute file name then you\ncan complete against any and all parts of the name (including\ndirectory components).\n\n`find-file' is called for the candidate(s) you choose, with the\ndirectory of the tags file as `default-directory'.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-hiding-common-match]' to hide the common match portion of\neach candidate.  That can be particularly helpful for files that are\nin a common directory.\n\nWith a prefix argument, you can choose also by date: Completion\ncandidates include the last modification date.\n\nDuring completion:\n You can use `C-x m' to access file bookmarks, if you use library\n  `bookmark+.el'.\n You can use `M-|' to open Dired on the currently matching file names.\n You can use `S-delete' to delete a candidate file or (empty)\n  directory.\n\nThese options, when non-nil, control candidate matching and filtering:\n\n `icicle-file-extras'           - Extra file names to display\n `icicle-file-match-regexp'     - Regexp that file names must match\n `icicle-file-no-match-regexp'  - Regexp file names must not match\n `icicle-file-predicate'        - Predicate file names must satisfy\n `icicle-file-sort'             - Sort function for candidates\n\nFor example, to show only names of files larger than 5000 bytes, set\n`icicle-file-predicate' to:\n\n  (lambda (file) (> (nth 5 (file-attributes file)) 5000))\n\nOption `icicle-file-require-match-flag' can be used to override\noption `icicle-require-match-flag'.\n\nOption `icicle-files-ido-like' non-nil gives this command a more\nIdo-like behavior." (lambda (ff) (visit-tags-table-buffer 'same) (find-file (icicle-transform-multi-completion ff) 'WILDCARDS)) prompt (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list) (save-excursion (let ((enable-recursive-minibuffers t)) (visit-tags-table-buffer)) (tags-table-files))) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'file-name-history nil nil (icicle-file-bindings ((prompt "File (in tags table): ") (icicle-special-candidate-regexp (or icicle-special-candidate-regexp ".+/$")) (icicle-candidate-properties-alist (and current-prefix-arg '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and current-prefix-arg '(1))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))))) (progn (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (unless (require 'etags nil t) (error "`etags.el' is required"))))

(icicle-define-command icicle-find-file-in-tags-table-other-window "Visit a tags-table file in another window.\nSame as `icicle-find-file-in-tags-table', but uses a different window." (lambda (ff) (visit-tags-table-buffer 'same) (find-file (icicle-transform-multi-completion ff) 'WILDCARDS)) prompt (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list) (save-excursion (let ((enable-recursive-minibuffers t)) (visit-tags-table-buffer)) (tags-table-files))) nil (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) nil 'file-name-history nil nil (icicle-file-bindings ((prompt "File (in tags table): ") (icicle-special-candidate-regexp (or icicle-special-candidate-regexp ".+/$")) (icicle-candidate-properties-alist (and current-prefix-arg '((1 (face icicle-candidate-part))))) (icicle-list-use-nth-parts (and current-prefix-arg '(1))) (icicle-all-candidates-list-alt-action-fn (lambda (files) (let ((enable-recursive-minibuffers t)) (dired-other-window (cons (read-string "Dired buffer name: ") files))))))) (progn (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt)) (unless (require 'etags nil t) (error "`etags.el' is required"))))

;;;***

;;;### (autoloads (icicle-read-color icicle-object-action icicle-save-string-to-variable
;;;;;;  icicle-tags-search icicle-imenu icicle-compilation-search
;;;;;;  icicle-comint-search icicle-search-pages icicle-search-paragraphs
;;;;;;  icicle-search-sentences icicle-occur icicle-search-buff-menu-marked
;;;;;;  icicle-search-ibuffer-marked icicle-search-dired-marked icicle-search-file
;;;;;;  icicle-search-buffer icicle-search-bookmarks-together icicle-search-word
;;;;;;  icicle-search-highlight-cleanup icicle-search-text-property
;;;;;;  icicle-search-overlay-property icicle-search-char-property
;;;;;;  icicle-search-keywords icicle-search icicle-search-generic
;;;;;;  icicle-exchange-point-and-mark icicle-goto-global-marker
;;;;;;  icicle-goto-marker icicle-goto-global-marker-or-pop-global-mark
;;;;;;  icicle-goto-marker-or-set-mark-command icicle-apply icicle-apropos-zippy
;;;;;;  icicle-apropos icicle-non-whitespace-string-p icicle-complete-thesaurus-entry
;;;;;;  icicle-Info-goto-node icicle-Info-goto-node-cmd icicle-Info-menu-cmd
;;;;;;  icicle-Info-index-20 icicle-Info-index icicle-Info-index-cmd)
;;;;;;  "icicles-cmd2" "icicles-cmd2.el" (19991 46054))
;;; Generated autoloads from icicles-cmd2.el

(icicle-define-command icicle-font "Change font of current frame." (lambda (font) (modify-frame-parameters orig-frame (list (cons 'font font)))) "Font: " (let ((fonts nil) fws) (dolist (ft (x-list-fonts "*") fonts) (when (setq fws (icicle-font-w-orig-size ft)) (push fws fonts)))) nil t nil (if (boundp 'font-name-history) 'font-name-history 'icicle-font-name-history) nil nil ((orig-frame (selected-frame)) (orig-font (frame-parameter nil 'font)) (orig-pixelsize (aref (x-decompose-font-name orig-font) xlfd-regexp-pixelsize-subnum)) (orig-pointsize (aref (x-decompose-font-name orig-font) xlfd-regexp-pointsize-subnum)) (orig-menu-bar (assq 'menu-bar-lines (frame-parameters orig-frame)))) (modify-frame-parameters orig-frame (list '(menu-bar-lines . 0))) (modify-frame-parameters orig-frame (list (cons 'font orig-font) orig-menu-bar)) (modify-frame-parameters orig-frame (list orig-menu-bar)))

(icicle-define-command icicle-frame-bg "Change background of current frame.\nRead color name or hex RGB color value #RRRRGGGGBBBB with completion.\nIn addition to standard color names and RGB (red, green, blue) hex\nvalues, the following are also available as proxy color candidates,\nprovided `icicle-add-proxy-candidates-flag' is non-nil and library\n`palette.el' or `eyedropper.el' is used.  In each case, the\ncorresponding color is used.\n\n* `*copied foreground*'  - last copied foreground, if available\n* `*copied background*'  - last copied background, if available\n* `*point foreground*'   - foreground under the text cursor\n* `*point background*'   - background under the text cursor\n\n(You can copy a color using eyedropper commands such as\n`eyedrop-pick-foreground-at-mouse'.)\n\nIn addition, the names of user options (variables) whose custom type\nis `color' are also proxy candidates, but with `'' as a prefix and\nsuffix.  So, for example, option `icicle-region-background' appears as\nproxy color candidate `'icicle-region-background''.\n\nAs always, you can toggle the use of proxy candidates using `\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]' in\nthe minibuffer.\n\nYou can complete your input against the color name, the RGB value, or\nboth.\n\nNote: Duplicate color names are removed by downcasing and removing\nwhitespace.  For example, \"AliceBlue\" and \"alice blue\" are both\ntreated as \"aliceblue\".  Otherwise, candidates with different names\nbut the same RGB values are not considered duplicates, so, for\nexample, input can match either \"darkred\" or \"red4\", which both\nhave RGB #8b8b00000000.  You can toggle duplicate removal at any time\nusing `C-$'.\n\nDuring completion, candidate help (e.g. `C-M-RET') shows you the RGB\nand HSV (hue, saturation, value) color components.\n\nThis command is intended only for use in Icicle mode." (lambda (color) (modify-frame-parameters orig-frame (list (cons 'background-color (icicle-transform-multi-completion color))))) prompt named-colors nil t nil (if (boundp 'color-history) 'color-history 'icicle-color-history) nil nil ((orig-frame (selected-frame)) (orig-bg (frame-parameter nil 'background-color)) (prompt "Background color: ") (icicle-list-use-nth-parts '(2)) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "color"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "color"))) icicle-candidate-help-fn completion-ignore-case icicle-transform-function icicle-sort-orders-alist icicle-list-nth-parts-join-string icicle-list-join-string icicle-list-end-string icicle-proxy-candidate-regexp named-colors icicle-proxy-candidates) (icicle-color-completion-setup) (modify-frame-parameters orig-frame (list (cons 'background-color orig-bg))) nil)

(icicle-define-command icicle-frame-fg "Change foreground of current frame.\nSee `icicle-frame-bg' - but this is for foreground, not background." (lambda (color) (modify-frame-parameters orig-frame (list (cons 'foreground-color (icicle-transform-multi-completion color))))) prompt named-colors nil t nil (if (boundp 'color-history) 'color-history 'icicle-color-history) nil nil ((orig-frame (selected-frame)) (orig-bg (frame-parameter nil 'foreground-color)) (prompt "Foreground color: ") (icicle-list-use-nth-parts '(2)) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "color"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "color"))) icicle-candidate-help-fn completion-ignore-case icicle-transform-function icicle-sort-orders-alist icicle-list-nth-parts-join-string icicle-list-join-string icicle-list-end-string icicle-proxy-candidate-regexp named-colors icicle-proxy-candidates) (icicle-color-completion-setup) (modify-frame-parameters orig-frame (list (cons 'foreground-color orig-bg))) nil)

(autoload 'icicle-Info-index-cmd "icicles-cmd2" "\
If in Icicle mode, run `icicle-Info-index'; else, run `Info-index'.
Note: In Emacs versions prior to version 22, this runs `Info-index'.

\(fn)" t nil)

(autoload 'icicle-Info-index "icicles-cmd2" "\
Like `Info-index', but you can use Icicles keys `C-RET', `C-up' etc.

\(fn)" t nil)

(autoload 'icicle-Info-index-20 "icicles-cmd2" "\
Like `Info-index', but you can use completion for the index topic.

\(fn)" t nil)

(autoload 'icicle-Info-menu-cmd "icicles-cmd2" "\
In Icicle mode, run `icicle-Info-menu'; else, `Info-menu'.

\(fn)" t nil)

(autoload 'icicle-Info-goto-node-cmd "icicles-cmd2" "\
In Icicle mode, run `icicle-Info-goto-node'; else, `Info-goto-node'.

\(fn)" t nil)

(autoload 'icicle-Info-goto-node "icicles-cmd2" "\
Go to Info node named NODENAME.
NODENAME has the form NODE or (FILE)NODE-IN-FILE, where:
 NODE names a node in the current Info file or one of its subfiles.
 FILE names an Info file containing node NODE-IN-FILE.
Completion is available for node names in the current Info file.

With a prefix argument:

 * Plain `C-u' means prepend the current Info file name (manual name)
   to each node name.  For example: `(emacs)Paragraphs' instead of
   just `Paragraphs'.

 * A negative numeric prefix arg (e.g. `C--') means present completion
   candidates in book order, and limit the candidates to the current
   node and the rest of the book following it.  In this case, the
   first candidate is `..', which means go up.
   
 * A negative numeric prefix arg (e.g. `C-1') means show the target
   node in a new Info buffer (not available prior to Emacs 21).
   (This applies only to the final completion choice, not to
   intermediate candidate actions using, e.g., `C-RET'.)

In Lisp code, if optional argument ARG is a string, then show the node
in a new Info buffer named `*info-ARG*'.

With no prefix argument, or with a non-negative prefix arg, you can
use `C-,' to choose how to sort completion candidates.  By default,
they are sorted alphabetically.

Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Go to current completion candidate (node)
`C-down'  - Go to next completion candidate
`C-up'    - Go to previous completion candidate
`C-next'  - Go to next apropos-completion candidate
`C-prior' - Go to previous apropos-completion candidate
`C-end'   - Go to next prefix-completion candidate
`C-home'  - Go to previous prefix-completion candidate

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.

This is an Icicles command - see command `icicle-mode'.

\(fn NODENAME &optional ARG)" t nil)

(icicle-define-command icicle-insert-thesaurus-entry "Insert an entry from a thesaurus.\nLibrary `synonyms.el' is needed for this.  If you have never used\ncommand `synonyms' before, then the first use of\n`icicle-insert-thesaurus-entry' will take a while, because it will\nbuild a cache file of synonyms that are used for completion.  See\n`synonyms.el'.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-incremental-completion] to toggle incremental completion." icicle-insert-thesaurus-entry-cand-fn "Thesaurus entry to match: " synonyms-obarray nil nil nil 'icicle-dictionary-history nil nil ((icicle-track-pt (point))) (progn (unless (or (boundp 'synonyms-obarray) (require 'synonyms nil t)) (error "You must first load library `synonyms.el'")) (synonyms-ensure-synonyms-read-from-cache)) (when (window-live-p orig-window) (select-window orig-window) (select-frame-set-input-focus (selected-frame)) (goto-char icicle-track-pt)) (when (window-live-p orig-window) (select-window orig-window) (select-frame-set-input-focus (selected-frame)) (goto-char icicle-track-pt)))

(autoload 'icicle-complete-thesaurus-entry "icicles-cmd2" "\
Complete WORD to an entry from a thesaurus.
The default value of WORD is the word at the cursor.
Library `synonyms.el' is needed for this.  If you have never used
command `synonyms' before, then the first use of
`icicle-insert-thesaurus-entry' will take a while, because it will
build a cache file of synonyms that are used for completion.  See
`synonyms.el'.

\(fn WORD)" t nil)

(icicle-define-command icicle-where-is "Show keyboard/menu/mouse sequences that invoke specified command.\nThis is a multi-command version of `where-is'.\n\nWith no prefix argument, only commands actually bound to keys are\ncompletion candidates.  With a prefix argument, all commands are\ncandidates.  NOTE: This is a significant difference from vanilla\n`where-is', which shows all commands as candidates, even those that\nare not bound.\n\nWith a plain (non-numeric) prefix argument, `C-u', insert the message\nin the current buffer.  (This is the same for vanilla `where-is'.)\n\nBy default, Icicle mode remaps all key sequences that are normally\nbound to `where-is' to `icicle-where-is'.  If you do not want this\nremapping, then customize option `icicle-top-level-key-bindings'." (lambda (x) (let ((symb (intern-soft x))) (where-is symb (and pref-arg (consp pref-arg))))) (if pref-arg "Where is command: " "Where is bound command: ") obarray nil t nil nil (let ((fn (or (and (fboundp 'symbol-nearest-point) (symbol-nearest-point)) (function-called-at-point)))) (and fn (symbol-name fn))) t ((pref-arg current-prefix-arg) (icicle-must-pass-after-match-predicate (if pref-arg #'(lambda (c) (commandp (intern c))) #'(lambda (c) (setq c (intern c)) (with-current-buffer orig-buff (and (commandp c) (where-is-internal c overriding-local-map 'non-ascii)))))) (icicle-candidate-help-fn #'(lambda (c) (with-current-buffer orig-buff (let* ((keys (where-is-internal (intern-soft c) overriding-local-map)) (keys1 (mapconcat 'key-description keys ", "))) (message (if (string= "" keys1) (format "`%s' is not on any key" c) (format "`%s' is on `%s'" c keys1))) (sit-for 3))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "command"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "command")))))

(icicle-define-command icicle-describe-option-of-type "Describe a user option that was defined with a given `defcustom' type.\nEnter patterns for the OPTION name and TYPE definition in the\nminibuffer, separated by `icicle-list-join-string', which is \"^G^J\",\nby default.  (`^G' here means the Control-g character, input using\n`C-h C-g'.  Likewise, for `^J'.)\n\nOPTION is a regexp that is matched against option names.\n\nDepending on the prefix arg, TYPE is interpreted as either of these:\n\n - a regexp to match against the option type\n\n - a definition acceptable for `defcustom' :type, or its first symbol,\n   for example, (choice (integer) (regexp)) or `choice'\n\nIn the second case, depending on the prefix arg, TYPE can be matched\nagainst the option type, or it can be matched against either the\noption type or one of its subtypes.\n\nIn the second case also, depending on the prefix arg, if TYPE does not\nmatch some option's type, that option might still be a candidate, if\nits current value satisfies TYPE.\n\nIn sum, the prefix arg determines the type-matching behavior, as\nfollows:\n\n - None:      OPTION is defined with TYPE or a subtype of TYPE.\n              TYPE is a regexp.\n\n - `C-u':     OPTION is defined with TYPE or a subtype of TYPE,\n                or its current value is compatible with TYPE.\n              TYPE is a type definition or its first symbol.\n\n - Negative:  OPTION is defined with TYPE (exact match).\n              TYPE is a regexp.\n\n - Positive:  OPTION is defined with TYPE,\n                or its current value is compatible with TYPE.\n              TYPE is a type definition or its first symbol.\n\n - Zero:      OPTION is defined with TYPE or a subtype of TYPE.\n              TYPE is a type definition or its first symbol.\n\n - `C-u C-u': OPTION is defined with TYPE (exact match).\n              TYPE is a type definition or its first symbol.\n\nYou can change these prefix-arg key sequences by customizing option\n`icicle-option-type-prefix-arg-list'.  For example, if you tend to use\nthe matching defined here for `C-u', you might want to make that the\ndefault behavior (no prefix arg).  You can assign any of the six\nbehaviors to any of the prefix-arg keys.\n\nIf TYPE is nil, then *all* options that match OPTION are candidates.\n\nNote that options defined in libraries that have not been loaded can\nbe candidates, but their type will appear as nil, since it is not\nknown before loading the option definition.\n\nYou can match your input against the option name or the type\ndefinition or both.  Use `C-M-j' (equivalent here to `C-q C-g C-j') to\ninput the default separator.\n\nFor example, to match all Icicles options whose type matches `string'\n(according to the prefix arg), use `S-TAB' with this input:\n\nicicle.*^G\nstring$\n\nIf you instead want all Icicles options whose type definition contains\n`string', as in (repeat string), then use this:\n\nicicle.*^G\n[^^G]*string\n\nHere, `[^^G]' matches any character except ^G, which includes newline.\nIf you use `.'  here instead of `[^^G]', then only the first lines of\ntype definitions are searched for `string', because `.' matches any\ncharacter except a newline.  (The first `^' in `[^^G]' is a circumflex\ncharacter.  The second `^' is part of `^G', the printed representation\nof a Control-g character.)\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-incremental-completion] to toggle incremental completion." icicle-describe-opt-action prompt 'icicle-describe-opt-of-type-complete nil nil nil nil nil nil ((prompt "OPTION `C-M-j' TYPE (`RET' when done): ") (icicle-candidate-properties-alist '((1 (face icicle-candidate-part)))) (icicle-apropos-complete-match-fn nil) (icicle-candidate-help-fn 'icicle-describe-opt-action) (pref-arg current-prefix-arg)) (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) (icicle-highlight-lighter) (message "Gathering user options and their types...")))

(icicle-define-command icicle-vardoc "Choose a variable description.\nEach candidate for completion is a variable name plus its\ndocumentation.  They are separated by `icicle-list-join-string'\n(\"^G^J\", by default).  You can match an input regexp against the\nvariable name or the documentation or both.  Use `C-M-j' (equivalent\nhere to `C-q C-g C-j') to input the default separator.\n\nFor example, use input\n\n\"dired.*^G\n[^^G]*list\"\n\nwith `S-TAB' to match all variables whose names contain \"dired\" and\nwhose documentation contains \"list\".  Here, `[^^G]' matches any\ncharacter except ^G, which includes newline.  If you use `.*' here,\ninstead, then only the first lines of doc strings are searched.\n\nWith a non-negative prefix argument, use the same documentation that\nwas gathered the last time `icicle-vardoc' was called.  Use a\nnon-negative prefix arg to save the time that would be needed to\ngather the documentation.\n\nWith a non-positive prefix arg, use only user variables (options) as\ncandidates.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-incremental-completion] to toggle incremental completion." icicle-funvardoc-action prompt (let* ((num-arg (prefix-numeric-value pref-arg)) (options-only-p (<= num-arg 0)) (result (and pref-arg (>= num-arg 0) (if options-only-p icicle-vardoc-last-initial-option-cand-set icicle-vardoc-last-initial-cand-set)))) (unless result (mapatoms #'(lambda (symb) (when (and (boundp symb) (or (wholenump (prefix-numeric-value pref-arg)) (user-variable-p symb))) (let ((doc (documentation-property symb 'variable-documentation))) (when (icicle-non-whitespace-string-p doc) (push (list (list (symbol-name symb) doc)) result)))))) (if options-only-p (setq icicle-vardoc-last-initial-option-cand-set result) (setq icicle-vardoc-last-initial-cand-set result))) result) nil nil nil 'icicle-doc-history nil nil ((prompt "VAR `C-M-j' DOC (`RET' when done): ") (icicle-candidate-properties-alist '((1 (face icicle-candidate-part)))) (icicle-candidate-help-fn 'icicle-funvardoc-action) (pref-arg current-prefix-arg)) (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) (icicle-highlight-lighter) (message "Gathering variable descriptions...")))

(icicle-define-command icicle-fundoc "Choose a function description.\nEach candidate for completion is a function name plus its\ndocumentation.  They are separated by `icicle-list-join-string'\n(\"^G^J\", by default).  You can match an input regexp against the\nfunction name or the documentation or both.  Use `C-M-j' (equivalent\nhere to `C-q C-g C-j') to input the default separator.\n\nFor example, use input\n\n\"dired.*^G\n[^^G]*file\"\n\nwith `S-TAB' to match all functions whose names contain \"dired\" and\nwhose documentation contains \"file\".  Here, `[^^G]' matches any\ncharacter except ^G, which includes newline.  If you use `.*' here,\ninstead, then only the first lines of doc strings are searched.\n\nWith a prefix argument, use the same documentation that was gathered\nthe last time `icicle-fundoc' was called.  Use a prefix arg to save\nthe time that would be needed to gather the documentation.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-incremental-completion] to toggle incremental completion." icicle-funvardoc-action prompt (let ((result (and pref-arg icicle-fundoc-last-initial-cand-set))) (unless result (mapatoms #'(lambda (symb) (when (fboundp symb) (let ((doc (condition-case nil (documentation symb) (error nil)))) (when (and doc (icicle-non-whitespace-string-p (icicle-fn-doc-minus-sig doc))) (push (list (list (symbol-name symb) doc)) result)))))) (setq icicle-fundoc-last-initial-cand-set result)) result) nil nil nil 'icicle-doc-history nil nil ((prompt "FUNC `C-M-j' DOC (`RET' when done): ") (icicle-candidate-properties-alist '((1 (face icicle-candidate-part)))) (icicle-candidate-help-fn 'icicle-funvardoc-action) (pref-arg current-prefix-arg)) (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) (icicle-highlight-lighter) (message "Gathering function descriptions...")))

(icicle-define-command icicle-plist "Choose a symbol and its property list.\nEach candidate for completion is a symbol name plus its property list\n(as a string).  They are separated by `icicle-list-join-string'\n(^G^J, by default).  You can match an input regexp against the symbol\nname or the property list or both.  Use `C-M-j' (equivalent here to\n`C-q C-g C-j') to input the default separator.\n\nWith a positive prefix argument, use the same initial set of\ncandidates that were gathered the last time `icicle-plist' was called.\nUse a positive prefix arg to save the time that would be needed to\ngather the plists.\n\nWith a negative prefix arg, do not pretty-print each property list, in\nbuffers `*Help* and `*Completions*'.  Generation of the complete set\nof candidates is about twice as fast when not pretty-printed, but the\ntime to match your input and display candidates is the same, and the\nmatch-and-display time for empty input,is much longer than the\ngeneration time.\n\nThe time to repeat (positive prefix arg) is the same, whether or not\ncandidates were pretty-printed the first time.\n\nNote: Plists are never pretty-printed for Emacs 20, because that seems\nto cause an Emacs crash.\n\nRemember that you can use `\\<minibuffer-local-completion-map>\\[icicle-toggle-incremental-completion] to toggle incremental completion." icicle-funvardoc-action prompt (let ((result (and pref-arg (wholenump (prefix-numeric-value pref-arg)) icicle-plist-last-initial-cand-set))) (unless result (mapatoms #'(lambda (symb) (condition-case nil (let ((plist (symbol-plist symb))) (when plist (push (list (list (symbol-name symb) (if (or (< (prefix-numeric-value pref-arg) 0) (< emacs-major-version 21)) (format "%s" plist) (pp-to-string plist)))) result))) (error nil)))) (setq icicle-plist-last-initial-cand-set result)) result) nil nil nil nil nil nil ((prompt "SYMB `C-M-j' PLIST (`RET' when done): ") (icicle-candidate-properties-alist '((1 (face icicle-candidate-part)))) (pref-arg current-prefix-arg)) (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) (icicle-highlight-lighter) (message "Gathering property lists...")))

(icicle-define-command icicle-doc "Choose documentation for a symbol.\nEach candidate for completion is the description of a function,\nvariable, or face.  Displays the documentation and returns the symbol.\n\nEach candidate for completion is a symbol name plus its type\n(FUNCTION, VARIABLE, or FACE) and its documentation.  These candidate\ncomponents are separated by `icicle-list-join-string' (\"^G^J\", by\ndefault).  You can match an input regexp against the symbol name,\ntype, or the documentation or any combination of the three.  Use\n`C-M-j' (equivalent here to `C-q C-g C-j') to input the default\nseparator.\n\nWith a prefix argument, use the same documentation that was gathered\nthe last time `icicle-doc' was called.  Use a prefix arg to save the\ntime that would be needed to gather the documentation.\n\nRemember that you can use \\<minibuffer-local-completion-map>`\\[icicle-toggle-incremental-completion]' to toggle incremental completion." icicle-doc-action prompt (let ((result (and pref-arg icicle-doc-last-initial-cand-set)) doc) (unless result (mapatoms #'(lambda (symb) (progn (when (and (functionp symb) (setq doc (condition-case nil (documentation symb) (error nil))) (setq doc (icicle-fn-doc-minus-sig doc)) (icicle-non-whitespace-string-p doc) (setq doc (concat doc "\n\n"))) (push (cons (list (concat (symbol-name symb) icicle-list-join-string "FUNCTION") doc) symb) result)) (when (and (boundp symb) (setq doc (documentation-property symb 'variable-documentation)) (icicle-non-whitespace-string-p doc)) (when (and nil (fboundp 'describe-keymap) (keymapp (symbol-value symb))) (setq doc (concat (symbol-name symb) ":\n" doc "\n\n" (substitute-command-keys (concat "\\{" (symbol-name symb) "}")) "\n\n"))) (setq doc (concat doc "\n\n")) (push (cons (list (concat (symbol-name symb) icicle-list-join-string "VARIABLE") doc) symb) result)) (when (and (facep symb) (setq doc (documentation-property symb 'face-documentation))) (push (cons (list (concat (symbol-name symb) icicle-list-join-string "FACE") doc) symb) result))))) (setq icicle-doc-last-initial-cand-set result)) result) nil nil nil 'icicle-doc-history nil nil ((prompt "Find doc with regexp: ") (icicle-candidate-properties-alist '((1 (face icicle-candidate-part)))) (icicle-list-use-nth-parts '(1)) (icicle-transform-function 'icicle-remove-duplicates) (icicle-candidate-help-fn 'icicle-doc-action) (pref-arg current-prefix-arg)) (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) (icicle-highlight-lighter) (message "Gathering documentation...")))

(autoload 'icicle-non-whitespace-string-p "icicles-cmd2" "\
Return non-nil if STRING contains a non-whitespace character.
The `standard-syntax-table' definition of whitespace is used.

\(fn STRING)" t nil)

(autoload 'icicle-apropos "icicles-cmd2" "\
Like `apropos', but lets you see the list of matches (with `S-TAB').
Function names are highlighted using face `icicle-special-candidate'.

\(fn APROPOS-REGEXP &optional DO-ALL)" t nil)

(cond ((fboundp 'apropos-option) (defun icicle-apropos-variable (pattern) "Show variables that match PATTERN.\nThis includes variables that are not user options.\nUser options are highlighted using face `icicle-special-candidate'.\nYou can see the list of matches with `S-TAB'.\nSee `apropos-variable' for a description of PATTERN." (interactive (list (unwind-protect (progn (mapatoms #'(lambda (symb) (when (user-variable-p symb) (put symb 'icicle-special-candidate t)))) (let ((icicle-fancy-candidates-p t) (icicle-must-pass-after-match-predicate #'(lambda (s) (setq s (intern s)) (and (boundp s) (get s 'variable-documentation)))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "variable"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "variable")))) (completing-read (concat "Apropos variable (regexp" (and (>= emacs-major-version 22) " or words") "): ") obarray nil nil nil 'regexp-history))) (mapatoms #'(lambda (symb) (put symb 'icicle-special-candidate nil)))))) (apropos-variable pattern)) (defun icicle-apropos-option (pattern) "Show user options (variables) that match PATTERN.\nYou can see the list of matches with `S-TAB'.\nSee `apropos-option' for a description of PATTERN." (interactive (let ((icicle-must-pass-after-match-predicate #'(lambda (s) (user-variable-p (intern s))))) (list (completing-read (concat "Apropos user option (regexp" (and (>= emacs-major-version 22) " or words") "): ") obarray nil nil nil 'regexp-history)))) (let ((apropos-do-all nil) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "option"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "option")))) (apropos-option pattern))) (defun icicle-apropos-function (pattern) "Show functions that match PATTERN.\nThis includes functions that are not commands.\nCommand names are highlighted using face `icicle-special-candidate'.\nYou can see the list of matches with `S-TAB'.\nSee `apropos-function' for a description of PATTERN." (interactive (list (unwind-protect (progn (mapatoms #'(lambda (symb) (when (commandp symb) (put symb 'icicle-special-candidate t)))) (let ((icicle-fancy-candidates-p t) (icicle-must-pass-after-match-predicate #'(lambda (s) (fboundp (intern s)))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "function"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "function")))) (completing-read (concat "Apropos function (regexp" (and (>= emacs-major-version 22) " or words") "): ") obarray nil nil nil 'regexp-history))) (mapatoms #'(lambda (symb) (put symb 'icicle-special-candidate nil)))))) (apropos-function pattern)) (defun icicle-apropos-command (pattern) "Show commands (interactively callable functions) that match PATTERN.\nYou can see the list of matches with `S-TAB'.\nSee `apropos-command' for a description of PATTERN." (interactive (let ((icicle-must-pass-after-match-predicate #'(lambda (s) (commandp (intern s)))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "command"))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "command")))) (list (completing-read (concat "Apropos command (regexp" (and (>= emacs-major-version 22) " or words") "): ") obarray nil nil nil 'regexp-history)))) (let ((apropos-do-all nil)) (apropos-command pattern)))) (t (defun icicle-apropos-variable (pattern &optional do-all) "Show variables that match PATTERN.\nYou can see the list of matches with `S-TAB'.\nSee `apropos-variable' for a description of PATTERN.\n\nBy default, only user options are candidates.  With optional prefix\nDO-ALL, or if `apropos-do-all' is non-nil, all variables are\ncandidates.  In that case, the user-option candidates are highlighted\nusing face `icicle-special-candidate'." (interactive (list (unwind-protect (progn (unless (or (boundp 'apropos-do-all) (require 'apropos nil t)) (error "Library `apropos' not found")) (when (or current-prefix-arg apropos-do-all) (mapatoms #'(lambda (symb) (when (user-variable-p symb) (put symb 'icicle-special-candidate t))))) (let ((icicle-fancy-candidates-p (or current-prefix-arg apropos-do-all)) (icicle-must-pass-after-match-predicate (if (or current-prefix-arg apropos-do-all) #'(lambda (s) (setq s (intern s)) (and (boundp s) (get s 'variable-documentation))) #'(lambda (s) (user-variable-p (intern s))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type (if icicle-fancy-candidates-p "variable" "option")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type (if icicle-fancy-candidates-p "variable" "option"))))) (completing-read (concat "Apropos " (if (or current-prefix-arg apropos-do-all) "variable" "user option") " (regexp" (and (>= emacs-major-version 22) " or words") "): ") obarray nil nil nil 'regexp-history))) (when (or current-prefix-arg apropos-do-all) (mapatoms #'(lambda (symb) (put symb 'icicle-special-candidate nil))))) current-prefix-arg)) (apropos-variable pattern do-all)) (defun icicle-apropos-command (pattern &optional do-all var-predicate) "Show commands (interactively callable functions) that match PATTERN.\nYou can see the list of matches with `S-TAB'.\n\nSee `apropos-command' for a description of PATTERN.\n\nWith \\[universal-argument] prefix, or if `apropos-do-all' is non-nil,\nalso show noninteractive functions.  In that case, the command\ncandidates are highlighted using face `icicle-special-candidate'.\n\nIf VAR-PREDICATE is non-nil, show only variables, and only those that\nsatisfy the predicate VAR-PREDICATE." (interactive (list (unwind-protect (progn (unless (boundp 'apropos-do-all) (unless (require 'apropos nil t) (error "Library `apropos' not found"))) (when (or current-prefix-arg apropos-do-all) (mapatoms #'(lambda (symb) (when (commandp symb) (put symb 'icicle-special-candidate t))))) (let ((icicle-fancy-candidates-p (or current-prefix-arg apropos-do-all)) (icicle-must-pass-after-match-predicate (if current-prefix-arg #'(lambda (s) (fboundp (intern s))) #'(lambda (s) (commandp (intern s))))) (icicle-candidate-alt-action-fn (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type (if icicle-fancy-candidates-p "function" "command")))) (icicle-all-candidates-list-alt-action-fn (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type (if icicle-fancy-candidates-p "function" "command"))))) (completing-read (concat "Apropos " (if (or current-prefix-arg apropos-do-all) "command or function" "command") "(regexp" (and (>= emacs-major-version 22) " or words") "): ") obarray nil nil nil 'regexp-history))) (when (or current-prefix-arg apropos-do-all) (mapatoms #'(lambda (symb) (put symb 'icicle-special-candidate nil))))) current-prefix-arg)) (apropos-command pattern do-all var-predicate))))

(autoload 'icicle-apropos-zippy "icicles-cmd2" "\
Show all Zippy quotes matching the regular-expression input REGEXP.
Return the list of matches.

\(fn REGEXP)" t nil)

(autoload 'icicle-apply "icicles-cmd2" "\
Selectively apply a function to elements in an alist.
Argument ALIST is an alist such as can be used as the COLLECTION
argument for Icicles `completing-read'.  Its elements can represent
multi-completions, for example.  Interactively, COLLECTION is a
variable (a symbol) whose value is an alist.

Argument FN is a function.

Optional argument NOMSG non-nil means do not display an informative
message each time FN is applied.  If nil, then a message shows the key
of the alist element that FN is applied to and the result of the
application.

The remaining arguments are optional.  They are the arguments
PREDICATE, INITIAL-INPUT, HIST, DEF, and INHERIT-INPUT-METHOD for
`completing-read' (that is, all of the `completing-read' args other
than PROMPT, COLLECTION, and REQUIRE-MATCH).  During `icicle-apply'
completion, a match is required (REQUIRE-MATCH is t).

Interactively, you are prompted for both arguments.  Completion is
available for each.  The completion list for ALIST candidates is the
set of variables whose value is a cons.  With no prefix argument, the
names of these variables must end with \"alist\".  With a prefix
argument, the first car of each variable value must itself be a cons.

After choosing the ALIST and FN, you are prompted to choose one or
more keys of the alist elements, and FN is applied to each element
that has a key that you choose.  Multi-command completion is available
for choosing these candidates: you can apply FN to any number of
elements, any number of times.

Examples: If ALIST is `auto-mode-alist' and FN is `cdr', then the
completion candidates are the keys of the alist, and the result of
applying FN to an alist element is simply the value of that key.  If
you choose, for example, candidate \"\\.el\\'\", then the result is
`cdr' applied to the alist element (\"\\.el\\'\" . emacs-lisp-mode),
which is the symbol `emacs-lisp-mode'.  In this case, the function
performs simple lookup.

If FN were instead (lambda (x) (describe-function (cdr x))), then the
result of choosing candidate \"\\.el\\'\" would be to display the help
for function `emacs-lisp-mode'.

NOTE: `icicle-apply' does not, by itself, impose any particular sort
order.  Neither does it inhibit sorting.  If you call this function
from Lisp code and you want it to use a certain sort order or you want
no sorting, then bind `icicle-sort-comparer' accordingly.

During completion you can use multi-command keys.  Each displays the
value of applying FN to an alist element whose key is a completion
candidate.

`C-RET'   - Act on current completion candidate only
`C-down'  - Move to next completion candidate and act
`C-up'    - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`C-!'     - Act on *each* candidate (or each that is saved), in turn.
`M-!'     - Act on the list of *all* candidates (or all saved).

Note that `M-!' applies FN to the *list* of chosen alist elements,
whereas `C-!' applies FN to each chosen element, in turn.  For
example, if FN is `length' and your input is `.el', then `M-!' displays
the result of applying `length' to the list of chosen elements:

 ((\"\\.el\\'\" . emacs-lisp-mode) (\"\\.elc'\" . emacs-lisp-mode))

which is 2.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.  This is an Icicles command - see command
`icicle-mode'.

`icicle-apply' overrides `icicle-ignore-space-prefix-flag', binding it
to nil so that candidates with initial spaces can be matched.

\(fn ALIST FN &optional NOMSG PREDICATE INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" t nil)

(autoload 'icicle-goto-marker-or-set-mark-command "icicles-cmd2" "\
With prefix arg < 0, `icicle-goto-marker'; else `set-mark-command'.
By default, Icicle mode remaps all key sequences that are normally
bound to `set-mark-command' to
`icicle-goto-marker-or-set-mark-command'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(autoload 'icicle-goto-global-marker-or-pop-global-mark "icicles-cmd2" "\
With prefix arg < 0, `icicle-goto-global-marker'; else `pop-global-mark'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-global-mark' to
`icicle-goto-global-marker-or-pop-global-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn ARG)" t nil)

(autoload 'icicle-goto-marker "icicles-cmd2" "\
Go to a marker in this buffer, choosing it by the line that includes it.
If `crosshairs.el' is loaded, then the target position is highlighted.

By default, candidates are sorted in marker order, that is, with
respect to their buffer positions.  Use `C-M-,' or `C-,' to change the
sort order.

During completion you can use these keys:

`C-RET'   - Goto marker named by current completion candidate
`C-down'  - Goto marker named by next completion candidate
`C-up'    - Goto marker named by previous completion candidate
`C-next'  - Goto marker named by next apropos-completion candidate
`C-prior' - Goto marker named by previous apropos-completion candidate
`C-end'   - Goto marker named by next prefix-completion candidate
`C-home'  - Goto marker named by previous prefix-completion candidate
`S-delete' - Delete marker named by current completion candidate

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to choose a candidate as the final
destination, or `C-g' to quit.  This is an Icicles command - see
command `icicle-mode'.

\(fn)" t nil)

(autoload 'icicle-goto-global-marker "icicles-cmd2" "\
Like `icicle-goto-marker', but visits global, not local, markers.
If user option `icicle-show-multi-completion-flag' is non-nil, then
each completion candidate is annotated (prefixed) with the name of the
marker's buffer, to facilitate orientation.

\(fn)" t nil)

(autoload 'icicle-exchange-point-and-mark "icicles-cmd2" "\
`exchange-point-and-mark' or save a region or select a saved region.
With no prefix arg, invoke `exchange-point-and-mark'.
If you use library `bookmark+.el', then you can use a prefix arg.

 * Plain `C-u': select (activate) one or more bookmarked regions.

 * Numeric prefix arg: bookmark (save) the active region using
   `icicle-bookmark-cmd'.

   Arg < 0: Prompt for the bookmark name.
   Arg > 0: Do not prompt for the bookmark name.  Use the buffer name
            plus a prefix of the region text as the bookmark name.
   Arg = 0: Same as > 0, except do not overwrite any existing bookmark
            with the same name.

By default, Icicle mode remaps all key sequences that are normally
bound to `exchange-point-and-mark' to
`icicle-exchange-point-and-mark'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.

\(fn &optional ARG)" t nil)

(autoload 'icicle-search-generic "icicles-cmd2" "\
Run `icicle-search-command'.  By default, this is `icicle-search'.
In Compilation and Grep modes, this is `icicle-compilation-search'.
In Comint, Shell, GUD, and Inferior Lisp modes, this is
   `icicle-comint-search'.

\(fn)" t nil)

(autoload 'icicle-search "icicles-cmd2" "\
Search for matches, with completion, cycling, and hit replacement.
Interactively, search for regexp matches.  You are prompted for a
regexp, which you enter using `RET'.  The search hits (matches) are
available as completion candidates.  You can then use apropos
completion to filter the candidates using a different regexp, which
you can change dynamically (as always).  You can replace individual
matches with another string, as in `query-replace' or
`query-replace-regexp'.  By default, candidates appear in order of
buffer occurrence, but you can sort them in various ways.

Non-interactively, search can be for regexp matches or any other kind
of matches.  Argument SCAN-FN-OR-REGEXP is the regexp to match, or it
is a function that defines an alist of buffer zones to search.  You
can navigate among the matching buffer zones (defined either as regexp
matches or via function), called search \"contexts\", and you can
match another regexp against the text in a search context.  See the
end of this description for information about the other arguments.

If the search-context regexp contains regexp subgroups, that is,
subexpressions of the form `(...)', then you are prompted for the
subgroup to use to define the search contexts.  Subgroup 0 means the
context is whatever matches the whole regexp.  Subgroup 1 means the
context is whatever matches the first subgroup, and so on.  The
subgroup number is the number of occurrences of `(', starting at the
beginning of the regexp.

Search respects `icicle-regexp-quote-flag' and
`icicle-search-whole-word-flag'.  You can toggle these during search,
by using `C-`' and `M-q', respectively.  If `icicle-regexp-quote-flag'
is non-nil, then regexp special characters are quoted, so that they
become non-special.  If `icicle-search-whole-word-flag' is non-nil,
then whole-word searching is done.  During word search, all characters
in the search string you type are treated as if they were word
constituents: the search string is matched literally, but only at word
boundaries.  (You can also use `\\[icicle-search-word]' to perform
word search.)


Optional Behaviors: Prefix Argument
-----------------------------------

By default, search only the current buffer.  Search the active region,
or, if there is none, then search the entire buffer.

With a prefix argument, you can search multiple buffers, files, or
bookmarks, as follows:

- With a plain prefix arg (`C-u'), search bookmarks.  This is the
same as command `icicle-search-bookmarks-together'.  (To search
bookmarks one at a time instead of together, use multi-command
`icicle-search-bookmark'.)

- With a non-negative numeric prefix arg, search multiple buffers
completely.  You are prompted for the buffers to search - all of each
buffer is searched.  Any existing buffers can be chosen.  If the
prefix arg is 99, then only buffers visiting files are candidates.
This is the same as command `icicle-search-buffer'.

- With a negative numeric prefix arg, search multiple files
completely.  You are prompted for the files to search - all of each
file is searched.  Any existing files in the current directory can be
chosen.  This is the same as command `icicle-search-file'.


Navigation and Help
-------------------

The use of completion for this command is special.  It is not unusual
in this context to have multiple completion candidates that are
identical - only the positions of their occurrences in the search
buffer(s) differ.  In that case, you cannot choose one simply by
completing it in the minibuffer, because the destination would be
ambiguous.  That is, simply completing your input and entering the
completion with `RET' will not take you to its occurrence in the
search buffer, unless it is unique.

Instead, choose search hits to visit using any of the candidate-action
keys: `C-RET', `C-mouse-2', `C-down', `C-up', `C-next', `C-prior',
`C-end', and `C-home'.  All but the first two of these cycle among the
search hits.  The current candidate in *Completions* corresponds to
the current location visited (it is not off by one, as is usually the
case in Icicles).

As always, the `C-M-' keys provide help on individual candidates:
`C-M-RET', `C-M-mouse-2', `C-M-down', `C-M-up', `C-M-next',
`C-M-prior', `C-M-end', and `C-M-home'.  For `icicle-search', they
indicate the buffer and position of the search hit.

You can cycle among candidates without moving to their occurrences in
the search buffer, using `down', `up', `next', `prior', `end', or
`home' (no `C-' modifier).


Highlighting
------------

In the search buffer (that is, where the hits are), `icicle-search'
does the following:

- Highlights the current match (buffer zone) for the initial (context)
  regexp, using face `icicle-search-main-regexp-current'.

- Highlights the first `icicle-search-highlight-threshold' context
  matches, using face `icicle-search-main-regexp-others'.

- Highlights 1-8 context levels, within each search context.  This
  happens only if your initial (context) regexp has \\(...\\) groups
  and option `icicle-search-highlight-context-levels-flag' is non-nil.

- Highlights the match for your current input, using face
  `icicle-search-current-input'.  Highlights all such matches if
  option `icicle-search-highlight-all-current-flag' is non-nil;
  otherwise, highlights just the currently visited match.
  You can toggle this option using `C-^'.

If user option `icicle-search-cleanup-flag' is non-nil (the default),
then all search highlighting is removed from the search buffer when
you are finished searching.  If it is nil, then you can remove this
highlighting later using command `icicle-search-highlight-cleanup'.
You can toggle `icicle-search-cleanup-flag' during Icicles search
using `C-.'  in the minibuffer.


Search and Replace
------------------

You can replace the current search match by using any of the
alternative action keys: `C-S-RET', `C-S-mouse-2' (in *Completions*),
`C-S-down', `C-S-up', `C-S-next', `C-S-prior', `C-S-end', and
`C-S-home'.  You can use `M-|' to replace all matches at once.  (And
remember that you can activate the region to limit the
search-and-replace space.)


At the first use of any of these, you are prompted for the replacement
string; it is used thereafter, or until you use `M-,'
\(`icicle-search-define-replacement') to change it (anytime).

Unlike `query-replace', you need not visit search matches successively
or exhaustively.  You can visit and replace selected matches in any
order.

What is meant here by a \"search match\"?  It can be either an entire
search context or just a part of the context that your current
minibuffer input matches.

`C-,' toggles option `icicle-search-replace-whole-candidate-flag'.  By
default, the entire current search context is replaced, that is,
whatever matches the context regexp that you entered initially using
`RET'.  However, you can use `C-,' anytime during searching to toggle
between this default behavior and replacement of whatever your current
minibuffer input matches.

Remember this:

 - If `icicle-search-replace-whole-candidate-flag' is non-nil, then
   the granularity of replacement is a complete search context.  In
   this case, replacement behaves similarly to `query-replace-regexp'.
   You can still use minibuffer input to filter the set of search
   contexts, but replacement is on a whole-context basis.

 - If `icicle-search-replace-whole-candidate-flag' is nil, then you
   can replace multiple input matches separately within a search
   context (using `C-S-RET').  This behavior is unique to Icicles.
   You cannot, however skip over one input match and replace the next
   one in the same context - `C-S-RET' always replaces the first
   available match.

If `icicle-search-replace-whole-candidate-flag' is non-nil, then you
can use the navigational alternative action keys, `C-S-down',
`C-S-up', `C-S-next', `C-S-prior', `C-S-end', and `C-S-home',
repeatedly to replace successive search contexts.  At the buffer
limits, these commands wraps around to the other buffer limit (last
search context to first, and vice versa).

Search traversal using these go-to-next-context-and-replace keys is
always by search context, not by individual input match.  This means
that you cannot use these keys to replace input matches within a
search context (except for the first such match, if
`icicle-search-replace-whole-candidate-flag' is nil).

If your input matches multiple parts of a search context, and you want
to replace these in order, then use `C-S-RET' repeatedly.  You can
traverse all matches of your input in the order they appear in the
buffer by repeating `C-S-RET' (provided the replacement text does not
also match your input - see below).  At the buffer limits, repeating
`C-S-RET' wraps around too.

`C-S-RET' always replaces the first input match in the current search
context or, if there are no matches, then the first input match in the
next context.  This behavior has these important consequences:

* If you repeat `C-S-RET' and the previous replacement no longer
  matches your input, then `C-S-RET' moves on to the next input match
  (which is now the first one) and replaces that.  This is why you can
  usually just repeat `C-S-RET' to successively replaces matches of
  your input, including from one context to the next.

* If, on the other hand, after replacement the text still matches your
  input, then repeating `C-S-RET' will just replace that match.
  For example, if you replace the input match `ab' by `abcd', then
  repeating `C-S-RET' produces `abcd', then `abcdcd', then `abcdcd'...

* You cannot replace an input match, skip the next match, and then
  replace the following one, all in the same context.  You can,
  however, replace some matches and then skip (e.g. `C-next') to the
  next context.

What your input matches, hence what gets replaced if
`icicle-search-replace-whole-candidate-flag' is nil, depends on a few
Icicles options:

 - `icicle-regexp-quote-flag' determines whether to use regexp
   matching or literal matching.

 - `icicle-search-highlight-all-current-flag',
   `icicle-expand-input-to-common-match-flag' and
   `icicle-search-replace-common-match-flag' together determine
   whether to replace exactly what your input matches in the current
   search hit or the expanded common match (ECM) of your input among
   all search hits.  If any of these options is nil, then your exact
   input match is replaced; if they are all non-nil, then the ECM is
   replaced.

Finally, the replacement string can be nearly anything that is allowed
as a replacement by `query-replace-regexp'.  In Emacs 22 or later,
this includes Lisp sexp evaluation via `,' and constructs such as
`#' and `N' (back references).  You can also use `?', but it is not
very useful - you might as well use `M-,' instead, to change the
replacement text.


Using Regexps
-------------

At any time, you can use `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]' (command
`icicle-insert-string-from-variable') to insert text (e.g. a regexp)
from a variable into the minibuffer.  For example, you can search for
ends of sentences by using `C-u \\[icicle-insert-string-from-variable]' and choosing variable
`sentence-end' as the variable.  And you can use
`\\[icicle-save-string-to-variable]' to save a string to a variable
for later use by `\\[icicle-insert-string-from-variable]'.

When employed with useful regexps, `C-=' can turn `icicle-search' into
a general navigator or browser of code, mail messages, and many other
types of buffer.  Imenu regexps work fine, for example - command
`icicle-imenu' simply uses `icicle-search' this way.  See
`icicle-insert-string-from-variable' for more tips on inserting
regexps from variables.


Additional Information
----------------------

If user option `icicle-show-multi-completion-flag' is non-nil, then
each candidate is annotated with the name of the buffer where the
search hit occurs, to facilitate orientation.  Note that even when the
value is nil, you can use `C-M-mouse-2' and so on to see the buffer
name, as well as the position of the hit in the buffer.

Completion is lax if `icicle-show-multi-completion-flag' is non-nil;
otherwise, it is strict.

After you visit a completion candidate, the hooks in variable
`icicle-search-hook' are run.

`icicle-search' overrides `icicle-ignore-space-prefix-flag', binding
it to nil, so that candidates with initial spaces can be matched.

`icicle-search' sets `icicle-search-final-choice' to the final user
choice, which might not be one of the search candidates if
REQUIRE-MATCH is nil.


Non-Interactive Use
-------------------

Function `icicle-search' is not only a powerful command, it is also a
building block for creating your own Icicles search-and-replace
commands.  When called non-interactively, these are the
`icicle-search' arguments:

BEG is the beginning of the region to search; END is the end.
SCAN-FN-OR-REGEXP: Regexp or function that determines the set of
  initial candidates (match zones).  If a function, it is passed, as
  arguments, the buffer to search, the beginning and end of the search
  region in that buffer, and ARGS.
REQUIRE-MATCH is passed to `completing-read'.
Optional arg WHERE is a list of bookmarks, buffers, or files to be
  searched.  If nil, then search only the current buffer or region.
  (To search bookmarks you must also use library `bookmark+.el').
ARGS are arguments that are passed to function SCAN-FN-OR-REGEXP.

Note that if SCAN-FN-OR-REGEXP is a regexp string, then function
`icicle-search-regexp-scan' is used to determine the set of match
zones.  You can limit hits to regexp matches that also satisfy a
predicate, by using `(PREDICATE)' as ARGS: PREDICATE is then passed to
`icicle-search-regexp-scan' as its PREDICATE argument.

This command is intended for use only in Icicle mode.

\(fn BEG END SCAN-FN-OR-REGEXP REQUIRE-MATCH &optional WHERE &rest ARGS)" t nil)

(autoload 'icicle-search-keywords "icicles-cmd2" "\
Search with one or more keywords, which can each be a regexp.
Text that matches *any* of the keywords is found.

You can use completion to choose one or more previously entered
regexps (using `C-RET', `C-mouse-2', `C-next', and so on), or you can
enter new keywords (using `C-RET').  Use `RET' or `mouse-2' to choose
the last keyword.

Keywords are interpreted as regexps.  You can change to substring
completion instead, matching regexp special characters literally, by
using `C-`' during completion to toggle `icicle-regexp-quote-flag'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the `icicle-search'
documentation.

\(fn BEG END KEYWORDS REQUIRE-MATCH &optional WHERE &rest ARGS)" t nil)

(icicle-define-command icicle-keyword-list "Choose a list of keywords. The list of keywords (strings) is returned.\nYou can choose from keywords entered previously or enter new keywords\nusing `C-RET'.  Each keyword is a regexp.  The regexps are OR'd, and\nthe resulting regexp is usable for `icicle-search'." (lambda (name) (push name keywords) (message "Added keyword `%s'" name)) "Choose keyword (regexp) (`RET' when done): " (mapcar #'list (icicle-remove-duplicates regexp-history)) nil nil nil 'regexp-history nil nil ((keywords nil) (icicle-use-candidates-only-once-flag t)) nil nil (prog1 (setq keywords (nreverse (delete "" keywords))) (when (interactive-p) (message "Keywords (regexps): %S" keywords))))

(icicle-define-command icicle-search-bookmark "Search bookmarked text.\nIf you use library `bookmark+.el', and a bookmark specifies a nonempty\nregion, then search only the text in that region.\n\nSee also `icicle-search-bookmarks-together', which searches bookmarks\ntogether instead of one at a time.\n\n1. Enter a context regexp, to define the possible search-hit contexts.\n2. Choose a bookmark using completion.  It is opened.\n3. (Optional) Type some text to be matched in the search contexts.\n4. Navigate to matches (search hits) using `C-next' etc.\n5. Finish with that bookmark using `RET' (stay) or `C-g' (skip).\n6. (Optional) Repeat steps 2-5 for other bookmarks." icicle-search-bookmark-action prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history) (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil ((enable-recursive-minibuffers t) (completion-ignore-case bookmark-completion-ignore-case) (prompt "Search bookmark: ") (regexp (icicle-search-read-context-regexp)) (icicle-list-use-nth-parts '(1)) (icicle-candidate-properties-alist (if (not icicle-show-multi-completion-flag) nil (if (facep 'file-name-shadow) '((2 (face file-name-shadow)) (3 (face bookmark-menu-heading))) '((3 (face bookmark-menu-heading)))))) (icicle-transform-function (if (interactive-p) nil icicle-transform-function)) (icicle-whole-candidate-as-text-prop-p t) (icicle-transform-before-sort-p t) (icicle-delete-candidate-object 'icicle-bookmark-delete-action) (bookmark-automatically-show-annotations nil) (icicle-sort-orders-alist (append '(("in *Bookmark List* order") ("by bookmark name" . icicle-alpha-p)) (and (featurep 'bookmark+) '(("by last bookmark access" (bmkp-bookmark-last-access-cp) icicle-alpha-p) ("by bookmark visit frequency" (bmkp-visited-more-cp) icicle-alpha-p) ("by last buffer or file access" (bmkp-buffer-last-access-cp bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("marked before unmarked (in *Bookmark List*)" (bmkp-marked-cp) icicle-alpha-p) ("by local file type" (bmkp-local-file-type-cp) icicle-alpha-p) ("by file name" (bmkp-file-alpha-cp) icicle-alpha-p) ("by local file size" (bmkp-local-file-size-cp) icicle-alpha-p) ("by last local file access" (bmkp-local-file-accessed-more-recently-cp) icicle-alpha-p) ("by last local file update" (bmkp-local-file-updated-more-recently-cp) icicle-alpha-p) ("by Info location" (bmkp-info-cp) icicle-alpha-p) ("by Gnus thread" (bmkp-gnus-cp) icicle-alpha-p) ("by URL" (bmkp-url-cp) icicle-alpha-p) ("by bookmark type" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp bmkp-local-file-type-cp bmkp-handler-cp) icicle-alpha-p))) '(("by previous use alphabetically" . icicle-historical-alphabetic-p) ("case insensitive" . icicle-case-insensitive-string-less-p)))) (icicle-candidate-help-fn #'(lambda (cand) (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag) (setq cand (funcall icicle-get-alist-candidate-function cand)) (setq cand (cons (caar cand) (cdr cand)))) (if (featurep 'bookmark+) (if current-prefix-arg (bmkp-describe-bookmark-internals cand) (bmkp-describe-bookmark cand)) (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand))))) (icicle-candidates-alist (if (not (featurep 'bookmark+)) (mapcar #'(lambda (cand) (list (icicle-candidate-short-help (icicle-bookmark-help-string cand) (icicle-bookmark-propertize-candidate cand)))) (bookmark-all-names)) (bookmark-maybe-load-default-file) (mapcar (if icicle-show-multi-completion-flag #'(lambda (bmk) (condition-case nil (let* ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk)) (file (bookmark-get-filename bmk)) (buf (bmkp-get-buffer-name bmk)) (file/buf (if (and buf (equal file bmkp-non-file-filename)) buf file)) (tags (bmkp-get-tags bmk))) (cons `(,(icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) ,file/buf ,@(and tags (list (format "%S" tags)))) guts)) (error nil))) #'(lambda (bmk) (condition-case nil (let ((bname (bookmark-name-from-full-record bmk)) (guts (bookmark-get-bookmark-record bmk))) (cons (icicle-candidate-short-help (icicle-bookmark-help-string bname) (icicle-bookmark-propertize-candidate bname)) guts)) (error nil)))) (or (and (or (and (not icicle-bookmark-refresh-cache-flag) (not (consp current-prefix-arg))) (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg))) bmkp-sorted-alist) (setq bmkp-sorted-alist (bmkp-sort-and-remove-dups bookmark-alist))))))) (progn (require 'bookmark) (when (featurep 'bookmark+) (dolist (map '(minibuffer-local-must-match-map minibuffer-local-completion-map)) (define-key (symbol-value map) "\202" 'icicle-bookmark-non-file-narrow) (define-key (symbol-value map) "\204" 'icicle-bookmark-dired-narrow) (define-key (symbol-value map) "\206" 'icicle-bookmark-file-narrow) (define-key (symbol-value map) "\207" 'icicle-bookmark-gnus-narrow) (define-key (symbol-value map) "\211" 'icicle-bookmark-info-narrow) (define-key (symbol-value map) "\215" 'icicle-bookmark-man-narrow) (define-key (symbol-value map) "\222" 'icicle-bookmark-region-narrow) (define-key (symbol-value map) "\225" 'icicle-bookmark-url-narrow) (define-key (symbol-value map) "\227" 'icicle-bookmark-w3m-narrow) (define-key (symbol-value map) "\200" 'icicle-bookmark-remote-file-narrow) (define-key (symbol-value map) [(control meta 66)] 'icicle-bookmark-bookmark-list-narrow) (define-key (symbol-value map) [(control meta 70)] 'icicle-bookmark-local-file-narrow) (define-key (symbol-value map) [(control meta 75)] 'icicle-bookmark-desktop-narrow)))) (icicle-bookmark-cleanup-on-quit) (icicle-bookmark-cleanup))

(autoload 'icicle-search-char-property "icicles-cmd2" "\
Search for text that has a character property with a certain value.
If the property is `face' or `font-lock-face', then you can pick
multiple faces, using completion.  Text is then searched that has a
face property that includes any of the selected faces.  If you choose
no face (empty input), then text with any face is found.

By \"character property\" is meant either an overlay property or a
text property.  If you want to search for only an overlay property or
only a text property, then use `icicle-search-overlay-property' or
`icicle-search-text-property' instead.

Non-interactively, arguments BEG, END, REQUIRE-MATCH, and WHERE are as
for `icicle-search'.  Arguments PROP, VALUES, and PREDICATE are passed
to `icicle-search-char-property-scan' to define the search contexts.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.

\(fn BEG END REQUIRE-MATCH &optional WHERE PROP VALUES PREDICATE)" t nil)

(autoload 'icicle-search-overlay-property "icicles-cmd2" "\
Same as `icicle-search-char-property', except only overlay property.
That is, do not also search a text property.

\(fn BEG END REQUIRE-MATCH &optional WHERE PROP VALUES PREDICATE)" t nil)

(autoload 'icicle-search-text-property "icicles-cmd2" "\
Same as `icicle-search-char-property', except only text property.
That is, do not also search an overlay property.

\(fn BEG END REQUIRE-MATCH &optional WHERE PROP VALUES PREDICATE)" t nil)

(autoload 'icicle-search-highlight-cleanup "icicles-cmd2" "\
Remove all highlighting from the last use of `icicle-search'.

\(fn)" t nil)

(autoload 'icicle-search-word "icicles-cmd2" "\
Search for a whole word.
Word search is literal: regexp special characters are treated as
non-special.  In fact, they are also treated as if they were
word-constituent characters.  That is, your typed input is searched
for literally, but matches must begin and end on a word boundary.
This also means that you can include whitespace within the \"word\"
being sought.

At the prompt for a word, you can use completion against previous
Icicles search inputs to choose the word, or you can enter a new word.

Non-interactively, WORD-REGEXP should be a regexp that matches a word.
The other arguments are the same as for `icicle-search'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.

\(fn BEG END WORD-REGEXP REQUIRE-MATCH &optional WHERE &rest ARGS)" t nil)

(autoload 'icicle-search-bookmarks-together "icicles-cmd2" "\
Search bookmarked regions (together).
The arguments are the same as for `icicle-search', but without
arguments BEG, END, and WHERE.

This is the same as using a plain prefix arg, `C-u', with
`icicle-search'.

You first choose all of the bookmarked regions to search.  Then your
input is matched against a multi-completion composed of (a) the region
text that matches the regexp and (b) the region's buffer name.

An alternative is multi-command `icicle-search-bookmark', which
searches the bookmarked regions you choose one at a time.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-buffer "icicles-cmd2" "\
Search multiple buffers completely.
Same as using a non-negative numeric prefix arg, such as `C-9', with
`icicle-search'.  You are prompted for the buffers to search.  All of
each buffer is searched.  Any existing buffers can be chosen.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-file "icicles-cmd2" "\
Search multiple files completely.
Same as using a negative numeric prefix arg, such as `C--', with
`icicle-search'.  You are prompted for the files to search.  All of
each file is searched.  Any existing files in the current directory
can be chosen.  Arguments are the same as for `icicle-search', but
without arguments BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-dired-marked "icicles-cmd2" "\
Search the marked files in Dired.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-ibuffer-marked "icicles-cmd2" "\
Search the marked buffers in Ibuffer, in order.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-search-buff-menu-marked "icicles-cmd2" "\
Search the marked buffers in Buffer Menu, in order.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.

\(fn SCAN-FN-OR-REGEXP REQUIRE-MATCH &rest ARGS)" t nil)

(autoload 'icicle-occur "icicles-cmd2" "\
`icicle-search' with a regexp of \".*\".  An `occur' with icompletion.
Type a regexp to match within each line of one or more buffers.  Use
`S-TAB' to show matching lines.  Use `C-RET' or `C-mouse-2' to go to
the line of the current candidate.  Use `C-down', `C-up', `C-next',
`C-prior', `C-end', or `C-home', to cycle among the matching lines.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-search-sentences "icicles-cmd2" "\
`icicle-search' with sentences as contexts.
Type a regexp to match within each sentence of one or more buffers.
Use `S-TAB' to show matching sentences.  Use `C-RET' or `C-mouse-2' to
go to the line of the current candidate.  Use `C-down', `C-up',
`C-next', `C-prior', `C-end', or `C-home' to cycle among the matching
sentences.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-search-paragraphs "icicles-cmd2" "\
`icicle-search' with paragraphs as contexts.
Type a regexp to match within each paragraph of one or more buffers.
Use `S-TAB' to show matching paragraph.  Use `C-RET' or `C-mouse-2' to
go to the line of the current candidate.  Use `C-down', `C-up',
`C-next', `C-prior', `C-end', or `C-home' to cycle among the matching
paragraphs.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-search-pages "icicles-cmd2" "\
`icicle-search' with pages as contexts.
Type a regexp to match within each page of one or more buffers.  Use
`S-TAB' to show matching page.  Use `C-RET' or `C-mouse-2' to go to
the line of the current candidate.  Use `C-down', `C-up', `C-next',
`C-prior', `C-end', or `C-home', to cycle among the matching pages.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.

\(fn BEG END &optional BUFFERS)" t nil)

(autoload 'icicle-comint-search "icicles-cmd2" "\
Use `icicle-search' to pick up a previous input for reuse.
Use this in a `comint-mode' buffer, such as *shell* or
*inferior-lisp*.  This searches your interactive history in the buffer
for a match to your current input, which you can change dynamically.
When you choose a previous input, it is copied to the current prompt,
for reuse.  If the region is active, then only it is searched;
otherwise, the entire buffer is searched.

Use `C-RET' or `C-mouse-2' to choose a previous input for reuse.  Use
`C-down', `C-up', `C-next', `C-prior', `C-end', or `C-home' to cycle
among your previous inputs.

As for other Icicles search commands, your current input narrows the
set of possible candidates.  See `icicle-search' for more
information.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

Note that previous commands are identified by looking through the
shell buffer for a shell prompt.  This is not foolproof.  If, for
instance you use command `ls', the output includes an auto-save file
such as #foo.el#, and `#' in the first column represents a shell
prompt, then #foo.el# will be misinterpreted as a previous command.

Also, depending on your shell, you might want to customize variables
such as the following:

`shell-prompt-pattern',`telnet-prompt-pattern'.

Being a search command, `icicle-comint-search' cannot give you access
to previous shell commands that are not visible in the current buffer.
See also \\<comint-mode-map>\\[icicle-comint-command] for another way to reuse commands,
including those from previous sessions.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments, see the doc for command
`icicle-search'.

\(fn BEG END)" t nil)

(icicle-define-command icicle-comint-command "Retrieve a previously used command.\nUse this in a `comint-mode' buffer such as *shell* or *inferior-lisp*.\n\nNote, depending on your shell, you might want to customize variables\nsuch as the following:\n\n`shell-prompt-pattern',`telnet-prompt-pattern'.\n\nSee also \\<comint-mode-map>\\[icicle-comint-search] for another way to reuse commands." insert "Choose a previous command: " (mapcar #'list (cddr comint-input-ring)) nil nil nil 'shell-command-history (aref (cddr comint-input-ring) 0) nil ((icicle-transform-function 'icicle-remove-duplicates)))

(autoload 'icicle-compilation-search "icicles-cmd2" "\
Like `icicle-search', but show the matching compilation-buffer hit.
Use this in a compilation buffer, such as `*grep*', searching for a
regexp as with `icicle-search'.  Use `C-RET' or `C-mouse-2' to show
the target-buffer hit corresponding to the current completion
candidate.  Use `C-down', `C-up', `C-next', `C-prior', `C-end', or
`C-home' to cycle among the target-buffer hits.

As for `icicle-search', you can further narrow the match candidates by
typing a second regexp to search for among the first matches.  See
`icicle-search' for more information.

Altogether, using this with `grep' gives you two or three levels of
regexp searching: 1) the `grep' regexp, 2) the major `icicle-search'
regexp, and optionally 3) the refining `icicle-search' regexp.

In Emacs 22 and later, you can replace search-hit text, as in
`icicle-search'.  In earlier Emacs versions, you cannot replace text.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments, see the doc for command
`icicle-search'.

\(fn BEG END)" t nil)

(autoload 'icicle-imenu "icicles-cmd2" "\
Go to an Imenu entry using `icicle-search'.
Recommended: Use library `imenu+.el' also.
In Emacs-Lisp mode, `imenu+.el' classifies definitions using these
submenus:

 1. Keys         - keys in the global keymap
 2. Keys in Maps - keys in keymaps other than global keymap
 3. Functions    - functions, whether interactive or not
 4. Macros       - macros defined with `defmacro'
 5. User Options - user variables, from `defcustom'
 6. Variables    - other variables (non-options), from `defvar'
 7. Faces        - faces, from `defface'
 8. Other        - other definitions

Note: If you use this command with a prefix argument, then the Imenu
mode (and `imenu-generic-expression') of the current buffer determines
what kinds of definitions are found.  So, if you want to search for
definitions in a certain language, then invoke this command from a
buffer in that language.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.

\(fn BEG END REQUIRE-MATCH &optional WHERE)" t nil)

(autoload 'icicle-tags-search "icicles-cmd2" "\
Search all source files listed in tags tables for matches for REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You do not need `M-,' - you see all matches as search hits to visit.

All tags in a tags file are used, including duplicate tags from the
same or different source files.

By default, all tags files are used, but if you provide a prefix
argument then only the current tag table is used.

If your TAGS file references source files that no longer exist, those
files are listed.  In that case, you might want to update your TAGS
file.

\(fn REGEXP &optional ARG)" t nil)

(autoload 'icicle-save-string-to-variable "icicles-cmd2" "\
Save a string (text) to a variable.
You are prompted for the string to save.  Typically, you store a
regexp or part of a regexp in the variable.

By default, the variable is user option `icicle-input-string'.
To save to a different variable, use a prefix argument; you are then
prompted for the variable to use.

You can use `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]' to insert a string from a
variable.

\(fn ASKP)" t nil)

(autoload 'icicle-object-action "icicles-cmd2" "\
Act on an object of type TYPE (a symbol).
You are prompted for the type (\"What\"), then for an object of that
type (\"Which\"), then for the action function to apply to the
object (\"How\").  For Anything types (see below), you are not
prompted for the action function.

The \"type\" of an object is one of these:

a. A type defining an entry `icicle-predicate-types-alist'.
   These are type predicates, such as `bufferp', `keywordp', or `atom'.

b. The `type' of an Anything source, or its `name' if it has no
   `type'.  This is available only if you use library `anything.el'
   and option `icicle-use-anything-candidates-flag' is non-nil.

c. A type defining an entry in user option
   `icicle-type-actions-alist'.

In the case of Anything types (only), this is a multi-command:
* `C-RET', `C-mouse-2', and so on perform the default action.
* `C-S-RET', `C-S-mouse-2', and so on let you choose the action using
  completion.

Though this is not a multi-command for non-Anything types, for types
`buffer' and `file' you can use `S-delete' during completion to delete
the object (buffer or file) named by the current completion candidate.

Objects of types (b) and (c) are easily associated with names.  Their
names are the completion candidates.  So, for instance, if you choose
type `buffer', then you can act on a buffer by choosing its name.

Objects of predicate type (type a) are not necessarily named.  The
completion candidates for these objects are variables (symbols) whose
values are the objects acted upon.  So, for instance, if you choose
type `bufferp', then you can choose a variable whose value is a
buffer, in order to act on that buffer.  Whereas a buffer is always
named, an object of type `stringp' is not.  The value of variable
`emacs-version' is one such string that you can act on.

Anything types and Anything actions are highlighted when used as
candidates in *Completions*, using face `icicle-special-candidate'.

Be aware that the action function you choose must accommodate the
object you choose as its only an argument.  Also, completion of the
function candidate itself is not strict, so you can enter a lambda
form.

With a prefix argument, the result of applying the function to the
object is pretty-printed using `icicle-pp-eval-expression'.
Otherwise, the function is called for its effect only, and its value
is not displayed.

You can use a prefix argument similarly when you act on an individual
function (\"How\") candidate to apply it to the object, without ending
completion.  That is, `C-u C-RET', `C-u C-mouse-2', and so on, will
pretty-print the result of the individual action.

This command is intended for use only in Icicle mode.

\(fn &optional TYPE)" t nil)

(when (fboundp 'map-keymap) (defun icicle-insert-char nil "Insert a character, using key completion.\nKeys bound to `self-insert-command' are completion candidates." (interactive) (barf-if-buffer-read-only) (let ((icicle-complete-keys-self-insert-flag t) (icicle-must-match-regexp "^.+  =  self-insert-command")) (icicle-complete-keys))) (defun icicle-complete-keys nil "Complete a key sequence for the currently invoked prefix key.\nInput-candidate completion and cycling are available.\n\nYou can navigate the key-binding hierarchy (prefix-key hierarchy),\njust as would navigate a file-system hierarchy (to complete directory\nand file names) or a menu hierarchy (to complete submenu and menu-item\nnames).\n\nCompletion candidates generally have the form `KEY  =  COMMAND'.\n\nIf COMMAND is `...', then KEY is a prefix key; choosing it updates the\ncompletion candidates list to the keys under that prefix.  For\nexample, choosing `C-x = ...' changes the candidates to those with\nprefix `C-x'.\n\nThe special candidate `..' means to go up one level of the key-binding\nhierarchy and complete candidates there.  For example, if you are\ncurrently completing prefix key `C-x 5', and you choose candidate\n`..', then you will be completing prefix `C-x', the parent of `C-x 5'.\n\nExcept at the top level, the default value for completion is `..'.\n\nIf option `icicle-complete-keys-self-insert-flag' is non-nil, then\nkeys bound to `self-insert-command' are included as possible\ncompletion candidates; otherwise (the default), they are not.  Command\n`icicle-insert-char' works like `icicle-complete-keys', but in\nincludes only keys bound to `self-insert-command' - use it to insert a\ncharacter that is difficult or impossible to type with your keyboard.\n\nYou can use `C-M-,' at any time to switch between sorting with local\nbindings first and sorting with prefix keys first.  You can use `C-,'\nat any time to change the sort order among these two and sorting by\ncommand name.\n\nWhile cycling, these keys describe candidates:\n\n`C-RET'   - Describe command of current completion candidate only\n`C-down'  - Move to next completion candidate and describe\n`C-up'    - Move to previous completion candidate and describe\n`C-next'  - Move to next apropos-completion candidate and describe\n`C-prior' - Move to previous apropos-completion candidate and describe\n`C-end'   - Move to next prefix-completion candidate and describe\n`C-home'  - Move to previous prefix-completion candidate and describe\n`C-!'     - Describe *all* candidates (or all that are saved),\n            successively - use the [back] button in buffer *Help* to\n            visit the descriptions\n\nWhen candidate action and cycling are combined (e.g. `C-next'), option\n`icicle-act-before-cycle-flag' determines which occurs first.\n\nWith prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',\n`C-M-RET', `C-M-down', and so on) provide help about candidates.\n\nUse `mouse-2', `RET', or `S-RET' to finally choose a candidate, or\n`C-g' to quit.  This is an Icicles command - see command\n`icicle-mode'." (interactive) (let* ((icicle-transform-function 'icicle-remove-duplicates) (orig-sort-orders-alist icicle-sort-orders-alist) (orig-show-initially-flag icicle-show-Completions-initially-flag) (icicle-show-Completions-initially-flag t) (icicle-candidate-action-fn 'icicle-complete-keys-action) (enable-recursive-minibuffers t) (orig-buff-key-complete (current-buffer)) (orig-win-key-complete (selected-window)) (icicle-completing-keys-p t) (icicle-sort-comparer 'icicle-local-keys-first-p) (icicle-alternative-sort-comparer 'icicle-prefix-keys-first-p) (icicle-sort-orders-alist '(("by key name, local bindings first" . icicle-local-keys-first-p) ("by key name, prefix keys first" . icicle-prefix-keys-first-p) ("by command name" . icicle-command-names-alphabetic-p) ("turned OFF"))) (icicle-hist-cands-no-highlight '(".."))) (icicle-complete-keys-1 (icicle-this-command-keys-prefix)))) (defun icicle-this-command-keys-prefix nil "Return the prefix of the currently invoked key sequence." (let ((this-key (this-command-keys))) (substring this-key 0 (1- (length this-key))))) (defun icicle-complete-keys-1 (prefix) "Complete a key sequence for prefix key PREFIX (a vector)." (let ((orig-extra-cands icicle-extra-candidates)) (unwind-protect (progn (icicle-keys+cmds-w-prefix prefix) (unless icicle-complete-keys-alist (error "No keys for prefix `%s'" prefix)) (let* ((this-cmd-keys (this-command-keys-vector)) (prefix-description (icicle-key-description prefix (not icicle-key-descriptions-use-<>-flag))) (prompt (concat "Complete keys" (and (not (string= "" prefix-description)) (concat " " prefix-description)) ": "))) (put-text-property 0 1 'icicle-fancy-candidates t prompt) (icicle-complete-keys-action (completing-read prompt icicle-complete-keys-alist nil t nil nil)))) (mapc #'(lambda (cand) (put (car cand) 'icicle-special-candidate nil)) icicle-complete-keys-alist)))) (defun icicle-complete-keys-action (candidate) "Completion action function for `icicle-complete-keys'." (let* ((key+binding (cdr-safe (assq (intern candidate) icicle-complete-keys-alist))) (key (car-safe key+binding)) (binding (cdr-safe key+binding)) (cmd-name nil) (action-window (selected-window))) (unwind-protect (progn (set-buffer orig-buff-key-complete) (select-window orig-win-key-complete) (if (string= ".." candidate) (setq cmd-name "..") (unless (and (string-match "\\(.+\\)  =  \\(.+\\)" candidate) (match-beginning 2)) (error "No match")) (setq cmd-name (substring candidate (match-beginning 2) (match-end 2)))) (cond ((string= ".." cmd-name) (setq last-command 'icicle-complete-keys) (icicle-complete-keys-1 (vconcat (nbutlast (append prefix nil))))) ((and key (string= "..." cmd-name)) (setq last-command 'icicle-complete-keys) (icicle-complete-keys-1 (vconcat prefix key))) (t (setq this-command binding last-command binding icicle-extra-candidates orig-extra-cands) (when (eq 'self-insert-command binding) (unless key (error "Cannot insert `%s'" key)) (setq last-command-char (aref key 0))) (when (eq 'digit-argument binding) (setq last-command-char (aref key 0)) (icicle-msg-maybe-in-minibuffer "Numeric argument")) (when (eq 'negative-argument binding) (icicle-msg-maybe-in-minibuffer "Negative argument")) (setq last-nonmenu-event 1) (condition-case try-command (let ((icicle-show-Completions-initially-flag orig-show-initially-flag) (icicle-candidate-action-fn nil) (icicle-completing-keys-p nil) (icicle-sort-orders-alist orig-sort-orders-alist) (icicle-sort-comparer 'icicle-case-string-less-p) (icicle-alternative-sort-comparer 'icicle-historical-alphabetic-p)) (call-interactively binding nil this-cmd-keys)) (error (error (error-message-string try-command))))))) (select-window action-window)))) (defun icicle-keys+cmds-w-prefix (prefix) "Fill `icicle-complete-keys-alist' for prefix key PREFIX (a vector)." (let ((prefix-map nil)) (setq icicle-complete-keys-alist nil) (dolist (map (current-active-maps t)) (setq prefix-map (lookup-key map prefix)) (when (keymapp prefix-map) (map-keymap #'icicle-add-key+cmd prefix-map))) (unless (equal [] prefix) (push (list (intern (propertize ".." 'face 'icicle-multi-command-completion))) icicle-complete-keys-alist)) icicle-complete-keys-alist)) (defun icicle-add-key+cmd (event binding) "Add completion for EVENT and BINDING to `icicle-complete-keys-alist'." (cond ((and (eq 'menu-item (car-safe binding)) (null (cdr-safe (cdr-safe binding)))) (setq binding nil)) ((and (stringp (car-safe binding)) (null (cdr-safe binding))) (setq binding nil)) ((eq 'menu-item (car-safe binding)) (let ((enable-condition (memq ':enable (cdr-safe (cdr-safe (cdr-safe binding)))))) (if (or (not enable-condition) (condition-case nil (eval (cadr enable-condition)) (error nil))) (setq binding (car-safe (cdr-safe (cdr-safe binding)))) (setq binding nil)))) ((stringp (car-safe binding)) (setq binding (cdr binding)) (when (stringp (car-safe binding)) (setq binding (cdr binding))) (when (and (consp binding) (consp (car binding))) (setq binding (cdr binding))))) (while (and (symbolp binding) (fboundp binding) (keymapp (symbol-function binding))) (setq binding (symbol-function binding))) (cond ((and (or (keymapp binding) (and (commandp binding) (equal binding (key-binding (vconcat prefix (vector event)))) (not (eq binding 'icicle-complete-keys)))) (or (not (eq binding 'self-insert-command)) (and icicle-complete-keys-self-insert-flag (char-valid-p event)))) (let* ((key-desc (propertize (single-key-description event (not icicle-key-descriptions-use-<>-flag)) 'face 'icicle-candidate-part)) (candidate (intern (concat key-desc "  =  " (if (keymapp binding) "..." (prin1-to-string binding)))))) (unless (string= "undefined" (prin1-to-string binding)) (push (cons candidate (cons (vector event) binding)) icicle-complete-keys-alist)) (when (eq map (current-local-map)) (put candidate 'icicle-special-candidate t)))) ((and (integerp event) (generic-char-p event) (eq 'self-insert-command binding)) (ignore)))) (defun icicle-read-single-key-description (string need-vector &optional no-angles) "If STRING contains a space, then the vector containing the symbol named STRING.\nOtherwise, call `icicle-read-kbd-macro'.\nOther args are as for `icicle-read-kbd-macro'." (cond ((and no-angles (string-match " " string)) (vector (intern string))) ((string-match "^<\\([^>]* [^>]*\\)>" string) (vector (intern (substring string (match-beginning 1) (match-end 1))))) (t (icicle-read-kbd-macro string need-vector no-angles)))) (defun icicle-complete-keys-help (candidate) "Describe the command associated with the current completion candidate." (interactive) (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer)) (string-match "\\(.+\\)  =  \\(.+\\)" candidate) (let ((frame-with-focus (selected-frame)) (cmd (intern-soft (substring candidate (match-beginning 2) (match-end 2))))) (if (not (fboundp cmd)) (icicle-msg-maybe-in-minibuffer "No help") (describe-function cmd)) (icicle-raise-Completions-frame) (let* ((help-window (get-buffer-window "*Help*" 0)) (help-frame (and help-window (window-frame help-window)))) (when help-frame (redirect-frame-focus help-frame frame-with-focus)))) (message nil)) (defun icicle-read-kbd-macro (start &optional end no-angles) "Read the region as a keyboard macro definition.\nThe region is interpreted as spelled-out keystrokes, e.g., \"M-x abc RET\".\nSee documentation for `edmacro-mode' for details.\nLeading/trailing \"C-x (\" and \"C-x )\" in the text are allowed and ignored.\nThe resulting macro is installed as the \"current\" keyboard macro.\n\nIn Lisp, may also be called with a single STRING argument in which case\nthe result is returned rather than being installed as the current macro.\nThe result will be a string if possible, otherwise an event vector.\nSecond argument NEED-VECTOR means to return an event vector always.\n\nOptional argument NO-ANGLES non-nil means to expect key\ndescriptions not to use angle brackets (<...>).  For example:\n\n (icicle-read-kbd-macro \"<mode-line>\" t)   returns [mode-line]\n (icicle-read-kbd-macro  \"mode-line\"  t t) returns [mode-line]" (interactive "r") (if (stringp start) (icicle-edmacro-parse-keys start end no-angles) (setq last-kbd-macro (icicle-edmacro-parse-keys (buffer-substring start end) nil no-angles)))) (defun icicle-edmacro-parse-keys (string &optional need-vector no-angles) "Same as `edmacro-parse-keys', but with added NO-ANGLES argument.\nNO-ANGLES is the same as for `icicle-read-kbd-macro'." (let ((case-fold-search nil) (pos 0) (res [])) (while (and (< pos (length string)) (string-match "[^ 	\n\f]+" string pos)) (let ((word (substring string (match-beginning 0) (match-end 0))) (key nil) (times 1)) (setq pos (match-end 0)) (when (string-match "\\([0-9]+\\)\\*." word) (setq times (string-to-number (substring word 0 (match-end 1))) word (substring word (1+ (match-end 1))))) (cond ((string-match "^<<.+>>$" word) (setq key (vconcat (if (eq (key-binding [134217848]) 'execute-extended-command) [134217848] (or (car (where-is-internal 'execute-extended-command)) [134217848])) (substring word 2 -2) ""))) ((or (equal word "REM") (string-match "^;;" word)) (setq pos (string-match "$" string pos))) ((and (string-match (if no-angles "^\\(\\([ACHMsS]-\\)*\\)\\(..+\\)$" "^\\(\\([ACHMsS]-\\)*\\)<\\(..+\\)>$") word) (or (not no-angles) (save-match-data (not (string-match "^\\([ACHMsS]-.\\)+$" word)))) (progn (setq word (concat (substring word (match-beginning 1) (match-end 1)) (substring word (match-beginning 3) (match-end 3)))) (not (string-match "\\<\\(NUL\\|RET\\|LFD\\|ESC\\|SPC\\|DEL\\)$" word)))) (setq key (list (intern word)))) (t (let ((orig-word word) (prefix 0) (bits 0)) (while (string-match "^[ACHMsS]-." word) (incf bits (cdr (assq (aref word 0) '((65 . 4194304) (67 . 67108864) (72 . 16777216) (77 . 134217728) (115 . 8388608) (83 . 33554432))))) (incf prefix 2) (callf substring word 2)) (when (string-match "^\\^.$" word) (incf bits 67108864) (incf prefix) (callf substring word 1)) (let ((found (assoc word '(("NUL" . " ") ("RET" . "") ("LFD" . "\n") ("TAB" . "	") ("ESC" . "") ("SPC" . " ") ("DEL" . ""))))) (when found (setq word (cdr found)))) (when (string-match "^\\\\[0-7]+$" word) (loop for ch across word for n = 0 then (+ (* n 8) ch -48) finally do (setq word (vector n)))) (cond ((= bits 0) (setq key word)) ((and (= bits 134217728) (stringp word) (string-match "^-?[0-9]+$" word)) (setq key (loop for x across word collect (+ x bits)))) ((/= (length word) 1) (error "%s must prefix a single character, not %s" (substring orig-word 0 prefix) word)) ((and (/= (logand bits 67108864) 0) (stringp word) (string-match "[@-_a-z]" word)) (setq key (list (+ bits (- 67108864) (logand (aref word 0) 31))))) (t (setq key (list (+ bits (aref word 0))))))))) (when key (loop repeat times do (callf vconcat res key))))) (when (and (>= (length res) 4) (eq (aref res 0) 24) (eq (aref res 1) 40) (eq (aref res (- (length res) 2)) 24) (eq (aref res (- (length res) 1)) 41)) (setq res (edmacro-subseq res 2 -2))) (if (and (not need-vector) (loop for ch across res always (and (char-valid-p ch) (let ((ch2 (logand ch (lognot 134217728)))) (and (>= ch2 0) (<= ch2 127)))))) (concat (loop for ch across res collect (if (= (logand ch 134217728) 0) ch (+ ch 128)))) res))))

(when (fboundp 'define-minor-mode) (eval '(define-minor-mode icicle-ido-like-mode "Ido-like mode for use with Icicles.\nNo, this mode does not pretend to give you exactly the Ido behavior.\n\nTurning the mode ON sets these options to t:\n `icicle-show-Completions-initially-flag'\n `icicle-top-level-when-sole-completion-flag'\nTurning the mode OFF sets those options to non-nil.\n\nA positive prefix arg turns the mode on and also sets option\n`icicle-max-candidates' to the prefix-arg numeric value.  By default,\nthat option is nil, meaning that there is no limit to the number of\ncompletion candidates.\n\nSince Ido shows only a few completion candidates, you might want to\ncustomize that option or use a prefix arg with this mode to set it.\nYou can also use `C-x #' in the minibuffer to increment or decrement\nthe option at any time during completion.\n\nTurning the mode off by toggling (no prefix arg) resets option\n`icicle-max-candidates' to nil.  If you have customized that option to\na non-nil value and do not want to lose that preference, then use a\nzero or negative prefix arg to turn the mode off.\n\nSee also these options, which control how much time you have to edit\ninput before automatic incremental completion and automatic acceptance\nof a sole candidate kick in:\n\n `icicle-incremental-completion-delay'\n `icicle-top-level-when-sole-completion-delay'\n\nWhen you use this mode, you might also want to use nil or t as the\nvalue of option `icicle-default-value', in order to not insert the\ndefault value in the minibuffer.  If you want to change that option\ndynamically for the mode, use `icicle-ido-like-mode-hook'.  E.g.:\n\n (add-hook 'icicle-ido-like-mode-hook\n           (lambda () (setq icicle-default-value\n                       (if icicle-ido-like-mode t 'insert-end))))" nil nil nil :global t :group 'Icicles-Miscellaneous (setq icicle-show-Completions-initially-flag icicle-ido-like-mode icicle-top-level-when-sole-completion-flag icicle-ido-like-mode) (if icicle-ido-like-mode (when (and current-prefix-arg (not (eq 'toggle current-prefix-arg))) (setq icicle-max-candidates (prefix-numeric-value current-prefix-arg))) (unless (and current-prefix-arg (not (eq 'toggle current-prefix-arg))) (setq icicle-max-candidates nil))))))

(autoload 'icicle-read-color "icicles-cmd2" "\
Read a color name or hex RGB color value #RRRRGGGGBBBB.
A string value is returned.
Interactively, optional argument ARG is the prefix arg.
Optional argument PROMPT is the prompt to use (default \"Color: \").

In addition to standard color names and RGB (red, green, blue) hex
values, the following are also available as proxy color candidates,
provided `icicle-add-proxy-candidates-flag' is non-nil and library
`palette.el' or `eyedropper.el' is used.  In each case, the
corresponding color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the text cursor
* `*point background*'   - background under the text cursor

\(You can copy a color using eyedropper commands such as
`eyedrop-pick-foreground-at-mouse'.)

In addition, the names of user options (variables) whose custom type
is `color' are also proxy candidates, but with `'' as a prefix and
suffix.  So, for example, option `icicle-region-background' appears as
proxy color candidate `'icicle-region-background''.

As always, you can toggle the use of proxy candidates using `\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]' in
the minibuffer.

With plain `C-u', use `hexrgb-read-color', which lets you complete a
color name or input any valid RGB hex value (without completion).

With no prefix arg, return a string with both the color name and the
RGB value, separated by `icicle-list-nth-parts-join-string'.

With a numeric prefix arg of 0 or 1, return the color name.  With any
other numeric prefix arg, return the RGB value.

In the plain `C-u' case, your input is checked to ensure that it
represents a valid color.

In all other cases:

- You can complete your input against the color name, the RGB value,
  or both.

- If you enter input without completing or cycling, the input is not
  checked: whatever is entered is returned as the string value.

From Emacs Lisp, ARG controls what is returned.  If ARG is nil,
`icicle-list-use-nth-parts' can also be used to control the behavior.

Note: Duplicate color names are removed by downcasing and removing
whitespace.  For example, \"AliceBlue\" and \"alice blue\" are both
treated as \"aliceblue\".  Otherwise, candidates with different names
but the same RGB values are not considered duplicates, so, for
example, input can match either \"darkred\" or \"red4\", which both
have RGB #8b8b00000000.  You can toggle duplicate removal at any time
using `C-$'.

During completion, candidate help (e.g. `C-M-RET') shows you the RGB
and HSV (hue, saturation, value) color components.

This command is intended only for use in Icicle mode (but it can be
used with `C-u', with Icicle mode turned off).

\(fn &optional ARG PROMPT)" t nil)

;;;***

;;;### (autoloads (Icicles-Searching Icicles-Miscellaneous Icicles-Minibuffer-Display
;;;;;;  Icicles-Matching Icicles-Key-Completion Icicles-Key-Bindings
;;;;;;  Icicles-Completions-Display Icicles-Files Icicles-Buffers
;;;;;;  Icicles) "icicles-face" "icicles-face.el" (19991 46054))
;;; Generated autoloads from icicles-face.el

(let ((loads (get 'Icicles 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Buffers 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Buffers 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Files 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Files 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Completions-Display 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Completions-Display 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Key-Bindings 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Key-Bindings 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Key-Completion 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Key-Completion 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Matching 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Matching 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Minibuffer-Display 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Minibuffer-Display 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Miscellaneous 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Miscellaneous 'custom-loads (cons '"icicles-face" loads))))

(let ((loads (get 'Icicles-Searching 'custom-loads))) (if (member '"icicles-face" loads) nil (put 'Icicles-Searching 'custom-loads (cons '"icicles-face" loads))))

(defface icicle-candidate-part '((((background dark)) (:background "#451700143197")) (t (:background "#EF84FFEAF427"))) "\
*Face used to highlight part(s) of a candidate in *Completions*." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-common-match-highlight-Completions '((((background dark)) (:foreground "#2017A71F2017")) (t (:foreground "magenta3"))) "\
*Face used to highlight candidates common match, in *Completions*." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-complete-input '((((background dark)) (:foreground "#B19E6A64B19E")) (t (:foreground "DarkGreen"))) "\
*Face used to highlight input when it is complete." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-completion '((((background dark)) (:foreground "#0000D53CD53C")) (t (:foreground "Red"))) "\
*Face used to indicate minibuffer completion.
It highlights the minibuffer indicator and the `Icy' minor-mode
lighter during completion.
Not used for versions of Emacs before version 21." :group (quote Icicles-Minibuffer-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-Completions-instruction-1 '((((background dark)) (:foreground "#AC4AAC4A0000")) (t (:foreground "Blue"))) "\
*Face used to highlight first line of *Completions* buffer." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-Completions-instruction-2 '((((background dark)) (:foreground "#0000D53CD53C")) (t (:foreground "Red"))) "\
*Face used to highlight second line of *Completions* buffer." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-current-candidate-highlight '((((background dark)) (:background "#69D40A460000")) (t (:background "CadetBlue1"))) "\
*Face used to highlight the current candidate, in *Completions*." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-extra-candidate '((((background dark)) (:background "#4517305D0000")) (t (:background "#C847D8FEFFFF"))) "\
*Face used to highlight *Completions* candidates that are extra.
This means that they belong to list `icicle-extra-candidates'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-historical-candidate '((((background dark)) (:foreground "#DBD599DF0000")) (t (:foreground "Blue"))) "\
*Face used to highlight *Completions* candidates that have been used." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-input-completion-fail '((((background dark)) (:background "#22225F5F2222")) (t (:foreground "Black" :background "Plum"))) "\
*Face for highlighting failed part of input during strict completion." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-input-completion-fail-lax '((((background dark)) (:background "#00005E3B5A8D")) (t (:foreground "Black" :background "#FFFFB8C4BB87"))) "\
*Face for highlighting failed part of input during lax completion." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-match-highlight-Completions '((((background dark)) (:foreground "#1F1FA21CA21C")) (t (:foreground "Red3"))) "\
*Face used to highlight root that was completed, in *Completions*." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-match-highlight-minibuffer '((t (:underline t))) "\
*Face used to highlight root that was completed, in minibuffer." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(defface icicle-mode-line-help '((((background dark)) (:foreground "#AC4AAC4A0000")) (t (:foreground "Blue"))) "\
*Face used to highlight help shown in the mode-line." :group (quote Icicles-Completions-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-multi-command-completion '((((background dark)) (:foreground "#0000D53CD53C" :background "#8B3500007533")) (t (:foreground "Red" :background "#78F6FFFF8E4F"))) "\
*Face used to indicate Icicles multi-command completion.
It highlights the minibuffer indicator and the `Icy+' minor-mode
lighter during multi-command completion.
Not used for versions of Emacs before version 21." :group (quote Icicles-Minibuffer-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-mustmatch-completion '((((type x w32 mac graphic) (class color)) (:box (:line-width -2 :color "Blue"))) (t (:inverse-video t))) "\
*Face used to indicate strict minibuffer completion.
It highlights the minibuffer indicator and the `Icy' or `Icy+'
minor-mode lighter during strict completion.
Not used for versions of Emacs before version 21." :group (quote Icicles-Minibuffer-Display) :group (quote Icicles-Miscellaneous) :group (quote faces))

(defface icicle-proxy-candidate '((((background dark)) (:background "#316B22970000")) (t (:background "#E1E1EAEAFFFF" :box (:line-width 2 :color "White" :style released-button)))) "\
*Face used to highlight proxy candidates in `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-saved-candidate '((((background dark)) (:background "gray20")) (t (:background "gray80"))) "\
*Face used to highlight *Completions* candidates that have been saved." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-search-main-regexp-current '((((background dark)) (:background "#00004AA652F1")) (t (:background "misty rose"))) "\
*Face used to highlight current match of your search context regexp.
This highlighting is done during Icicles searching." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-1 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 80) 10) "#071F473A0000"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 80) 10) "#FA6CC847FFFF"))))) "\
*Face used to highlight level (subgroup match) 1 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-2 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 40) 10) "#507400002839"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 40) 10) "#C847FFFFE423"))))) "\
*Face used to highlight level (subgroup match) 2 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-3 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 60) 10) "#4517305D0000"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 60) 10) "#C847D8FEFFFF"))))) "\
*Face used to highlight level (subgroup match) 3 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-4 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 20) 10) "#176900004E0A"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-saturation (icicle-increment-color-hue context-bg 20) 10) "#EF47FFFFC847"))))) "\
*Face used to highlight level (subgroup match) 4 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-5 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 80) "#04602BC00000"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 80) "#FCFCE1E1FFFF"))))) "\
*Face used to highlight level (subgroup match) 5 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-6 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 40) "#32F200001979"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 40) "#E1E1FFFFF0F0"))))) "\
*Face used to highlight level (subgroup match) 6 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-7 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 60) "#316B22970000"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 60) "#E1E1EAEAFFFF"))))) "\
*Face used to highlight level (subgroup match) 7 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-context-level-8 (let ((context-bg (face-background 'icicle-search-main-regexp-current))) `((((background dark)) (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 20) "#12EC00003F0E"))) (t (:background ,(if (featurep 'hexrgb) (icicle-increment-color-hue context-bg 20) "#F6F5FFFFE1E1"))))) "\
*Face used to highlight level (subgroup match) 8 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-current-input '((((background dark)) (:foreground "White" :background "#7F0D00007F0D")) (t (:foreground "Black" :background "Green"))) "\
*Face used to highlight what your current input matches.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-search-main-regexp-others '((((background dark)) (:background "#348608690000")) (t (:background "CadetBlue1"))) "\
*Face used to highlight other matches of your search context regexp.
If user option `icicle-search-highlight-threshold' is less than one,
then this face is not used.
This highlighting is done during Icicles searching." :group (quote Icicles-Searching) :group (quote faces))

(defface icicle-special-candidate '((((background dark)) (:background "#176900004E0A")) (t (:background "#EF47FFFFC847"))) "\
*Face used to highlight *Completions* candidates that are special.
The meaning of special is that their names match
`icicle-special-candidate-regexp'." :group (quote Icicles-Completions-Display) :group (quote faces))

(defface icicle-whitespace-highlight '((((background dark)) (:background "#000093F402A2")) (t (:background "Magenta"))) "\
*Face used to highlight initial whitespace in minibuffer input." :group (quote Icicles-Minibuffer-Display) :group (quote faces))

(unless (facep 'minibuffer-prompt) (defface minibuffer-prompt '((((background dark)) (:foreground "cyan")) (t (:foreground "dark blue"))) "Face for minibuffer prompts." :group 'basic-faces))

;;;***

;;;### (autoloads (icicle-display-completion-list icicle-read-string
;;;;;;  icicle-read-from-minibuffer icicle-read-file-name-1 icicle-read-file-name
;;;;;;  icicle-completing-read) "icicles-fn" "icicles-fn.el" (19991
;;;;;;  46054))
;;; Generated autoloads from icicles-fn.el

(cond ((> emacs-major-version 21) (defun icicle-choose-completion-string (choice &optional buffer base-size) "Switch to BUFFER and insert the completion choice CHOICE.\nBASE-SIZE, if non-nil, says how many characters of BUFFER's text\nto keep.  If it is nil, we call `choose-completion-delete-max-match'\nto decide what to delete.\nIf BUFFER is the minibuffer, then exit the minibuffer, unless one of\nthe following is true:\n   - it is reading a file name, CHOICE is a directory, and\n     `icicle-dir-candidate-can-exit-p' is nil\n   - `completion-no-auto-exit' is non-nil\n   - this is just a `lisp-complete-symbol' completion." (let* ((buffer (or buffer completion-reference-buffer)) (mini-p (minibufferp buffer))) (if (and mini-p (or (not (active-minibuffer-window)) (not (equal buffer (window-buffer (active-minibuffer-window)))))) (error "Minibuffer is not active for completion") (set-buffer buffer) (unless (run-hook-with-args-until-success 'choose-completion-string-functions choice buffer mini-p base-size) (if base-size (delete-region (+ base-size (if mini-p (minibuffer-prompt-end) (point-min))) (if mini-p (point-max) (point))) (choose-completion-delete-max-match choice)) (when mini-p (goto-char (point-max))) (insert choice) (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil)) (let ((window (get-buffer-window buffer 0))) (set-window-point window (point))) (and (not completion-no-auto-exit) (equal buffer (window-buffer (minibuffer-window))) (or minibuffer-completion-table (and icicle-mode (or icicle-extra-candidates icicle-proxy-candidates))) (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion)) (if (or icicle-dir-candidate-can-exit-p (not (eq minibuffer-completion-table 'read-file-name-internal)) (not (file-directory-p (field-string (point-max))))) (exit-minibuffer) (let ((mini (active-minibuffer-window))) (select-window mini) (when minibuffer-auto-raise (raise-frame (window-frame mini))))))))))) ((> emacs-major-version 20) (defun icicle-choose-completion-string (choice &optional buffer base-size) "Switch to BUFFER and insert the completion choice CHOICE.\nBASE-SIZE, if non-nil, says how many characters of BUFFER's text\nto keep.  If it is nil, we call `choose-completion-delete-max-match'\nto decide what to delete.\nIf BUFFER is the minibuffer, then exit the minibuffer, unless one of\nthe following is true:\n   - it is reading a file name, CHOICE is a directory, and\n     `icicle-dir-candidate-can-exit-p' is nil\n   - `completion-no-auto-exit' is non-nil\n   - this is just a `lisp-complete-symbol' completion." (let ((buffer (or buffer completion-reference-buffer)) (mini-p (save-match-data (string-match "\\` \\*Minibuf-[0-9]+\\*\\'" (buffer-name buffer))))) (if (and mini-p (or (not (active-minibuffer-window)) (not (equal buffer (window-buffer (active-minibuffer-window)))))) (error "Minibuffer is not active for completion") (set-buffer buffer) (if base-size (delete-region (+ base-size (if mini-p (icicle-minibuffer-prompt-end) (point-min))) (if mini-p (point-max) (point))) (choose-completion-delete-max-match choice)) (when mini-p (goto-char (point-max))) (insert choice) (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil)) (let ((window (get-buffer-window buffer 0))) (set-window-point window (point))) (and (not completion-no-auto-exit) (equal buffer (window-buffer (minibuffer-window))) (or minibuffer-completion-table (and icicle-mode (or icicle-extra-candidates icicle-proxy-candidates))) (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion)) (if (or icicle-dir-candidate-can-exit-p (not (eq minibuffer-completion-table 'read-file-name-internal)) (not (file-directory-p (field-string (point-max))))) (exit-minibuffer) (let ((mini (active-minibuffer-window))) (select-window mini) (when minibuffer-auto-raise (raise-frame (window-frame mini)))))))))) (t (defun icicle-choose-completion-string (choice &optional buffer base-size) "Switch to BUFFER and insert the completion choice CHOICE.\n BASE-SIZE, if non-nil, says how many characters of BUFFER's text\n to keep.  If it is nil, we call `choose-completion-delete-max-match'\n to decide what to delete.\n If BUFFER is the minibuffer, then exit the minibuffer, unless one of\n the following is true:\n    - it is reading a file name, CHOICE is a directory, and\n      `icicle-dir-candidate-can-exit-p' is nil\n    - `completion-no-auto-exit' is non-nil\n    - this is just a `lisp-complete-symbol' completion." (let ((buffer (or buffer completion-reference-buffer)) (mini-p (save-match-data (string-match "\\` \\*Minibuf-[0-9]+\\*\\'" (buffer-name buffer))))) (when (and mini-p (or (not (active-minibuffer-window)) (not (equal buffer (window-buffer (active-minibuffer-window)))))) (error "Minibuffer is not active for completion")) (set-buffer buffer) (if base-size (delete-region (+ base-size (point-min)) (if mini-p (point-max) (point))) (choose-completion-delete-max-match choice)) (when mini-p (goto-char (point-max))) (insert choice) (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil)) (let ((window (get-buffer-window buffer 0))) (set-window-point window (point))) (and (not completion-no-auto-exit) (equal buffer (window-buffer (minibuffer-window))) (or minibuffer-completion-table (and icicle-mode (or icicle-extra-candidates icicle-proxy-candidates))) (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion)) (if (or icicle-dir-candidate-can-exit-p (not (eq minibuffer-completion-table 'read-file-name-internal)) (not (file-directory-p (buffer-string)))) (exit-minibuffer) (select-window (active-minibuffer-window))))))))

(when (< emacs-major-version 22) (defun icicle-completion-setup-function nil "Set up for completion.  This goes in `completion-setup-hook'\nso it is called after completion-list buffer text is written." (save-excursion (let* ((mainbuf (current-buffer)) (mbuf-contents (icicle-input-from-minibuffer)) (dir-of-input (and minibuffer-completing-file-name (icicle-file-name-directory mbuf-contents)))) (when (and dir-of-input (or (and (symbolp last-command) (get this-command 'icicle-completing-command)) (not icicle-comp-base-is-default-dir-p))) (with-current-buffer mainbuf (setq default-directory dir-of-input))) (with-current-buffer standard-output (completion-list-mode) (set (make-local-variable 'completion-reference-buffer) mainbuf) (setq completion-base-size (cond ((and (eq minibuffer-completion-table 'read-file-name-internal) icicle-comp-base-is-default-dir-p (length default-directory))) ((eq minibuffer-completion-table 'read-file-name-internal) (with-current-buffer mainbuf (save-excursion (skip-chars-backward "^/") (- (point) (icicle-minibuffer-prompt-end))))) ((save-match-data (string-match "\\` \\*Minibuf-[0-9]+\\*\\'" (buffer-name mainbuf))) 0))))))))

(when (>= emacs-major-version 22) (defun icicle-completion-setup-function nil "Set up for completion.  This goes in `completion-setup-hook'\nso it is called after completion-list buffer text is written." (save-excursion (let* ((mainbuf (current-buffer)) (mbuf-contents (minibuffer-completion-contents)) (dir-of-input (and minibuffer-completing-file-name (icicle-file-name-directory mbuf-contents))) common-string-length) (when (and dir-of-input (or (and (symbolp this-command) (get this-command 'icicle-completing-command)) (not icicle-comp-base-is-default-dir-p))) (with-current-buffer mainbuf (setq default-directory dir-of-input))) (with-current-buffer standard-output (completion-list-mode) (set (make-local-variable 'completion-reference-buffer) mainbuf) (setq completion-base-size (cond ((and minibuffer-completing-file-name icicle-comp-base-is-default-dir-p (length default-directory))) ((and (symbolp minibuffer-completion-table) (get minibuffer-completion-table 'completion-base-size-function)) (with-current-buffer mainbuf (funcall (get minibuffer-completion-table 'completion-base-size-function)))) (minibuffer-completing-file-name (with-current-buffer mainbuf (save-excursion (skip-chars-backward completion-root-regexp) (- (point) (minibuffer-prompt-end))))) ((and (boundp 'minibuffer-completing-symbol) minibuffer-completing-symbol) nil) ((minibufferp mainbuf) 0))) (setq common-string-length (cond (completion-common-substring (length completion-common-substring)) (completion-base-size (- (length mbuf-contents) completion-base-size)))) (when (and (integerp common-string-length) (>= common-string-length 0)) (let ((element-start (point-min)) (maxp (point-max)) element-common-end) (while (and (setq element-start (next-single-property-change element-start 'mouse-face)) (< (setq element-common-end (+ element-start common-string-length)) maxp)) (when (get-char-property element-start 'mouse-face) (if (and (> common-string-length 0) (get-char-property (1- element-common-end) 'mouse-face)) (put-text-property element-start element-common-end 'font-lock-face 'completions-common-part)) (if (get-char-property element-common-end 'mouse-face) (put-text-property element-common-end (1+ element-common-end) 'font-lock-face 'completions-first-difference)))))))))))

(autoload 'icicle-completing-read "icicles-fn" "\
Read string in minibuffer, with completion and cycling of completions.
Prefix completion via \\<minibuffer-local-completion-map>`\\[icicle-prefix-word-complete]' (word) and `\\[icicle-prefix-complete]' (full).
Apropos (regexp) completion via `\\[icicle-apropos-complete]'.

Prefix cycling of candidate completions via `\\[icicle-previous-prefix-candidate]' and `\\[icicle-next-prefix-candidate]'.
Apropos cycling of candidate completions via `\\[icicle-previous-apropos-candidate]' and `\\[icicle-next-apropos-candidate]'.

Cycling of past minibuffer inputs via `\\[previous-history-element]' and `\\[next-history-element]'.
Searching through input history via `\\[previous-matching-history-element]' and `\\[next-matching-history-element]'.

Case is ignored if `completion-ignore-case' is non-nil.
Position of the cursor (point) and the mark during completion cycling
  is determined by `icicle-point-position-in-candidate' and
  `icicle-mark-position-in-candidate', respectively.
Highlighting of the matched part of completion candidates during
  cycling is determined by `icicle-match-highlight-minibuffer',
  `icicle-match-highlight-Completions', and
  `icicle-common-match-highlight-Completions'.

Use `\\[icicle-minibuffer-help]' during completion for more information on completion and key
bindings in Icicle mode.

PROMPT is a string to prompt with. It normally ends in a colon and a
space.  If PROMPT has non-nil text property `icicle-fancy-candidates'
on its first character, then completion candidates can be fancy - they
can have properties.  However, if all of the candidates would be
acceptable to vanilla Emacs, then PROMPT need not use property
`icicle-fancy-candidates', even for candidates that have text
properties.  Property `icicle-fancy-candidates' is needed only for
candidates that require encoding and decoding to store and retrieve
properties.  See the Icicles doc, section `Programming with Fancy
Candidates'.

COLLECTION is an obarray or an alist whose elements' cars are strings.
It can also be a function that performs the completion itself.
In Emacs 22 or later, it can also be a hash table or list of strings.

In Icicle mode, the car of an alist entry can also be a list of
strings.  In this case, the completion candidate is a
multi-completion.  The strings are joined pairwise with
`icicle-list-join-string' to form the completion candidate seen by the
user, which is terminated by `icicle-list-end-string'.  You can use
variable `icicle-candidate-properties-alist' to control the appearance
of multi-completions in buffer *Completions*.  You can use variables
`icicle-list-use-nth-parts' and `icicle-list-nth-parts-join-string' to
control the minibuffer behavior of multi-completions.  See the Icicles
documentation for more information.

PREDICATE limits completion to a subset of COLLECTION.

See `try-completion' and `all-completions' for more details on
completion, COLLECTION, and PREDICATE.

REQUIRE-MATCH can take any of these values:
* nil means the user can exit using any input.
* t means the user can exit only if the input is (or completes to) an
  element of COLLECTION or is null.
* In Emacs 23 or later:
  - `confirm' means the user can exit with any input, but if the input
    is not an element of COLLECTION then confirmation is needed.
  - `confirm-after-completion' is similar, except that with
    non-matching input exit is allowed only just after completing.
* Anything else behaves like t, except that hitting `\\[exit-minibuffer]' does not
  exit if it performs non-null completion.

Regardless of the value of REQUIRE-MATCH, if the user input is empty,
then `completing-read' returns DEF or, if DEF is nil, an empty string.

If option `icicle-require-match-flag' is non-nil, it overrides the
value of REQUIRE-MATCH.

If INITIAL-INPUT is non-nil, insert it in the minibuffer initially,
with point positioned at the end.  If it is (STRING . POSITION), the
initial input is STRING, but point is placed at zero-indexed position
POSITION in STRING.  (This is different from `read-from-minibuffer'
and related functions, which use one-indexing for POSITION.)

INITIAL-INPUT is considered deprecated by vanilla Emacs, but not by
Icicles.  If INITIAL-INPUT is nil and DEF is non-nil, the user can use
`next-history-element' to yank DEF into the minibuffer.

HIST, if non-nil, specifies a history list and optionally the initial
position in the list.  It can be a symbol, which is the history list
variable to use, or it can be a cons cell (HISTVAR . HISTPOS).  If a
cons cell, HISTVAR is the history list variable to use, and HISTPOS is
the initial position (the position in the list used by the minibuffer
history commands).  For consistency, you should also specify that
element of the history as the value of INITIAL-INPUT.  Positions are
counted starting from 1 at the beginning of the list.  The variable
`history-length' controls the maximum length of a history list.

DEF, if non-nil, is the default value or (Emacs 23+ only) the list of
default values.  Option `icicle-default-value' controls the treatment
of the default value (or the first default value, if DEF is a list):
whether it is shown in the prompt, substituted for an empty
INITIAL-INPUT, and so on.

If INHERIT-INPUT-METHOD is non-nil, the minibuffer inherits the
current input method and the setting of `enable-multibyte-characters'.

Both completion candidates and DEF are filtered using these Icicles
variables:
  `icicle-must-match-regexp'
  `icicle-must-not-match-regexp'
  `icicle-must-pass-predicate'

Completion ignores case when `completion-ignore-case' is non-nil.

\(fn PROMPT COLLECTION &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST-M@%=!$+&^*Z DEF INHERIT-INPUT-METHOD)" nil nil)

(autoload 'icicle-read-file-name "icicles-fn" "\
Read file name, prompting with PROMPT and completing in directory DIR.
Value is not expanded---you must call `expand-file-name' yourself.
DIR should be an absolute directory name.  It defaults to the value of
 `default-directory'.
Default the name to DEFAULT-FILENAME if user exits the minibuffer with
the same non-empty string that was inserted by this function.
 (If DEFAULT-FILENAME is omitted, the visited file name is used,
  but if INITIAL-INPUT is specified, that combined with DIR is used.)
If the user exits with an empty minibuffer, this function returns
an empty string.  (This can only happen if the user erased the
pre-inserted contents or if `insert-default-directory' is nil.)
Fourth arg REQUIRE-MATCH non-nil means require existing file's name.
 Non-nil and non-t means also require confirmation after completion.
Fifth arg INITIAL-INPUT specifies text to start with.
If optional sixth arg PREDICATE is non-nil, possible completions and
 the resulting file name must satisfy `(funcall predicate NAME)'.
 This argument is only available starting with Emacs 22.

Both completion candidates and DEFAULT-FILENAME are filtered using
these Icicles variables:
  `icicle-must-match-regexp'
  `icicle-must-not-match-regexp'
  `icicle-must-pass-predicate'

Directory names are highlighted in *Completions* using face
`icicle-special-candidate'.

If option `icicle-require-match-flag' is non-nil, it overrides the
value of REQUIRE-MATCH.

Cycling into subdirectories is determined by option
`icicle-cycle-into-subdirs-flag'.  Case is ignored if
`read-file-name-completion-ignore-case' is non-nil.  See also
`read-file-name-function'.

If option `icicle-add-proxy-candidates-flag' is non-nil, then the
following proxy file-name candidates are included.  (This inclusion
can be toggled at any time from the minibuffer, using `C-M-_'.)

* `*mouse-2 file name*' - Click `mouse-2' on a file name to choose it.
* `*point file name*'   - Use the file name at point (cursor).
* Single-quoted file-name variables - Use the variable's value.

Candidates `*mouse-2 file name*' and `*point file name*' are available
only if library `ffap.el' can be loaded.  A file-name variable has
custom type `file' or (file :must-match t).

If this command was invoked with the mouse, use a file dialog box if
`use-dialog-box' is non-nil, and the window system or X toolkit in use
provides a file dialog box.

See also `read-file-name-completion-ignore-case' (Emacs version > 21)
and `read-file-name-function'.

\(fn PROMPT &optional DIR DEFAULT-FILENAME REQUIRE-MATCH INITIAL-INPUT PREDICATE)" nil nil)

(autoload 'icicle-read-file-name-1 "icicles-fn" "\
Helper function for `icicle-read-file-name'.

\(fn PROMPT &optional DIR DEFAULT-FILENAME REQUIRE-MATCH INITIAL-INPUT PREDICATE)" nil nil)

(autoload 'icicle-read-from-minibuffer "icicles-fn" "\
Read a string from the minibuffer, prompting with string PROMPT.
The optional second arg INITIAL-CONTENTS is an alternative to
  DEFAULT-VALUE.  Vanilla Emacs considers it to be obsolete, but
  Icicles does not.  It is discussed in more detail below.
Third arg KEYMAP is a keymap to use while reading;
  if omitted or nil, the default is `minibuffer-local-map'.
If fourth arg READ is non-nil, then interpret the result as a Lisp object
  and return that object:
  in other words, do `(car (read-from-string INPUT-STRING))'
Fifth arg HIST, if non-nil, specifies a history list and optionally
  the initial position in the list.  It can be a symbol, which is the
  history list variable to use, or it can be a cons cell
  (HISTVAR . HISTPOS).  In that case, HISTVAR is the history list variable
  to use, and HISTPOS is the initial position for use by the minibuffer
  history commands.  For consistency, you should also specify that
  element of the history as the value of INITIAL-CONTENTS.  Positions
  are counted starting from 1 at the beginning of the list.
Sixth arg DEFAULT-VALUE is the default value.  If non-nil, it is available
  for history commands; but, unless READ is non-nil, `read-from-minibuffer'
  does NOT return DEFAULT-VALUE if the user enters empty input!  It returns
  the empty string.  DEFAULT-VALUE can be a string or a list of strings.
  These  become the minibuffer's future history, available using `M-n'.
Seventh arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer inherits
 the current input method and the setting of `enable-multibyte-characters'.
Eighth arg KEEP-ALL, if non-nil, says to put all inputs in the history list,
 even empty or duplicate inputs.  This is available starting with Emacs 22.
If the variable `minibuffer-allow-text-properties' is non-nil,
 then the string which is returned includes whatever text properties
 were present in the minibuffer.  Otherwise the value has no text properties.

Option `icicle-default-value' controls how the default value,
DEFAULT-VALUE, is treated.

The remainder of this documentation string describes the
INITIAL-CONTENTS argument in more detail.  If non-nil,
INITIAL-CONTENTS is a string to be inserted into the minibuffer before
reading input.  Normally, point is put at the end of that string.
However, if INITIAL-CONTENTS is (STRING . POSITION), the initial input
is STRING, but point is placed at one-indexed position POSITION in the
minibuffer.  Any integer value less than or equal to one puts point at
the beginning of the string.  *Note* that this behavior differs from
the way such arguments are used in `completing-read' and some related
functions, which use zero-indexing for POSITION.

\(fn PROMPT &optional INITIAL-CONTENTS KEYMAP READ HIST-M@%=!$+&^*Z DEFAULT-VALUE INHERIT-INPUT-METHOD)" nil nil)

(autoload 'icicle-read-string "icicles-fn" "\
Read a string from the minibuffer, prompting with string PROMPT.
If non-nil, second arg INITIAL-INPUT is a string to insert before reading.
  Vanilla Emacs considers it to be obsolete, but Icicles does not.  It
  behaves like argument INITIAL-CONTENTS in `read-from-minibuffer'.
  See the documentation string of `read-from-minibuffer' for details.
The third arg HISTORY, if non-nil, specifies a history list
  and optionally the initial position in the list.
  See `read-from-minibuffer' for details of HISTORY argument.
Fourth arg DEFAULT-VALUE is the default value.  If non-nil, it is used
 for history commands, and as the value to return if the user enters
 the empty string.
Fifth arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer inherits
 the current input method and the setting of enable-multibyte-characters.

\(fn PROMPT &optional INITIAL-INPUT HIST-M@%=!$+&^*Z DEFAULT-VALUE INHERIT-INPUT-METHOD)" nil nil)

(cond ((< emacs-major-version 21) (defun icicle-read-face-name (prompt) "Read a face name with completion and return its face symbol.\nPROMPT is the prompt.\n\nIf option `icicle-add-proxy-candidates-flag' is non-nil, then you can\nalso enter the name of a face-name variable - its value is returned.\nA face-name variable is a variable with custom-type `face'.\n\nIf library `eyedropper.el' is used, then you can also choose proxy\ncandidate `*point face name*' to use the face at point." (require 'eyedropper nil t) (let ((icicle-list-nth-parts-join-string ": ") (icicle-list-join-string ": ") (icicle-list-end-string "") (icicle-list-use-nth-parts '(1)) (icicle-proxy-candidates (and icicle-add-proxy-candidates-flag (append (and (fboundp 'eyedrop-face-at-point) (list "*point face name*")) (let ((ipc nil)) (mapatoms (lambda (cand) (when (and (user-variable-p cand) (eq (get cand 'custom-type) 'face)) (push `,(concat "'" (symbol-name cand) "'") ipc)))) ipc)))) face) (setq prompt (copy-sequence prompt)) (put-text-property 0 1 'icicle-fancy-candidates t prompt) (while (= (length face) 0) (setq face (icicle-transform-multi-completion (completing-read prompt (mapcar #'icicle-make-face-candidate (face-list)) nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history))))) (let ((proxy (car (member face icicle-proxy-candidates)))) (cond ((save-match-data (string-match "*point face name\\*$" face)) (eyedrop-face-at-point)) (proxy (symbol-value (intern (substring proxy 1 (1- (length proxy)))))) (t (intern face))))))) ((= emacs-major-version 21) (defun icicle-read-face-name (prompt) "Read a face name with completion and return its face symbol.\nPROMPT is the prompt.\n\nIf option `icicle-add-proxy-candidates-flag' is non-nil, then you can\nalso enter the name of a face-name variable - its value is returned.\nA face-name variable is a variable with custom-type `face'.\n\nIf library `eyedropper.el' is used, then you can also choose proxy\ncandidate `*point face name*' to use the face at point." (require 'eyedropper nil t) (let ((icicle-list-nth-parts-join-string ": ") (icicle-list-join-string ": ") (icicle-list-end-string "") (icicle-list-use-nth-parts '(1)) (icicle-proxy-candidates (and icicle-add-proxy-candidates-flag (append (and (fboundp 'eyedrop-face-at-point) (list "*point face name*")) (let ((ipc nil)) (mapatoms (lambda (cand) (when (and (user-variable-p cand) (eq (get cand 'custom-type) 'face)) (push `,(concat "'" (symbol-name cand) "'") ipc)))) ipc)))) (face-list (face-list)) (def (thing-at-point 'symbol)) face) (cond ((assoc def face-list) (setq prompt (concat prompt " (default " def "): "))) (t (setq def nil prompt (concat prompt ": ")))) (put-text-property 0 1 'icicle-fancy-candidates t prompt) (while (equal "" (setq face (icicle-transform-multi-completion (completing-read prompt (mapcar #'icicle-make-face-candidate face-list) nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history) def))))) (let ((proxy (car (member face icicle-proxy-candidates)))) (cond ((save-match-data (string-match "*point face name\\*$" face)) (eyedrop-face-at-point)) (proxy (symbol-value (intern (substring proxy 1 (1- (length proxy)))))) (t (intern face))))))) (t (defun icicle-read-face-name (prompt &optional string-describing-default multiple) "Read a face name with completion and return its face symbol\nBy default, use the face(s) on the character after point.  If that\ncharacter has the property `read-face-name', that overrides the `face'\nproperty.\n\nPROMPT should be a string that describes what the caller will do with the face;\n  it should not end in a space.\nSTRING-DESCRIBING-DEFAULT should describe what default the caller will use if\n  the user just types RET; you can omit it.\nIf MULTIPLE is non-nil, return a list of faces (possibly only one).\nOtherwise, return a single face.\n\nIf option `icicle-add-proxy-candidates-flag' is non-nil, then you can\nalso enter the name of a face-name variable - its value is returned.\nA face-name variable is a variable with custom-type `face'.\n\nIf library `palette.el' or `eyedropper.el' is used, then you can also\nchoose proxy candidate `*point face name*' to use the face at point." (or (require 'palette nil t) (require 'eyedropper nil t)) (let ((faceprop (or (get-char-property (point) 'read-face-name) (get-char-property (point) 'face))) (aliasfaces nil) (nonaliasfaces nil) (icicle-proxy-candidates (and icicle-add-proxy-candidates-flag (let ((ipc nil)) (mapatoms (lambda (cand) (when (and (user-variable-p cand) (eq (get cand 'custom-type) 'face)) (push `,(concat "'" (symbol-name cand) "'") ipc)))) ipc))) faces) (when (save-match-data (string-match ": $" prompt)) (setq prompt (substring prompt 0 -2))) (when (memq (intern-soft (thing-at-point 'symbol)) (face-list)) (setq faces (list (intern-soft (thing-at-point 'symbol))))) (if (and (consp faceprop) (not (keywordp (car faceprop))) (not (memq (car faceprop) '(foreground-color background-color)))) (dolist (f faceprop) (when (symbolp f) (push f faces))) (when (and faceprop (symbolp faceprop)) (push faceprop faces))) (delete-dups faces) (cond (multiple (require 'crm) (mapatoms (lambda (s) (when (custom-facep s) (if (get s 'face-alias) (push (symbol-name s) aliasfaces) (push (symbol-name s) nonaliasfaces))))) (let* ((input (completing-read-multiple (if (or faces string-describing-default) (format "%s (default %s): " prompt (if faces (mapconcat 'symbol-name faces ",") string-describing-default)) (format "%s: " prompt)) (lambda (string predicate mode) (cond ((eq mode t) (or (all-completions string nonaliasfaces predicate) (all-completions string aliasfaces predicate))) ((eq mode nil) (or (try-completion string nonaliasfaces predicate) (try-completion string aliasfaces predicate))) (t (or (test-completion string nonaliasfaces predicate) (test-completion string aliasfaces predicate))))) nil t nil (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history) (and faces (mapconcat 'symbol-name faces ",")))) (output (cond ((or (equal input "") (equal input '(""))) faces) ((stringp input) (mapcar 'intern (split-string input ", *" t))) ((listp input) (mapcar 'intern input)) (input)))) output)) (t (when (consp faces) (setq faces (list (car faces)))) (let ((icicle-list-nth-parts-join-string ": ") (icicle-list-join-string ": ") (icicle-list-end-string "") (icicle-list-use-nth-parts '(1)) (face-list (face-list)) (def (if faces (mapconcat 'symbol-name faces ",") string-describing-default)) face) (put-text-property 0 1 'icicle-fancy-candidates t prompt) (while (equal "" (setq face (icicle-transform-multi-completion (completing-read (if def (format "%s (default %s): " prompt def) (format "%s: " prompt)) (mapcar #'icicle-make-face-candidate face-list) nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history) def))))) (let ((proxy (car (member face icicle-proxy-candidates)))) (if proxy (symbol-value (intern (substring proxy 1 (1- (length proxy))))) (intern face))))))))))

(autoload 'icicle-display-completion-list "icicles-fn" "\
Display the list of completions, COMPLETIONS, using `standard-output'.
Each element may be just a symbol or string or may be a list of two
strings to be printed as if concatenated.
If it is a list of two strings, the first is the actual completion
alternative, the second serves as annotation.
`standard-output' must be a buffer.
The actual completion alternatives, as inserted, are given the
`mouse-face' property of `highlight'.
At the end, this runs the normal hook `completion-setup-hook'.
It can find the completion buffer in `standard-output'.
The optional second arg is ignored.

\(fn COMPLETIONS &optional IGNORED)" nil nil)

;;;***

;;;### (autoloads (icicle-delete-windows-on icicle-remove-Completions-window
;;;;;;  icicle-toggle-case-sensitivity icicle-toggle-literal-replacement
;;;;;;  icicle-toggle-regexp-quote icicle-toggle-search-cleanup icicle-toggle-ignored-extensions
;;;;;;  icicle-dispatch-C-\. icicle-toggle-highlight-historical-candidates
;;;;;;  icicle-toggle-ignored-space-prefix icicle-toggle-show-multi-completion
;;;;;;  icicle-toggle-hiding-common-match icicle-toggle-highlight-all-current
;;;;;;  icicle-toggle-remote-file-testing icicle-dispatch-C-^ icicle-toggle-expand-to-common-match
;;;;;;  icicle-toggle-incremental-completion icicle-toggle-transforming
;;;;;;  icicle-toggle-proxy-candidates icicle-toggle-angle-brackets
;;;;;;  icicle-toggle-sorting icicle-toggle-alternative-sorting icicle-toggle-C-for-actions
;;;;;;  icicle-toggle-~-for-home-dir icicle-toggle-WYSIWYG-Completions
;;;;;;  icicle-isearch-complete icicle-history icicle-scroll-Completions-up
;;;;;;  icicle-scroll-Completions icicle-change-history-variable
;;;;;;  icicle-use-interactive-command-history icicle-other-history
;;;;;;  icicle-keep-only-past-inputs icicle-candidate-set-save-persistently
;;;;;;  icicle-candidate-set-save-to-variable icicle-add/update-saved-completion-set
;;;;;;  icicle-candidate-set-save-more-selected icicle-candidate-set-save-selected
;;;;;;  icicle-candidate-set-save-more icicle-candidate-set-save
;;;;;;  icicle-mouse-save-then-kill icicle-mouse-candidate-set-save-more
;;;;;;  icicle-mouse-candidate-set-save icicle-mouse-save/unsave-candidate
;;;;;;  icicle-save/unsave-candidate icicle-candidate-set-retrieve-persistent
;;;;;;  icicle-candidate-set-retrieve-from-variable icicle-candidate-set-retrieve-more
;;;;;;  icicle-candidate-set-retrieve-1 icicle-candidate-set-retrieve
;;;;;;  icicle-candidate-set-complement icicle-candidate-set-intersection
;;;;;;  icicle-candidate-set-union icicle-candidate-set-difference
;;;;;;  icicle-candidate-set-define icicle-candidate-set-swap icicle-read+insert-file-name
;;;;;;  icicle-completing-read+insert icicle-save-predicate-to-variable
;;;;;;  icicle-narrow-candidates-with-predicate icicle-apropos-complete-and-narrow
;;;;;;  icicle-apropos-complete-and-widen icicle-narrow-candidates
;;;;;;  icicle-widen-candidates icicle-Completions-mouse-3-menu icicle-mouse-candidate-read-fn-invoke
;;;;;;  icicle-candidate-read-fn-invoke icicle-help-on-candidate
;;;;;;  icicle-mouse-help-on-candidate icicle-delete-candidate-object
;;;;;;  icicle-mouse-remove-candidate icicle-remove-candidate icicle-mouse-candidate-alt-action
;;;;;;  icicle-mouse-candidate-action icicle-candidate-alt-action
;;;;;;  icicle-candidate-action icicle-all-candidates-list-alt-action
;;;;;;  icicle-all-candidates-list-action icicle-all-candidates-alt-action
;;;;;;  icicle-all-candidates-action icicle-beginning-of-line+ icicle-end-of-line+
;;;;;;  icicle-next-line icicle-previous-line icicle-move-to-next-completion
;;;;;;  icicle-move-to-previous-completion icicle-switch-to/from-minibuffer
;;;;;;  icicle-insert-completion icicle-switch-to-Completions-buf
;;;;;;  icicle-apropos-complete-no-display icicle-apropos-complete
;;;;;;  icicle-prefix-word-complete icicle-prefix-complete-no-display
;;;;;;  icicle-prefix-complete icicle-help-on-next-apropos-candidate
;;;;;;  icicle-help-on-previous-apropos-candidate icicle-help-on-next-prefix-candidate
;;;;;;  icicle-help-on-previous-prefix-candidate icicle-next-apropos-candidate-alt-action
;;;;;;  icicle-previous-apropos-candidate-alt-action icicle-next-prefix-candidate-alt-action
;;;;;;  icicle-previous-prefix-candidate-alt-action icicle-next-apropos-candidate-action
;;;;;;  icicle-previous-apropos-candidate-action icicle-next-prefix-candidate-action
;;;;;;  icicle-previous-prefix-candidate-action icicle-next-candidate-per-mode-help
;;;;;;  icicle-previous-candidate-per-mode-help icicle-next-candidate-per-mode-alt-action
;;;;;;  icicle-next-candidate-per-mode-action icicle-previous-candidate-per-mode-alt-action
;;;;;;  icicle-previous-candidate-per-mode-action icicle-next-apropos-candidate
;;;;;;  icicle-previous-apropos-candidate icicle-next-prefix-candidate
;;;;;;  icicle-previous-prefix-candidate icicle-previous-candidate-per-mode
;;;;;;  icicle-next-candidate-per-mode icicle-insert-newline-in-minibuffer
;;;;;;  icicle-pp-eval-expression-in-minibuffer icicle-insert-key-description
;;;;;;  icicle-toggle-search-whole-word icicle-dispatch-M-q icicle-insert-list-join-string
;;;;;;  icicle-insert-string-from-variable icicle-insert-string-at-point
;;;;;;  icicle-insert-history-element icicle-universal-argument-minus
;;;;;;  icicle-universal-argument-other-key icicle-universal-argument-more
;;;;;;  icicle-universal-argument icicle-negative-argument icicle-digit-argument
;;;;;;  icicle-abort-recursive-edit icicle-minibuffer-help icicle-reverse-sort-order
;;;;;;  icicle-change-alternative-sort-order icicle-search-define-replacement
;;;;;;  icicle-dispatch-M-comma icicle-change-sort-order icicle-next-S-TAB-completion-method
;;;;;;  icicle-next-TAB-completion-method icicle-doremi-increment-swank-prefix-length+
;;;;;;  icicle-doremi-increment-swank-timeout+ icicle-doremi-increment-max-candidates+
;;;;;;  icicle-toggle-dot icicle-toggle-search-replace-whole icicle-toggle-search-replace-common-match
;;;;;;  icicle-dispatch-M-_ icicle-erase-minibuffer icicle-insert-dot-command
;;;;;;  icicle-insert-a-space icicle-self-insert icicle-mouse-yank-secondary
;;;;;;  icicle-yank-pop icicle-yank icicle-transpose-sexps icicle-transpose-words
;;;;;;  icicle-transpose-chars icicle-goto/kill-failed-input icicle-up-directory
;;;;;;  icicle-make-directory icicle-kill-region icicle-kill-line
;;;;;;  icicle-kill-paragraph icicle-backward-kill-paragraph icicle-kill-sentence
;;;;;;  icicle-backward-kill-sentence icicle-kill-sexp icicle-backward-kill-sexp
;;;;;;  icicle-kill-word icicle-backward-kill-word icicle-delete-char
;;;;;;  icicle-delete-backward-char icicle-backward-delete-char-untabify
;;;;;;  icicle-backward-char-dots icicle-forward-char-dots icicle-erase-minibuffer-or-history-element
;;;;;;  icicle-switch-to-completions icicle-mouse-choose-completion
;;;;;;  icicle-choose-completion icicle-apropos-complete-and-exit
;;;;;;  icicle-minibuffer-complete-and-exit icicle-exit-minibuffer
;;;;;;  icicle-next-history-element) "icicles-mcmd" "icicles-mcmd.el"
;;;;;;  (19991 46054))
;;; Generated autoloads from icicles-mcmd.el

(autoload 'icicle-next-history-element "icicles-mcmd" "\
Insert the next element of the minibuffer history in the minibuffer.
With argument N, it uses the Nth following element.

\(fn ARG)" t nil)

(autoload 'icicle-exit-minibuffer "icicles-mcmd" "\
Terminate this minibuffer argument.
Remove `*Completions*' window.  Remove Icicles minibuffer faces.

\(fn)" t nil)

(autoload 'icicle-minibuffer-complete-and-exit "icicles-mcmd" "\
If the minibuffer contents is a valid completion, then exit.
Otherwise try to complete it.

\(fn)" t nil)

(autoload 'icicle-apropos-complete-and-exit "icicles-mcmd" "\
If the minibuffer contents is a valid apropos completion, then exit.
Otherwise try to complete it.  If completion leads to a valid
completion, then exit.
This is to `minibuffer-complete-and-exit' as `icicle-apropos-complete'
is to `minibuffer-complete'.  That is, it is the regexp-match version.

\(fn)" t nil)

(autoload 'icicle-choose-completion "icicles-mcmd" "\
Choose the completion that point is in or next to.

\(fn)" t nil)

(autoload 'icicle-mouse-choose-completion "icicles-mcmd" "\
Click a completion candidate in buffer `*Completions*', to choose it.
Return the number of the candidate: 0 for first, 1 for second, ...

\(fn EVENT)" t nil)

(autoload 'icicle-switch-to-completions "icicles-mcmd" "\
Select the completion list window, *Completions*.

\(fn)" t nil)

(autoload 'icicle-erase-minibuffer-or-history-element "icicles-mcmd" "\
`icicle-erase-minibuffer' or, if using history, delete history element.

\(fn)" t nil)

(autoload 'icicle-forward-char-dots "icicles-mcmd" "\
Move forward N chars (backward if N is negative).  Handles dots (`.').

\(fn &optional N)" t nil)

(autoload 'icicle-backward-char-dots "icicles-mcmd" "\
Move backward N chars (forward if N is negative).  Handles dots (`.').

\(fn &optional N)" t nil)

(autoload 'icicle-backward-delete-char-untabify "icicles-mcmd" "\
`backward-delete-char-untabify' + update *Completions* with matches.
Handles Icicles dots (`.').

\(fn N &optional KILLFLAG)" t nil)

(autoload 'icicle-delete-backward-char "icicles-mcmd" "\
`delete-backward-char' and update *Completions* with input matches.
Handles Icicles dots (`.').

\(fn N &optional KILLFLAG)" t nil)

(autoload 'icicle-delete-char "icicles-mcmd" "\
`delete-char' and update *Completions* with input matches.
Handles Icicles dots (`.').

\(fn N &optional KILLFLAG)" t nil)

(autoload 'icicle-backward-kill-word "icicles-mcmd" "\
`backward-kill-word' and update *Completions* with input matches.
See description of `backward-kill-word'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-word "icicles-mcmd" "\
`kill-word' and update *Completions* with regexp input matches.
See description of `kill-word'.

\(fn ARG)" t nil)

(autoload 'icicle-backward-kill-sexp "icicles-mcmd" "\
`backward-kill-sexp' and update *Completions* with input matches.
See description of `backward-kill-sexp'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-sexp "icicles-mcmd" "\
`kill-sexp' and update *Completions* with regexp input matches.
See description of `kill-sexp'.

\(fn ARG)" t nil)

(autoload 'icicle-backward-kill-sentence "icicles-mcmd" "\
`backward-kill-sentence' and update *Completions* with input matches.
See description of `backward-kill-sentence'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-sentence "icicles-mcmd" "\
`kill-sentence' and update *Completions* with regexp input matches.
See description of `kill-sentence'.

\(fn ARG)" t nil)

(autoload 'icicle-backward-kill-paragraph "icicles-mcmd" "\
`backward-kill-paragraph' and update *Completions* with input matches.
See description of `backward-kill-paragraph'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-paragraph "icicles-mcmd" "\
`kill-paragraph' and update *Completions* with regexp input matches.
See description of `kill-paragraph'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-line "icicles-mcmd" "\
`kill-line' and update *Completions* with regexp input matches.
See description of `kill-line'.

\(fn ARG)" t nil)

(autoload 'icicle-kill-region "icicles-mcmd" "\
`kill-region' and update *Completions* with regexp input matches.
See description of `kill-region'.

\(fn BEG END)" t nil)

(when (fboundp 'kill-region-wimpy) (defun icicle-kill-region-wimpy (beg end) "`kill-region-wimpy' and update *Completions* with input matches.\nSee description of `kill-region-wimpy'." (interactive "r") (icicle-call-then-update-Completions #'kill-region-wimpy beg end)))

(autoload 'icicle-make-directory "icicles-mcmd" "\
Create a directory.

\(fn DIR)" t nil)

(autoload 'icicle-up-directory "icicles-mcmd" "\
Replace minibuffer input with parent directory, then upate *Completions*.

\(fn)" t nil)

(autoload 'icicle-goto/kill-failed-input "icicles-mcmd" "\
Go to start of input portion that does not complete.  Repeat to kill.
Kill (delete) the part of the input that does not complete.
Repeat to delete more.

\(fn)" t nil)

(autoload 'icicle-transpose-chars "icicles-mcmd" "\
`transpose-chars' and update *Completions* with regexp input matches.
Handles Icicles dots (`.').

\(fn ARG)" t nil)

(autoload 'icicle-transpose-words "icicles-mcmd" "\
`transpose-words' and update *Completions* with regexp input matches.
See description of `transpose-words'.

\(fn ARG)" t nil)

(autoload 'icicle-transpose-sexps "icicles-mcmd" "\
`transpose-sexps' and update *Completions* with regexp input matches.
See description of `transpose-sexps'.

\(fn ARG)" t nil)

(autoload 'icicle-yank "icicles-mcmd" "\
`yank' and update *Completions* with regexp input matches.
See description of `yank'.

\(fn ARG)" t nil)

(autoload 'icicle-yank-pop "icicles-mcmd" "\
`yank-pop' and update *Completions* with regexp input matches.
See description of `yank-pop'.

\(fn ARG)" t nil)

(when (fboundp 'yank-secondary) (defun icicle-yank-secondary nil "Insert the secondary selection at point.\nMove point to the end of the inserted text.  Does not change mark." (interactive "*") (icicle-call-then-update-Completions #'yank-secondary)) (put 'icicle-yank-secondary 'delete-selection 'yank))

(autoload 'icicle-mouse-yank-secondary "icicles-mcmd" "\
Insert the secondary selection where you click.
Move point to the end of the inserted text.
If `mouse-yank-at-point' is non-nil, insert at point
regardless of where you click.

\(fn EVENT)" t nil)

(autoload 'icicle-self-insert "icicles-mcmd" "\
`self-insert' and update *Completions* with regexp input matches.
See description of `self-insert'.

\(fn N)" t nil)

(autoload 'icicle-insert-a-space "icicles-mcmd" "\
Insert a space.
For convenience in the minibuffer - does the same thing as `C-q SPC'.
To use this, bind it to some key sequence in keymaps
`minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', and
`minibuffer-local-must-match-map'.

\(fn)" t nil)

(autoload 'icicle-insert-dot-command "icicles-mcmd" "\
Insert `icicle-dot-string': either `.' or `icicle-anychar-regexp'.
With a numeric prefix argument, insert the dot that many times.

With a plain prefix arg (`C-u'), insert the opposite kind of dot
\(once) from what is indicated by the current value of
`icicle-dot-string'.

\(fn &optional ARG)" t nil)

(autoload 'icicle-erase-minibuffer "icicles-mcmd" "\
Delete all user input in the minibuffer, then update completions.

\(fn)" t nil)

(icicle-define-sort-command "alphabetical" icicle-case-string-less-p "Sort completion candidates alphabetically.\nIgnore letter case if `completion-ignore-case' or `case-fold-search'\nis non-nil.")

(icicle-define-sort-command "special candidates first" icicle-special-candidates-first-p "Sort completion candidates by putting special candidates first.\nOtherwise, sorting is alphabetical.  Ignore letter case if\n`completion-ignore-case' or `case-fold-search' is non-nil.")

(icicle-define-sort-command "extra candidates first" icicle-extra-candidates-first-p "Sort completion candidates by putting extra candidates first.\nOtherwise, sorting is alphabetical.  Ignore letter case if\n`completion-ignore-case' or `case-fold-search' is non-nil.\nAn extra candidate is one that is a member of\n`icicle-extra-candidates'.")

(icicle-define-sort-command "proxy candidates first" icicle-proxy-candidate-first-p "Sort completion candidates by putting proxy candidates first.\nOtherwise, sorting is alphabetical.  Ignore letter case if\n`completion-ignore-case' or `case-fold-search' is non-nil.")

(icicle-define-sort-command "case insensitive" icicle-case-insensitive-string-less-p "Sort completion candidates alphabetically, but case-insenstively.")

(icicle-define-sort-command "by 2nd parts alphabetically" icicle-2nd-part-string-less-p "Sort multi-completion candidates alphabetically by their second parts.\nAfter that, sort alphabetically by the first parts.  Ignore letter\ncase if `completion-ignore-case' or `case-fold-search' is non-nil.")

(icicle-define-sort-command "by last file modification time" icicle-last-modified-first-p "Sort file-name completion candidates in order of last modification.\nIf not doing file-name completion, then sort alphabetically.")

(icicle-define-sort-command "by directories first" icicle-dirs-first-p "Sort file-name completion candidates so that directories are first.\nIf not doing file-name completion, then sort alphabetically.")

(icicle-define-sort-command "by directories last" icicle-dirs-last-p "Sort file-name completion candidates so that directories are last.\nIf not doing file-name completion, then sort alphabetically.")

(icicle-define-sort-command "by last use as input" icicle-most-recent-first-p "Sort completion candidates in order of last use as minibuffer input.")

(icicle-define-sort-command "by previous use alphabetically" icicle-historical-alphabetic-p "Sort completion candidates by previous use and alphabetically.\nCandidates matching previous inputs are available first.  Candidates\nare in two groups, each of which is sorted alphabetically separately:\nthose matching previous inputs, followed by those that have not yet\nbeen used.")

(icicle-define-sort-command "by abbrev frequency" icicle-command-abbrev-used-more-p "Sort abbrev completion candidates by frequency of use\nOtherwise, sort alphabetically.  Ignore letter case if\n`completion-ignore-case' or `case-fold-search' is non-nil.")

(icicle-define-sort-command "turned OFF" nil "Do not sort completion candidates.")

(autoload 'icicle-dispatch-M-_ "icicles-mcmd" "\
Do the right thing for `M-_'.
During Icicles search, call `icicle-toggle-search-replace-whole'.
Otherwise, call `icicle-toggle-ignored-space-prefix'.

Bound to `M-_' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-search-replace-common-match "icicles-mcmd" "\
Toggle the value of `icicle-search-replace-common-match-flag'.
Note that that option has no effect if
`icicle-expand-input-to-common-match-flag' is nil.
Bound to `M-;' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-search-replace-whole "icicles-mcmd" "\
Toggle the value of `icicle-search-replace-whole-candidate-flag'.
Bound to `M-_' in the minibuffer when searching.

\(fn)" t nil)

(autoload 'icicle-toggle-dot "icicles-mcmd" "\
Toggle `icicle-dot-string' between `.' and `icicle-anychar-regexp'.
Bound to C-M-.' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-doremi-increment-max-candidates+ "icicles-mcmd" "\
Change `icicle-max-candidates' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
 use the `Meta' key (e.g. `M-up') to increment in larger steps.
You can use a numeric prefix arg to specify the increment.
A plain prefix arg (`C-u') resets `icicle-max-candidates' to nil,
 meaning no limit.

\(fn &optional INCREMENT)" t nil)

(autoload 'icicle-doremi-increment-swank-timeout+ "icicles-mcmd" "\
Change `icicle-swank-timeout' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-up') to increment in larger steps.

\(fn)" t nil)

(autoload 'icicle-doremi-increment-swank-prefix-length+ "icicles-mcmd" "\
Change `icicle-swank-prefix-length' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-up') to increment in larger steps.

\(fn)" t nil)

(autoload 'icicle-next-TAB-completion-method "icicles-mcmd" "\
Cycle to the next `TAB' completion method.
Bound to \\<minibuffer-local-completion-map>`\\[icicle-next-TAB-completion-method]' in the minibuffer.
Option `icicle-TAB-completion-methods' determines the TAB completion
methods that are available.

\(fn)" t nil)

(autoload 'icicle-next-S-TAB-completion-method "icicles-mcmd" "\
Cycle to the next `S-TAB' completion method.
Bound to `M-(' in the minibuffer.
Option `icicle-S-TAB-completion-methods-alist' customizes the
available TAB completion methods.

\(fn)" t nil)

(autoload 'icicle-change-sort-order "icicles-mcmd" "\
Choose a sort order.
With a numeric prefix arg, reverse the current sort order.

If plain `C-u' is used or `C-u' is not used at all:

- Use completion if `icicle-change-sort-order-completion-flag' is
  non-nil and no prefix arg is used, or if it is nil and a prefix arg
  is used.

- Otherwise, just cycle to the next sort order.

This command updates `icicle-sort-comparer'.  Non-interactively,
optional arg ALTERNATIVEP means change the current alternative sort
order instead, updating `icicle-alternative-sort-comparer'.

\(fn &optional ARG ALTERNATIVEP)" t nil)

(autoload 'icicle-dispatch-M-comma "icicles-mcmd" "\
Do the right thing for `M-,'.
If sorting is possible, call `icicle-change-alternative-sort-order'.
If using `icicle-search', call `icicle-search-define-replacement'.
Otherwise, do nothing.

Bound to `M-,' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-search-define-replacement "icicles-mcmd" "\
Prompt user and set new value of `icicle-search-replacement'.
Bound to `M-,' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-change-alternative-sort-order "icicles-mcmd" "\
Choose an alternative sort order.
Similar to command `icicle-change-sort-order', but change the
alternative sort order, not the current sort order.

\(fn &optional ARG)" t nil)

(autoload 'icicle-reverse-sort-order "icicles-mcmd" "\
Reverse the current sort order.

\(fn)" t nil)

(autoload 'icicle-minibuffer-help "icicles-mcmd" "\
Describe Icicles minibuffer and *Completion* buffer bindings.

\(fn)" t nil)

(autoload 'icicle-abort-recursive-edit "icicles-mcmd" "\
Abort command that requested this recursive edit or minibuffer input.
This calls `abort-recursive-edit' after killing the *Completions*
buffer or (if called from the minibuffer) removing its window.

By default, Icicle mode remaps all key sequences that are normally
bound to `abort-recursive-edit' to `icicle-abort-recursive-edit'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.

\(fn)" t nil)

(autoload 'icicle-digit-argument "icicles-mcmd" "\
`digit-argument', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-negative-argument "icicles-mcmd" "\
`negative-argument', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-universal-argument "icicles-mcmd" "\
`universal-argument', but also echo the prefix.

\(fn)" t nil)

(autoload 'icicle-universal-argument-more "icicles-mcmd" "\
`universal-argument-more', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-universal-argument-other-key "icicles-mcmd" "\
`universal-argument-other-key', but also echo the prefix.

\(fn ARG)" t nil)

(autoload 'icicle-universal-argument-minus "icicles-mcmd" "\
`universal-argument-minus', but also echo the prefix.

\(fn ARG)" t nil)

(when (> emacs-major-version 22) (defun icicle-sit-for (seconds &optional nodisp obsolete) "Perform redisplay, then wait for SECONDS seconds or until input is available.\nSECONDS may be a floating-point value.\n(On operating systems that do not support waiting for fractions of a\nsecond, floating-point values are rounded down to the nearest integer.)\n\nIf optional arg NODISP is t, don't redisplay, just wait for input.\nRedisplay does not happen if input is available before it starts.\n\nValue is t if waited the full time with no input arriving, and nil otherwise.\n\nAn obsolete, but still supported form is\n(sit-for SECONDS &optional MILLISECONDS NODISP)\nwhere the optional arg MILLISECONDS specifies an additional wait period,\nin milliseconds; this was useful when Emacs was built without\nfloating point support." (if (numberp nodisp) (setq seconds (+ seconds (* 0.001 nodisp)) nodisp obsolete) (if obsolete (setq nodisp obsolete))) (cond (noninteractive (sleep-for seconds) t) ((input-pending-p) nil) ((<= seconds 0) (or nodisp (redisplay))) (t (or nodisp (redisplay)) (let ((read (read-event nil nil seconds))) (or (null read) (progn (if (memq overriding-terminal-local-map (list universal-argument-map icicle-universal-argument-map)) (setq read (cons t read))) (push read unread-command-events) nil)))))))

(autoload 'icicle-insert-history-element "icicles-mcmd" "\
Use completion to insert a previously entered input in the minibuffer.
Always available for any minibuffer input, not just during completion.

\(fn)" t nil)

(autoload 'icicle-insert-string-at-point "icicles-mcmd" "\
Insert text at the cursor into the minibuffer.
Each time this command is called, some text at or near the cursor is
inserted into the minibuffer.  One of two things happens, depending on
the value of option `icicle-default-thing-insertion' and whether or
not you use `C-u'.

`icicle-thing-at-point-functions' is a cons of two parts - call them
ALTERNATIVES and FORWARD-THING.

If ALTERNATIVES is not nil and one of the following is true:
 - FORWARD-THING is nil
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have not used plain `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have used plain `C-u' in this series of `M-.'
then the next function in ALTERNATIVES is used to retrieve the text to
be inserted.

If FORWARD-THING is not nil and one of the following is true:
 - ALTERNATIVES is nil
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have not used `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have used `C-u' in this series of `M-.'
then function FORWARD-THING is used to retrieve the text to be
inserted.

If you use a numeric prefix argument (not just plain `C-u'), then
function FORWARD-THING is used to retrieve the text to be inserted,
and the argument determines the number of things to grab.  It also
determines the direction of thing-grabbing: A negative argument grabs
text to the left of the cursor; a positive argument grabs text to the
right.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-insert-string-at-point]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-insert-string-from-variable "icicles-mcmd" "\
Insert text into the minibuffer from a variable.
By default, the variable is user option `icicle-input-string'.
To insert from a different variable, use a prefix argument; you are
then prompted for the variable to use.  You can use command
`icicle-save-string-to-variable' to save a string to a variable.
Typically, you store a regexp or part of a regexp in the variable.
This command is bound in the minibuffer to `C-=', by default.
This is especially useful when used with command `icicle-search'.

Some regexps that you might want to assign to variables:

 \"[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\"          ; Email address
 \"\\\\([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+\\\\)\"     ; IP address
 \"[0-9]\\\\\\={4\\\\}-[0-9]\\\\\\={2\\\\}-[0-9]\\\\\\={2\\\\}\"   ; Date: 2006-04-14, Time:
 \"^[ \\=\\t]*[0-9]?[0-9]\\\\([:.]?[0-9][0-9]\\\\)?\\\\(am\\\\|pm\\\\|AM\\\\|PM\\\\)?\"
 \"`\\\\(\\\\sw\\\\sw+\\\\)'\"                        ; Words inside `_'
 \"\\\\*.*\\\\*\"                                 ; Special buffer name: *_*

Standard Emacs Lisp libraries are full of regexps that you can assign
to variables for use with `C-='.
 See `align.el' for regexps for programming languages.
 See `url-dav.el' for regexps matching iso8601 dates.
 See `rmail.el', `sendmail.el', and `mh-show.el' for regexps matching
 mail-header fields.

Imenu regexps occurring as parts of different values of
`imenu-generic-expression' for different buffer types can be used as
variable values for `C-='.  They all work fine with `icicle-search',
turning it into a browser or navigator for the given mode.

See, for example, `generic-x.el' and `lisp-mode.el'.  Here is a regexp
for Javascript function definitions from `generic-x.el':

 \"^function\\\\s-+\\\\([A-Za-z0-9_]+\\\\)\"

And `lisp-imenu-generic-expression' (in `lisp-mode.el') provides
regexps for Lisp function, variable, and type definitions.  Here is
the variable-definition regexp:

 \"^\\\\s-*(\\\\(def\\\\(c\\\\(onst\\\\(ant\\\\)?\\\\|ustom\\\\)\\\\|ine-symbol-macro\\\\|
 parameter\\\\|var\\\\)\\\\)\\\\s-+\\\\(\\\\(\\\\sw\\\\|\\\\s_\\\\)+\\\\)\"

Command `icicle-imenu' exploits this to automatically let you browse
definitions.  It is a specialization of `icicle-search' for Imenu.

For more useful regexps, grep for `font-lock-keywords' in Emacs `lisp'
directory and subdirs.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]').

\(fn ASKP)" t nil)

(autoload 'icicle-insert-list-join-string "icicles-mcmd" "\
Insert `icicle-list-join-string' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-dispatch-M-q "icicles-mcmd" "\
Do the right thing for `M-q'.
If searching, call `icicle-toggle-search-whole-word'.
Otherwise, call `icicle-insert-key-description'.
Bound to `M-q' in the minibuffer.

\(fn &optional ARG)" t nil)

(autoload 'icicle-toggle-search-whole-word "icicles-mcmd" "\
Toggle the value of `icicle-search-whole-word-flag'.
The new value takes effect for the next Icicles search command.
Bound to `M-q' in the minibuffer when searching.

\(fn)" t nil)

(autoload 'icicle-insert-key-description "icicles-mcmd" "\
Read key and insert its description.
For example, if the key read is ^F, then \"C-f\" is inserted.

`icicle-key-descriptions-use-<>-flag' determines whether angle
brackets (`<', `>') are used for named keys, such as function
keys, but a prefix argument reverses the meaning of
`icicle-key-descriptions-use-<>-flag'.

Bound to `M-q' in the minibuffer during key completion.

\(fn TOGGLE-ANGLE-BRACKETS-P)" t nil)

(autoload 'icicle-pp-eval-expression-in-minibuffer "icicles-mcmd" "\
Evaluate an Emacs-Lisp expression and pretty-print its value.
This just calls `pp-eval-expression' from a recursive minibuffer.

\(fn INSERT-VALUE)" t nil)

(autoload 'icicle-insert-newline-in-minibuffer "icicles-mcmd" "\
Insert a newline character (`C-j'), in the minibuffer.
Then, if `1on1-fit-minibuffer-frame' is defined, call it to fit a
standalone minibuffer frame to the new minibuffer contents.

\(fn ARG)" t nil)

(autoload 'icicle-next-candidate-per-mode "icicles-mcmd" "\
Replace input by NTH next completion candidate.
Default value of NTH is 1, meaning use the next candidate.
Negative NTH means use a previous, not subsequent, candidate.

Uses the next prefix or apropos completion command, depending on
`icicle-current-completion-mode'.  If that is nil and
`icicle-default-cycling-mode' is non-nil, uses the next history
element instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode "icicles-mcmd" "\
Replace input by NTH previous completion candidate.
Default value of NTH is 1, meaning use the previous candidate.
Negative NTH means use a subsequent, not previous, candidate.

Uses the previous prefix or apropos completion command, depending on
`icicle-current-completion-mode'. If that is nil and
`icicle-default-cycling-mode' is non-nil, uses the previous history
element instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-prefix-candidate "icicles-mcmd" "\
Replace input by NTH previous prefix completion for an input.
Default value of NTH is 1, meaning use the previous prefix completion.
Negative NTH means use a subsequent, not previous, prefix completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-prefix-candidate "icicles-mcmd" "\
Replace input by NTH next prefix completion for an input.
Default value of NTH is 1, meaning use the next prefix completion.
Negative NTH means use a previous, not subsequent, prefix completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-apropos-candidate "icicles-mcmd" "\
Replace input by NTH previous apropos completion for an input.
Default value of NTH is 1, meaning use the previous apropos completion.
Negative NTH means use a subsequent, not previous, apropos completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-apropos-candidate "icicles-mcmd" "\
Replace input by NTH next apropos completion for an input.
Default value of NTH is 1, meaning use the next apropos completion.
Negative NTH means use a previous, not subsequent, apropos completion.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode-action "icicles-mcmd" "\
`icicle-previous-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode-alt-action "icicles-mcmd" "\
`icicle-previous-candidate-per-mode' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-candidate-per-mode-action "icicles-mcmd" "\
`icicle-next-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-candidate-per-mode-alt-action "icicles-mcmd" "\
`icicle-next-candidate-per-mode' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-candidate-per-mode-help "icicles-mcmd" "\
`icicle-previous-candidate-per-mode' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-candidate-per-mode-help]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-candidate-per-mode-help "icicles-mcmd" "\
`icicle-next-candidate-per-mode' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-candidate-per-mode-help]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-prefix-candidate-action "icicles-mcmd" "\
`icicle-previous-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-prefix-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-prefix-candidate-action "icicles-mcmd" "\
`icicle-next-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-prefix-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-apropos-candidate-action "icicles-mcmd" "\
`icicle-previous-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-apropos-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-apropos-candidate-action "icicles-mcmd" "\
`icicle-next-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-apropos-candidate-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-prefix-candidate-alt-action "icicles-mcmd" "\
`icicle-previous-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-prefix-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-prefix-candidate-alt-action "icicles-mcmd" "\
`icicle-next-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-prefix-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-previous-apropos-candidate-alt-action "icicles-mcmd" "\
`icicle-previous-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-previous-apropos-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-next-apropos-candidate-alt-action "icicles-mcmd" "\
`icicle-next-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-next-apropos-candidate-alt-action]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-previous-prefix-candidate "icicles-mcmd" "\
`icicle-previous-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-previous-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-next-prefix-candidate "icicles-mcmd" "\
`icicle-next-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-next-prefix-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-previous-apropos-candidate "icicles-mcmd" "\
`icicle-previous-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-previous-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-help-on-next-apropos-candidate "icicles-mcmd" "\
`icicle-next-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-help-on-next-apropos-candidate]').

\(fn &optional NTH)" t nil)

(autoload 'icicle-prefix-complete "icicles-mcmd" "\
Complete the minibuffer contents as far as possible, as a prefix.
Repeat this to cycle among candidate completions.
If no characters can be completed, display the possible completions.
Candidate completions are appropriate names whose prefix is the
minibuffer input, where appropriateness is determined by the context
\(command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-prefix-complete]').

\(fn)" t nil)

(autoload 'icicle-prefix-complete-no-display "icicles-mcmd" "\
Like `icicle-prefix-complete', but without displaying *Completions*.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-prefix-complete-no-display]').

\(fn &optional NO-MSG-P)" t nil)

(autoload 'icicle-prefix-word-complete "icicles-mcmd" "\
Complete the minibuffer contents at most a single word.
Repeating this completes additional words.
Spaces and hyphens in candidates are considered word separators.
If only a single candidate matches, the input is completed entirely.
Return nil if there is no valid completion, else t.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-prefix-word-complete]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete "icicles-mcmd" "\
Complete the minibuffer contents as far as possible.
Repeat this to cycle among candidate completions.
This uses \"apropos completion\", defined as follows:
A completion contains the minibuffer input somewhere, as a substring.
Display a list of possible completions in buffer *Completions*.
Candidate completions are appropriate names that match the current
input, taken as a regular expression, where appropriateness is
determined by the context (command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete-no-display "icicles-mcmd" "\
Like `icicle-apropos-complete', but without displaying *Completions*.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-no-display]').

\(fn &optional NO-MSG-P)" t nil)

(autoload 'icicle-switch-to-Completions-buf "icicles-mcmd" "\
Select the completion list window.
The cursor is placed on the first occurrence of the current minibuffer
content.  You can use \\<completion-list-mode-map>`\\[icicle-insert-completion]' to get back to the minibuffer.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-switch-to-Completions-buf]').

\(fn)" t nil)

(autoload 'icicle-insert-completion "icicles-mcmd" "\
Select the active minibuffer window.  Insert current completion.
The current candidate in *Completions* (under the cursor) is inserted
into the minibuffer as the current input.  You can use \\<minibuffer-local-completion-map>`\\[icicle-switch-to-Completions-buf]'
to switch to the *Completions* window.

You can use this command only from buffer *Completions* (`\\<completion-list-mode-map>\\[icicle-insert-completion]').

Non-interactively, optional arg COMPLETION is the completion inserted.

\(fn &optional COMPLETION)" t nil)

(autoload 'icicle-switch-to/from-minibuffer "icicles-mcmd" "\
Switch to minibuffer or previous buffer, in other window.
If current buffer is the minibuffer, then switch to the buffer that
was previously current.  Otherwise, switch to the minibuffer.

\(fn)" t nil)

(autoload 'icicle-move-to-previous-completion "icicles-mcmd" "\
Move to the previous item in the completion list.

You can use this command only from buffer *Completions* (`\\<completion-list-mode-map>\\[icicle-move-to-previous-completion]').

\(fn N)" t nil)

(autoload 'icicle-move-to-next-completion "icicles-mcmd" "\
Move to the next item in the completion list.
With prefix argument N, move N items (negative N means move backward).
Optional second argument, if non-nil, means do not copy the completion
back to the minibuffer.

You can use this command only from buffer *Completions* (`\\<completion-list-mode-map>\\[icicle-move-to-next-completion]').

\(fn N &optional NO-MINIBUFFER-FOLLOW-P)" t nil)

(autoload 'icicle-previous-line "icicles-mcmd" "\
Move up a line, in *Completions* buffer.  Wrap around first to last.
You can use this command only from buffer *Completions* (`\\<completion-list-mode-map>\\[icicle-previous-line]').

\(fn)" t nil)

(autoload 'icicle-next-line "icicles-mcmd" "\
Move down a line, in *Completions* buffer.  Wrap around last to first.
You can use this command only from buffer *Completions* (`\\<completion-list-mode-map>\\[icicle-next-line]').

\(fn)" t nil)

(autoload 'icicle-end-of-line+ "icicles-mcmd" "\
Move cursor to end of current line or end of next line if repeated.
This is similar to `end-of-line', but:
  If called interactively with no prefix arg:
     If the previous command was also `end-of-line+', then move to the
     end of the next line.  Else, move to the end of the current line.
  Otherwise, move to the end of the Nth next line (Nth previous line
     if N<0).  Command `end-of-line', by contrast, moves to the end of
     the (N-1)th next line.

\(fn &optional N)" t nil)

(autoload 'icicle-beginning-of-line+ "icicles-mcmd" "\
Move cursor to beginning of current line or next line if repeated.
This is the similar to `beginning-of-line', but:
1. With arg N, the direction is the opposite: this command moves
   backward, not forward, N lines.
2. If called interactively with no prefix arg:
      If the previous command was also `beginning-of-line+', then move
      to the beginning of the previous line.  Else, move to the
      beginning of the current line.
   Otherwise, move to the beginning of the Nth previous line (Nth next
      line if N<0).  Command `beginning-of-line', by contrast, moves to
      the beginning of the (N-1)th next line.

\(fn &optional N)" t nil)

(autoload 'icicle-all-candidates-action "icicles-mcmd" "\
Take action on each completion candidate, in turn.
Apply `icicle-candidate-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-candidate-action-fn' is nil but
`icicle-all-candidates-list-action-fn' is not, then apply the latter
to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-action]').

\(fn)" t nil)

(autoload 'icicle-all-candidates-alt-action "icicles-mcmd" "\
Take alternative action on each completion candidate, in turn.
Apply `icicle-candidate-alt-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-candidate-alt-action-fn' is nil but
`icicle-all-candidates-list-alt-action-fn' is not, then apply the
latter to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-alt-action]').

\(fn)" t nil)

(autoload 'icicle-all-candidates-list-action "icicles-mcmd" "\
Take action on the list of all completion candidates.
Apply `icicle-all-candidates-list-action-fn' to the list of saved
completion candidates or the list of candidates that match the current
input (a regular expression).

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-action-fn' is nil but
`icicle-candidate-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-list-action]').

\(fn)" t nil)

(autoload 'icicle-all-candidates-list-alt-action "icicles-mcmd" "\
Take alternative action on the list of all completion candidates.
Apply `icicle-all-candidates-list-alt-action-fn' to the list of saved
completion candidates or the list of completion candidates that match
the current input (a regular expression).

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-alt-action-fn' is nil but
`icicle-candidate-alt-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-all-candidates-list-alt-action]').

\(fn)" t nil)

(autoload 'icicle-candidate-action "icicles-mcmd" "\
Take action on the current minibuffer-completion candidate.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the current candidate, to perform the action.

If no action is available in the current context, help on the
candidate is shown - see `icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-action]').

\(fn)" t nil)

(autoload 'icicle-candidate-alt-action "icicles-mcmd" "\
Take alternative action on the current completion candidate.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the current candidate, to perform the action.

For many Icicles commands, if `icicle-candidate-alt-action-fn' is nil,
you are prompted to choose an alternative action, using completion.

In any case, any alternative action defined for the current context by
user option `icicle-alternative-actions-alist' always overrides
`icicle-candidate-alt-action'.  That is, if
`icicle-alternative-actions-alist' says to use function `foo', then
Icicles uses `foo' as the alternative action, regardless of the value
of `icicle-candidate-alt-action'.

If no alternative action is available in the current context, help on
the candidate is shown - see `icicle-help-on-candidate'.  

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-alt-action]').

\(fn)" t nil)

(autoload 'icicle-mouse-candidate-action "icicles-mcmd" "\
Take action on the completion candidate clicked by `mouse-2'.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.

\(fn EVENT)" t nil)

(autoload 'icicle-mouse-candidate-alt-action "icicles-mcmd" "\
Take alternative action on the candidate clicked by `mouse-2'.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.

\(fn EVENT)" t nil)

(autoload 'icicle-remove-candidate "icicles-mcmd" "\
Remove current completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

Note: For Emacs versions prior to 22, this does not really remove a
file-name candidate as a possible candidate.  If you use \\<minibuffer-local-completion-map>\\[icicle-prefix-complete] or \\[icicle-apropos-complete],
it will reappear as a possible candidate.

You can use this command only from the minibuffer (`\\[icicle-remove-candidate]').

\(fn)" t nil)

(autoload 'icicle-mouse-remove-candidate "icicles-mcmd" "\
Remove clicked completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

See `icicle-remove-candidate' for more information.

\(fn EVENT)" t nil)

(autoload 'icicle-delete-candidate-object "icicles-mcmd" "\
Delete the object named by the current completion candidate.
With a prefix argument, delete *ALL* objects named by the current set
of candidates, after confirmation.

Do nothing if `icicle-deletion-action-flag' is nil.

Otherwise:

* If the value of variable `icicle-delete-candidate-object' is a
  function, then apply it to the current completion candidate.  This
  should delete some object named by the completion candidate.

* If `icicle-delete-candidate-object' is not a function, then it
  should be a symbol bound to an alist.  In this case, invoke
  `icicle-delete-candidate-object' to delete the object named by the
  current completion candidate from that alist.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-delete-candidate-object]').

\(fn &optional ALLP)" t nil)

(autoload 'icicle-mouse-help-on-candidate "icicles-mcmd" "\
Display help on the minibuffer-completion candidate clicked by mouse.

\(fn EVENT)" t nil)

(autoload 'icicle-help-on-candidate "icicles-mcmd" "\
Display help on the current minibuffer-completion candidate.
The help displayed depends on the type of candidate, as follows:

 menu item - the corresponding command is described using
             `describe-function' (only if `lacarte.el' is loaded)
 command or other function - described using `describe-function'
 keymap variable - described using `describe-keymap'
                   (if available - see library `help-fns+.el')
 user option or other variable - described using `describe-variable'
 face - described using `describe-face'
 command abbreviation - described using `apropos-command' for matches
 property list - described using `apropos-describe-plist'
 buffer name - modes described using `describe-mode' (Emacs > 20)
 file name - file properties described

If the same candidate names a function, a variable, and a face, or any
two of these, then all such documentation is shown (Emacs 22+).

In the minibuffer, you can also use `C-M-down', `C-M-up',
`C-M-wheel-down', `C-M-wheel-up', `C-M-next', `C-M-prior', `C-M-end',
and `C-M-home', to display help on the candidate and then move to the
next or previous candidate.  See, for example,
`icicle-help-on-next-apropos-candidate'.

You can use this command only from the minibuffer or *Completions*
\(`\\[icicle-help-on-candidate]').

\(fn &optional CAND)" t nil)

(if (and (not (fboundp 'icicle-describe-file)) (fboundp 'describe-file)) (defalias 'icicle-describe-file (symbol-function 'describe-file)) (defun icicle-describe-file (filename) "Describe the file named FILENAME.\nIf FILENAME is nil, describe the current directory." (interactive "FDescribe file: ") (unless filename (setq filename default-directory)) (help-setup-xref (list #'icicle-describe-file filename) (interactive-p)) (let ((attrs (file-attributes filename))) (unless attrs (error (format "Cannot open file `%s'" filename))) (let* ((type (nth 0 attrs)) (numlinks (nth 1 attrs)) (uid (nth 2 attrs)) (gid (nth 3 attrs)) (last-access (nth 4 attrs)) (last-mod (nth 5 attrs)) (last-status-chg (nth 6 attrs)) (size (nth 7 attrs)) (permissions (nth 8 attrs)) (inode (nth 10 attrs)) (device (nth 11 attrs)) (help-text (concat (format "Properties of `%s':\n\n" filename) (format "Type:                       %s\n" (cond ((eq t type) "Directory") ((stringp type) (format "Symbolic link to `%s'" type)) (t "Normal file"))) (format "Permissions:                %s\n" permissions) (and (not (eq t type)) (format "Size in bytes:              %g\n" size)) (format-time-string "Time of last access:        %a %b %e %T %Y (%Z)\n" last-access) (format-time-string "Time of last modification:  %a %b %e %T %Y (%Z)\n" last-mod) (format-time-string "Time of last status change: %a %b %e %T %Y (%Z)\n" last-status-chg) (format "Number of links:            %d\n" numlinks) (format "User ID (UID):              %s\n" uid) (format "Group ID (GID):             %s\n" gid) (format "Inode:                      %S\n" inode) (format "Device number:              %s\n" device)))) (with-output-to-temp-buffer "*Help*" (princ help-text)) help-text))))

(autoload 'icicle-candidate-read-fn-invoke "icicles-mcmd" "\
Read function name.  Invoke function on current completion candidate.
Set `icicle-candidate-action-fn' to the interned name.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-read-fn-invoke]').

\(fn)" t nil)

(autoload 'icicle-mouse-candidate-read-fn-invoke "icicles-mcmd" "\
Read function name.  Invoke function on candidate clicked by mouse.

\(fn EVENT)" t nil)

(autoload 'icicle-Completions-mouse-3-menu "icicles-mcmd" "\
Pop-up menu on `C-mouse-3' for the current candidate in *Completions*.

\(fn EVENT)" t nil)

(autoload 'icicle-widen-candidates "icicles-mcmd" "\
Complete, allowing also candidates that match an alternative regexp.
You are prompted for the alternative input pattern.  Use `RET' to
enter it.

To (apropos) complete using a wider set of candidates, you use this
command after you have completed (`TAB' or `S-TAB').  A shortcut is to
use `\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-and-widen]' - it is the same as `S-TAB' followed by `\\[icicle-widen-candidates]'.

This command turns off `icicle-expand-input-to-common-match-flag', for
clarity.  You can use `\\[icicle-toggle-expand-to-common-match]' to toggle that option.

\(fn)" t nil)

(autoload 'icicle-narrow-candidates "icicles-mcmd" "\
Narrow the set of completion candidates using another input regexp.
This, in effect, performs a set intersection operation on 1) the set
of candidates in effect before the operation and 2) the set of
candidates that match the current input.  You can repeatedly use this
command to continue intersecting candidate sets, progressively
narrowing the set of matches.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-narrow-candidates]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete-and-widen "icicles-mcmd" "\
Apropos complete, then `icicle-widen-candidates'.
You must enter the new, alternative input pattern using `RET'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-and-widen]').

\(fn)" t nil)

(autoload 'icicle-apropos-complete-and-narrow "icicles-mcmd" "\
Apropos complete, then `icicle-narrow-candidates'.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-apropos-complete-and-narrow]').

\(fn)" t nil)

(autoload 'icicle-narrow-candidates-with-predicate "icicles-mcmd" "\
Narrow the set of completion candidates by applying a predicate.
You can repeatedly use this command to apply additional predicates,
progressively narrowing the set of candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-narrow-candidates-with-predicate]').

When called from Lisp with non-nil arg PREDICATE, use that to narrow.

\(fn &optional PREDICATE)" t nil)

(autoload 'icicle-save-predicate-to-variable "icicles-mcmd" "\
Save the current completion predicate to a variable.
By default, the variable is `icicle-input-string'.  If you use a
prefix argument, then you are prompted for the variable to use.

You can retrieve the saved predicate as a string using `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-save-predicate-to-variable]').

\(fn ASKP)" t nil)

(autoload 'icicle-completing-read+insert "icicles-mcmd" "\
Read something with completion, and insert it.
Be sure to bind `icicle-completing-read+insert-candidates' to the set
of candidates.
Option `icicle-completing-read+insert-keys' controls which keys are
bound to this command.
Return the string that was inserted.

\(fn)" t nil)

(autoload 'icicle-read+insert-file-name "icicles-mcmd" "\
Read a file name and insert it, without its directory, by default.
With a prefix argument, insert its directory also.
Option `icicle-read+insert-file-name-keys' controls which keys are
 bound to this command.
Return the string that was inserted.

\(fn DIR-TOO-P)" t nil)

(autoload 'icicle-candidate-set-swap "icicles-mcmd" "\
Swap the saved set and current sets of completion candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-swap]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-define "icicles-mcmd" "\
Define the set of current completion candidates by evaluating a sexp.
The Lisp sexp must evaluate to a list of strings, such as is returned
by `all-completions'.

You can use this command at top level or from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-define]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-difference "icicles-mcmd" "\
Take the set difference between the current and saved candidates.
The new set of candidates is the set of candidates prior to executing
this command minus the saved set of candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-difference]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-union "icicles-mcmd" "\
Take the set union between the current and saved candidates.
The new set of candidates is the union of the saved set of candidates
and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-union]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-intersection "icicles-mcmd" "\
Take the set intersection between the current and saved candidates.
The new set of candidates is the intersection of the saved set of
candidates and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-intersection]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-complement "icicles-mcmd" "\
Complement the set of current completion candidates.
The new set of candidates is the set of `all-completions' minus the
set of candidates prior to executing this command - that is, all
possible completions of the appropriate type, except for those that
are in the current set of completions.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-complement]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-retrieve "icicles-mcmd" "\
Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\<minibuffer-local-completion-map>\\[icicle-save/unsave-candidate]', `M-S-mouse-2',
`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save]', `\\[icicle-candidate-set-save-to-variable]', or `\\[icicle-candidate-set-save-persistently]'.

With no prefix arg, retrieve candidates from variable
 `icicle-saved-completion-candidates'.
With a numeric prefix arg, retrieve candidates from another variable.
With a plain prefix arg (`C-u'), retrieve candidates from a cache file
 or, if option `icicle-filesets-as-saved-completion-sets-flag' is
 non-nil, an Emacs fileset name (Emacs 22 or later).  To use filesets,
 you must also load library `filesets' and use `(filesets-init)'.

Completion is available when you are prompted for a cache file,
fileset, or variable name.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-retrieve-1 "icicles-mcmd" "\
Helper function for `icicle-candidate-set-retrieve(-more)'.
ARG is the same as the raw prefix arg for `icicle-candidate-set-retrieve'.
MOREP non-nil means add the saved candidates, don't replace existing.

\(fn ARG &optional MOREP)" nil nil)

(autoload 'icicle-candidate-set-retrieve-more "icicles-mcmd" "\
Retrieve a saved set of completion candidates, adding it current.
The saved candidates are added to those already current.
A prefix argument acts as for `icicle-candidate-set-retrieve'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-more]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-retrieve-from-variable "icicles-mcmd" "\
Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\<minibuffer-local-completion-map>\\[icicle-save/unsave-candidate]', `M-S-mouse-2', or
`\\[icicle-candidate-set-save-to-variable]' (or `\\[icicle-candidate-set-save]' with a numeric prefix arg).

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-from-variable]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-retrieve-persistent "icicles-mcmd" "\
Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-persistently]' or `C-u \\[icicle-candidate-set-save]'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-persistent]').

\(fn)" t nil)

(autoload 'icicle-save/unsave-candidate "icicles-mcmd" "\
Add/remove current candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.
You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-save/unsave-candidate]').

\(fn)" t nil)

(autoload 'icicle-mouse-save/unsave-candidate "icicles-mcmd" "\
Add/remove clicked candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.

\(fn EVENT)" t nil)

(autoload 'icicle-mouse-candidate-set-save "icicles-mcmd" "\
`icicle-candidate-set-save(-selected)'.
If the region is active in *Completions*, then
`icicle-candidate-set-save-selected'.  Otherwise,
`icicle-candidate-set-save'.

\(fn IGNORE &optional ARG)" t nil)

(autoload 'icicle-mouse-candidate-set-save-more "icicles-mcmd" "\
`icicle-candidate-set-save-more(-selected)'.
If the region is active in *Completions*, then
`icicle-candidate-set-save-more-selected'.  Otherwise,
`icicle-candidate-set-save-more'.

\(fn IGNORE &optional ARG)" t nil)

(autoload 'icicle-mouse-save-then-kill "icicles-mcmd" "\
`mouse-save-then-kill', but click same place saves selected candidates.

\(fn CLICK &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save "icicles-mcmd" "\
Save the set of current completion candidates, for later recall.
Saves candidates in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.  To
 subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of candidates with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save-more "icicles-mcmd" "\
Add current completion candidates to saved candidates set.
The current candidates are added to those already saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-more]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save-selected "icicles-mcmd" "\
`icicle-candidate-set-save', but only for the selected candidates.
Candidates at least partially in the region are saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

As a special case, if no candidates are selected, then this empties
the current set of saved candidates.  That is, it UNsaves all saved
candidates.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-selected]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-candidate-set-save-more-selected "icicles-mcmd" "\
`icicle-candidate-set-save-more', but only for the selected candidates.
Candidates at least partially in the region are added to those saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-more-selected]').

\(fn &optional ARG)" t nil)

(autoload 'icicle-add/update-saved-completion-set "icicles-mcmd" "\
Add or update an entry in `icicle-saved-completion-sets'.
That is, create a new saved completion set or update an existing one.
You are prompted for the name of a set of completion candidates and
its cache file.  By default, the cache file name is the set name
without spaces, and with file extension `icy'.  List
`icicle-saved-completion-sets' is updated to have an entry with these
set and file names.  Return the cache-file name.

\(fn)" t nil)

(autoload 'icicle-candidate-set-save-to-variable "icicles-mcmd" "\
Save the set of current completion candidates in a variable you choose.
You can retrieve the saved set of candidates with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-from-variable]' (or `\\[icicle-candidate-set-retrieve]'
with a numeric prefix arg).
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-to-variable]').

\(fn)" t nil)

(autoload 'icicle-candidate-set-save-persistently "icicles-mcmd" "\
Save the set of current completion candidates persistently.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of candidates with `\\<minibuffer-local-completion-map>\\[icicle-candidate-set-retrieve-persistent]' or `C-u \\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\<minibuffer-local-completion-map>
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-candidate-set-save-persistently]').

\(fn FILESETP)" t nil)

(autoload 'icicle-keep-only-past-inputs "icicles-mcmd" "\
Narrow completion candidates to those that have been used previously.
This filters the set of current completion candidates, keeping only
those that have been used before.  (You must first use `TAB' or
`S-TAB' to establish an explicit candidate set.)

With a prefix arg, the previous inputs are sorted chronologically,
most recent first.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-keep-only-past-inputs]').

\(fn &optional RECENT-FIRST)" t nil)

(autoload 'icicle-other-history "icicles-mcmd" "\
Choose a history, or complete against `icicle-interactive-history'.
For Emacs 23 or later, if no prefix arg and you are completing a
  command, abbrev, or keyboard macro name, then complete against
  (non-nil) `icicle-interactive-history'.
Otherwise, prompt with completion for a minibuffer history to use.
  The history choice lasts only for the current (main) completion.
  (To then complete against this history, use `M-h'.)

\(fn ARG)" t nil)

(autoload 'icicle-use-interactive-command-history "icicles-mcmd" "\
Complete input against `icicle-interactive-history'.
This is a history of all Emacs commands called interactively.
This history is available only for Emacs 23 and later, and only if
option `icicle-populate-interactive-history-flag' is not nil.

\(fn)" t nil)

(autoload 'icicle-change-history-variable "icicles-mcmd" "\
Choose a history variable to use now for `minibuffer-history-variable'.
Use completion to choose the history to use.
The choice lasts only for the current (main) completion.
Non-interactively, arg HIST-VAR is the (string) name of a history var.

\(fn HIST-VAR)" t nil)

(autoload 'icicle-scroll-Completions "icicles-mcmd" "\
Scroll the *Completions* window down.

\(fn &optional REVERSE)" t nil)

(autoload 'icicle-scroll-Completions-up "icicles-mcmd" "\
Scroll the *Completions* window up.

\(fn)" t nil)

(autoload 'icicle-history "icicles-mcmd" "\
Access the appropriate history list using completion or cycling.
The current minibuffer input is interpreted as a regexp and matched
against items in the history list in use for the current command.

Note:

If the required input is a file or directory name, then the entire
minibuffer input is what is matched against the history list.  The
reason for this is that file names in the history list are usually
absolute.  This is unlike the case for normal file-name completion,
which assumes the default directory.

Keep this in mind for apropos (regexp) completion; it means that to
match a file-name using a substring you must, in the minibuffer,
either not specify a directory or explicitly use \".*\" before the
file-name substring.

For example, `/foo/bar/lph' will not apropos-match the previously
input file name `/foo/bar/alphabet-soup.el'; you should use either
`/foo/bar/.*lph' or `lph' (no directory).

This also represents a difference in behavior compared to the similar
command `icicle-keep-only-past-inputs' (\\<minibuffer-local-completion-map>\\[icicle-keep-only-past-inputs] in the minibuffer).
That command simply filters the current set of completion candidates,
which in the case of file-name completion is a set of relative file
names.

You can use this command only from the minibuffer (`\\<minibuffer-local-completion-map>\\[icicle-history]').

\(fn)" t nil)

(autoload 'icicle-isearch-complete "icicles-mcmd" "\
Complete the search string using candidates from the search ring.

\(fn)" t nil)

(autoload 'icicle-toggle-WYSIWYG-Completions "icicles-mcmd" "\
Toggle the value of option `icicle-WYSIWYG-Completions-flag'.

\(fn)" t nil)

(autoload 'icicle-toggle-~-for-home-dir "icicles-mcmd" "\
Toggle the value of option `icicle-use-~-for-home-dir-flag'.
Bound to `M-~' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-C-for-actions "icicles-mcmd" "\
Toggle the value of option `icicle-use-C-for-actions-flag'.
Bound to `M-g' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-alternative-sorting "icicles-mcmd" "\
Toggle alternative sorting of minibuffer completion candidates.
This swaps `icicle-alternative-sort-comparer' and `icicle-sort-comparer'.
Bound to `C-M-,' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-sorting "icicles-mcmd" "\
Toggle sorting of minibuffer completion candidates.
When sorting is active, comparison is done by `icicle-sort-comparer'.

\(fn)" t nil)

(autoload 'icicle-toggle-angle-brackets "icicles-mcmd" "\
Toggle `icicle-key-descriptions-use-<>-flag'.

\(fn)" t nil)

(autoload 'icicle-toggle-proxy-candidates "icicles-mcmd" "\
Toggle `icicle-add-proxy-candidates-flag'.
Bound to `\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]' in the minibuffer.
With some commands, you must re-invoke the command for the new value
to take effect.  (This is for performance reasons.)

\(fn)" t nil)

(autoload 'icicle-toggle-transforming "icicles-mcmd" "\
Toggle transforming of minibuffer completion candidates.
When transforming is active, it is done by `icicle-transform-function'.

By default, transformation, if active, simply removes duplicate
candidates.  Icicles commands already \"do the right thing\" when it
comes to duplicate removal, so you might never need this command.

Bound to `C-$' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-incremental-completion "icicles-mcmd" "\
Toggle the value of option `icicle-incremental-completion-flag'.
If the current value is t or `always', then it is set to nil.
If the current value is nil, then it is set to t.
This command never sets the value to non-nil and non-t.

Bound to `C-#' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-expand-to-common-match "icicles-mcmd" "\
Toggle the value of `icicle-expand-input-to-common-match-flag'.
Bound to `C-;' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-dispatch-C-^ "icicles-mcmd" "\
Do the right thing for `C-^'
When Icicles searching, call `icicle-toggle-highlight-all-current'.
Otherwise, call `icicle-toggle-remote-file-testing'.
Bound to `C-^' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-remote-file-testing "icicles-mcmd" "\
Toggle `icicle-test-for-remote-files-flag'.
If you use Tramp for accessing remote files, then turning this off
also turns off Tramp file-name completion.  Therefore, if you use this
command to turn off testing of remote file names, then use it also to
turn testing back on (instead of just setting the option to non-nil).

Bound to `C-^' in the minibuffer, except during Icicles searching.

\(fn)" t nil)

(autoload 'icicle-toggle-highlight-all-current "icicles-mcmd" "\
Toggle `icicle-search-highlight-all-current-flag'.
Bound to `C-^' in the minibuffer during Icicles searching (only).

\(fn)" t nil)

(autoload 'icicle-toggle-hiding-common-match "icicles-mcmd" "\
Toggle `icicle-hide-common-match-in-Completions-flag'.
Bound to `C-M-.' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-show-multi-completion "icicles-mcmd" "\
Toggle `icicle-show-multi-completion-flag'.
Bound to `M-m' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-ignored-space-prefix "icicles-mcmd" "\
Toggle `icicle-ignore-space-prefix-flag'.
Bound to `M-_' in the minibuffer, except during Icicles searching.

Note: If the current command binds `icicle-ignore-space-prefix-flag'
locally, then it is the local, not the global, value that is changed.
For example, `icicle-buffer' binds it to the value of
`icicle-buffer-ignore-space-prefix-flag'.  If that is non-nil, then
\\<minibuffer-local-completion-map>`\\[icicle-toggle-ignored-space-prefix]' toggles `icicle-ignore-space-prefix-flag' to nil only for the
duration of `icicle-buffer'.

\(fn)" t nil)

(autoload 'icicle-toggle-highlight-historical-candidates "icicles-mcmd" "\
Toggle `icicle-highlight-historical-candidates-flag'.
Bound to `C-pause' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-dispatch-C-\. "icicles-mcmd" "\
Do the right thing for `C-.'.
When using Icicles search (`icicle-search' and similar commands), call
 `icicle-toggle-search-cleanup'.
Otherwise, call `icicle-toggle-ignored-extensions'.

Bound to `C-.' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-ignored-extensions "icicles-mcmd" "\
Toggle respect of `completion-ignored-extensions'.
Bound to `C-.' in minibuffer during file-name input.

\(fn)" t nil)

(autoload 'icicle-toggle-search-cleanup "icicles-mcmd" "\
Toggle removal of `icicle-search' highlighting after a search.
This toggles option `icicle-search-cleanup-flag'.
Bound to `C-.' in the minibuffer, except for file-name input.

\(fn)" t nil)

(autoload 'icicle-toggle-regexp-quote "icicles-mcmd" "\
Toggle escaping of regexp special chars (`icicle-regexp-quote-flag').
Bound to `C-`' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-literal-replacement "icicles-mcmd" "\
Toggle escaping of regexp special chars in replacement text.
This toggles option `icicle-search-replace-literally-flag'.

Bound to `C-M-`' in the minibuffer.

\(fn)" t nil)

(autoload 'icicle-toggle-case-sensitivity "icicles-mcmd" "\
Toggle case sensitivity.

This toggles `case-fold-search' and `completion-ignore-case'.  With a
prefix arg, it also toggles `read-file-name-completion-ignore-case'
\(Emacs 22 and later) and `read-buffer-completion-ignore-case' (Emacs
23 and later).

More precisely, this command first toggles the default value of
`case-fold-search', and then it sets the other variables to the value
of `case-fold-search'.

Note:
1. This toggles the default value of `case-fold-search'.  This means
that it does not matter which buffer is current when you call this
command - all buffers are affected henceforth.

2. Some Icicles commands bind one or more of these variables, so
invoking this command during command execution will not necessarily
toggle the global values of all of the variables.

Bound to `C-A' in the minibuffer, that is, `C-S-a'.

\(fn FILE+BUFF-P)" t nil)

(autoload 'icicle-remove-Completions-window "icicles-mcmd" "\
Remove the *Completions* window.

\(fn)" t nil)

(autoload 'icicle-delete-windows-on "icicles-mcmd" "\
Delete all windows showing BUFFER.
If such a window is alone in its frame, then delete the frame - unless
it is the only frame or a standalone minibuffer frame.

\(fn BUFFER)" t nil)

;;;***

;;;### (autoloads (icicle-mode-hook) "icicles-mode" "icicles-mode.el"
;;;;;;  (19991 46054))
;;; Generated autoloads from icicles-mode.el

(defvar icicle-mode-hook nil "\
*Functions run after entering and exiting Icicle mode.")

(custom-autoload 'icicle-mode-hook "icicles-mode" t)

(when (fboundp 'define-minor-mode) (when (> emacs-major-version 22) (defadvice call-interactively (after icicle-save-to-history disable activate) "Save command to `icicle-interactive-history'." (let* ((fn (ad-get-arg 0)) (int (interactive-form fn))) (when (and (symbolp fn) (consp int) (or (not (stringp (cadr int))) (string= (cadr int) "") (not (eq 101 (aref (cadr int) 0))))) (pushnew (symbol-name fn) icicle-interactive-history)))) (when (boundp 'savehist-save-hook) (add-hook 'savehist-save-hook (lambda nil (setq savehist-minibuffer-history-variables (delq 'icicle-interactive-history savehist-minibuffer-history-variables)))))) (when (> emacs-major-version 21) (defadvice describe-face (before icicle-respect-WYSIWYG activate) "`read-face-name' respects `icicle-WYSIWYG-Completions-flag'.\nIf non-nil, then it does not use `completing-read-multiple' (which\ncannot take advantage of WYSIWYG)." (interactive (list (read-face-name "Describe face" "= `default' face" (not icicle-WYSIWYG-Completions-flag)))))) (eval '(define-minor-mode icicle-mode "Icicle mode: Toggle minibuffer input completion and cycling.\nNon-nil prefix ARG turns mode on if ARG > 0, else turns it off.\nIcicle mode is a global minor mode.  It binds keys in the minibuffer.\n\nThe following top-level commands are also available in Icicle mode.\nIn many cases there are also `other-window' versions.\n\n`clear-option' (alias)                 - Set binary option(s) to nil\n`icicle-add-buffer-candidate'          - Add always-candidate buffer\n`icicle-add-buffer-config'             - To `icicle-buffer-configs'\n`icicle-add-entry-to-saved-completion-set' - Add completion to a set\n`icicle-add/update-saved-completion-set' - To\n                                        `icicle-saved-completion-sets'\n`icicle-apply'                         - Apply function to alist items\n`icicle-apropos'                       - `apropos', but shows matches\n`icicle-apropos-command'               - Enhanced `apropos-command'\n`icicle-apropos-variable'              - Enhanced `apropos-variable'\n`icicle-apropos-zippy'                 - Show matching Zippy quotes\n`icicle-bookmark'                      - Jump to a bookmark\n`icicle-bookmark-bookmark-list'        - Jump to a bookmark list\n`icicle-bookmark-desktop'              - Jump to a desktop bookmark\n`icicle-bookmark-dired'                - Jump to a Dired bookmark\n`icicle-bookmark-file'                 - Jump to a file bookmark\n`icicle-bookmark-gnus'                 - Jump to a Gnus bookmark\n`icicle-bookmark-info'                 - Jump to an Info bookmark\n`icicle-bookmark-local-file'           - Jump to local-file bookmark\n`icicle-bookmark-man'                  - Jump to a `man'-page bookmark\n`icicle-bookmark-non-file'             - Jump to a buffer bookmark\n`icicle-bookmark-region'               - Jump to a region bookmark\n`icicle-bookmark-remote-file'          - Jump to a remote file\n`icicle-bookmark-specific-buffers'     - Jump to a bookmarked buffer\n`icicle-bookmark-specific-files'       - Jump to a bookmarked file\n`icicle-bookmark-this-buffer'          - Jump to bookmark for this buf\n`icicle-bookmark-url'                  - Jump to a URL bookmark\n`icicle-bookmark-w3m'                  - Jump to a W3M (URL) bookmark\n`icicle-buffer'                        - Switch to buffer\n`icicle-buffer-config'                 - Pick `icicle-buffer' options\n`icicle-buffer-list'                   - Choose a list of buffer names\n`icicle-change-alternative-sort-order' - Choose an alternative sort\n`icicle-change-sort-order'             - Choose a sort order\n`icicle-clear-current-history'         - Clear current history entries\n`icicle-clear-history'                 - Clear entries from a history\n`icicle-color-theme'                   - Change color theme\n`icicle-comint-command'                - Reuse shell etc. command\n`icicle-comint-dynamic-complete'       - Text completion in shell\n`icicle-comint-search'                 - Reuse shell etc. command\n`icicle-command-abbrev'                - Multi-command `M-x' + abbrevs\n`icicle-compilation-search'            - `icicle-search' and show hits\n`icicle-complete-keys'                 - Complete keys\n`icicle-complete-thesaurus-entry'      - Complete word using thesaurus\n`icicle-completing-yank'               - `yank' using completion\n`icicle-customize-face'                - Multi-`customize-face'\n`icicle-customize-icicles-group'       - Customize options and faces\n`icicle-delete-file'                   - Delete file/directory\n`icicle-delete-window'                 - Delete window (`C-u': buffer)\n`icicle-delete-windows'                - Delete all windows for buffer\n`icicle-dired'                         - Multi-command Dired\n`icicle-doc'                           - Show doc for fn, var, or face\n`icicle-doremi-candidate-width-factor+' - +/- candidate column width\n`icicle-doremi-increment-max-candidates+' - +/- max number candidates\n`icicle-doremi-increment-swank-prefix-length+' - +/- swank prefix\n`icicle-doremi-increment-swank-timeout+' - +/- swank completion msec\n`icicle-doremi-increment-variable+'    - Increment var using Do Re Mi\n`icicle-doremi-inter-candidates-min-spaces+' - +/- candidate spacing\n`icicle-doremi-zoom-Completions+'      - +/- *Completions* text size\n`icicle-execute-extended-command'      - Multi-command `M-x'\n`icicle-execute-named-keyboard-macro'  - Execute named keyboard macro\n`icicle-face-list'                     - Choose a list of face names\n`icicle-file-list'                     - Choose a list of file names\n`icicle-file'                          - Visit file/directory\n`icicle-find-file'                     -       same: relative only\n`icicle-find-file-absolute'            -       same: absolute only\n`icicle-find-file-in-tags-table'       - File in tags table\n`icicle-find-first-tag'                - Visit definition with tag\n`icicle-find-tag'                      - Visit definition with tag\n`icicle-font'                          - Change font of frame\n`icicle-frame-bg'                      - Change background of frame\n`icicle-frame-fg'                      - Change foreground of frame\n`icicle-fundoc'                        - Show function description\n`icicle-goto-global-marker'            - Go to a global marker\n`icicle-goto-marker'                   - Go to a marker in this buffer\n`icicle-imenu*'                        - Navigate among Imenu entries\n`icicle-increment-option'              - Increment numeric option\n`icicle-increment-variable'            - Increment numeric variable\n`icicle-Info-goto-node'                - Multi-cmd `Info-goto-node'\n`icicle-Info-index'                    - Multi-command `Info-index'\n`icicle-Info-menu'                     - Multi-command `Info-menu'\n`icicle-Info-virtual-book'             - Open a virtual Info book\n`icicle-insert-buffer'                 - Multi-command `insert-buffer'\n`icicle-insert-thesaurus-entry'        - Insert thesaurus entry(s)\n`icicle-keyword-list'                  - Choose a list of keywords\n`icicle-kill-buffer'                   - Kill buffer\n`icicle-kmacro'                        - Execute a keyboard macro\n`icicle-locate-file'                   - Visit file(s) in a directory\n`icicle-minibuffer-help'               - Show Icicles minibuffer help\n`icicle-mode' or `icy-mode'            - Toggle Icicle mode\n`icicle-next-S-TAB-completion-method'  - Next S-TAB completion method\n`icicle-next-TAB-completion-method'    - Next TAB completion method\n`icicle-occur'                         - Incremental `occur'\n`icicle-other-window-or-frame'         - Other window/frame or select\n`icicle-plist'                         - Show symbols, property lists\n`icicle-recent-file'                   - Open recently used file(s)\n`icicle-recompute-shell-command-candidates' - Update from search path\n`icicle-remove-buffer-candidate'       - Remove always-candidate buf\n`icicle-remove-buffer-config'          - From `icicle-buffer-configs'\n`icicle-remove-entry-from-saved-completion-set' - From a saved set\n`icicle-remove-file-from-recentf-list' - Remove from recent files list\n`icicle-remove-saved-completion-set'   - From\n                                        `icicle-saved-completion-sets'\n`icicle-reset-option-to-nil'           - Set binary option(s) to nil\n`icicle-save-string-to-variable'       - Save text for use with `C-='\n`icicle-search'                        - Search with regexps & cycling\n`icicle-search-bookmark'               - Search bookmarks separately\n`icicle-search-bookmark-list-bookmark' - Search bookmark lists\n`icicle-search-bookmarks-together'     - Search bookmarks together\n`icicle-search-char-property'          - Search for overlay/text props\n`icicle-search-dired-bookmark'         - Search Dired bookmarks\n`icicle-search-dired-marked'           - Search marked files in Dired\n`icicle-search-file'                   - Search multiple files\n`icicle-search-file-bookmark'          - Search bookmarked files\n`icicle-search-gnus-bookmark'          - Search bookmarked Gnus msgs\n`icicle-search-ibuffer-marked'         - Search marked bufs in Ibuffer\n`icicle-search-info-bookmark'          - Search bookmarked Info nodes\n`icicle-search-keywords'               - Search with regexp keywords\n`icicle-search-local-file-bookmark'    - Search bookmarked local files\n`icicle-search-man-bookmark'           - Search bookmarked `man' pages\n`icicle-search-non-file-bookmark'      - Search bookmarked buffers\n`icicle-search-overlay-property'       - Search for overlay properties\n`icicle-search-pages'                  - Search Emacs pages\n`icicle-search-paragraphs'             - Search Emacs paragraphs\n`icicle-search-region-bookmark'        - Search bookmarked regions\n`icicle-search-remote-file-bookmark'   - Search remote bookmarks\n`icicle-search-sentences'              - Search sentences as contexts\n`icicle-search-text-property'          - Search for faces etc.\n`icicle-search-url-bookmark'           - Search bookmarked URLs\n`icicle-search-word'                   - Whole-word search\n`icicle-select-bookmarked-region'      - Select bookmarked regions\n`icicle-select-frame'                  - Select a frame by name\n`icicle-select-window'                 - Select window by buffer name\n`icicle-send-bug-report'               - Send Icicles bug report\n`icicle-set-option-to-t'               - Set binary option(s) to t\n`icicle-toggle-~-for-home-dir'         - Toggle using `~' for $HOME\n`icicle-toggle-alternative-sorting'    - Swap alternative sort\n`icicle-toggle-angle-brackets'         - Toggle using angle brackets\n`icicle-toggle-C-for-actions'          - Toggle using `C-' for actions\n`icicle-toggle-case-sensitivity'       - Toggle case sensitivity\n`icicle-toggle-dot'                    - Toggle `.' matching newlines\n`icicle-toggle-expand-to-common-match' - Toggle input ECM expansion\n`icicle-toggle-hiding-common-match'    - Toggle match in *Completions*\n`icicle-toggle-highlight-all-current'  - Toggle max search highlight\n`icicle-toggle-highlight-historical-candidates'\n                                       - Toggle past-input highlight\n`icicle-toggle-ignored-extensions'     - Toggle ignored files\n`icicle-toggle-ignored-space-prefix'   - Toggle ignoring space prefix\n`icicle-toggle-incremental-completion' - Toggle apropos icompletion\n`icicle-toggle-option'                 - Toggle binary user option\n`icicle-toggle-proxy-candidates'       - Toggle proxy candidates\n`icicle-toggle-regexp-quote'           - Toggle regexp escaping\n`icicle-toggle-search-cleanup'         - Toggle search highlighting\n`icicle-toggle-search-replace-common-match' - Toggle ECM replacement\n`icicle-toggle-search-replace-whole'   - Toggle replacing whole hit\n`icicle-toggle-search-whole-word'      - Toggle whole-word searching\n`icicle-toggle-show-multi-completion'  - Toggle multi-completions\n`icicle-toggle-sorting'                - Toggle sorting of completions\n`icicle-toggle-transforming'           - Toggle duplicate removal\n`icicle-toggle-WYSIWYG-Completions'    - Toggle WYSIWYG *Completions*\n`icicle-vardoc'                        - Show variable description\n`icicle-where-is'                      - `where-is' multi-command\n`icicle-yank-maybe-completing'         - `yank' maybe using completion\n`toggle' (alias)                       - Toggle binary user option\n\nFor more information, use `\\<minibuffer-local-completion-map>\\[icicle-minibuffer-help]' when the minibuffer is active.\n\nNote: Depending on your platform, if you use Icicles in a text\nterminal (that is, without a window system/manager), then you might\nneed to change some of the key bindings, if some of the default\nbindings are not available to you." :global t :group 'Icicles-Miscellaneous :lighter " Icy" :init-value nil (cond (icicle-mode (icicle-define-icicle-maps) (icicle-bind-other-keymap-keys) (add-hook 'minibuffer-setup-hook 'icicle-minibuffer-setup) (add-hook 'minibuffer-exit-hook 'icicle-cancel-Help-redirection) (add-hook 'minibuffer-exit-hook 'icicle-restore-region-face) (add-hook 'minibuffer-exit-hook 'icicle-unhighlight-lighter) (add-hook 'icicle-post-command-hook 'icicle-activate-mark 'append) (add-hook 'completion-setup-hook 'icicle-set-calling-cmd 'append) (when icicle-customize-save-flag (add-hook 'kill-emacs-hook 'icicle-command-abbrev-save)) (add-hook 'comint-mode-hook 'icicle-comint-hook-fn) (add-hook 'compilation-mode-hook 'icicle-compilation-hook-fn) (add-hook 'compilation-minor-mode-hook 'icicle-compilation-hook-fn) (add-hook 'temp-buffer-show-hook 'icicle-fit-completions-window) (icicle-undo-std-completion-faces) (icicle-redefine-std-completion-fns) (icicle-redefine-standard-commands) (icicle-redefine-standard-options) (when (ad-find-some-advice 'describe-face 'before 'icicle-respect-WYSIWYG) (ad-enable-advice 'describe-face 'before 'icicle-respect-WYSIWYG)) (when (fboundp 'minibuffer-depth-indicate-mode) (minibuffer-depth-indicate-mode 99)) (if icicle-menu-items-to-history-flag (add-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history) (remove-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history)) (when (> emacs-major-version 22) (when icicle-populate-interactive-history-flag (ad-enable-advice 'call-interactively 'after 'icicle-save-to-history)) (ad-activate 'call-interactively)) (dolist (fn icicle-inhibit-advice-functions) (when (and (fboundp fn) (ad-is-active fn)) (push (cons fn (ad-copy-advice-info fn)) icicle-advice-info-list) (ad-deactivate fn)))) (t (makunbound 'icicle-mode-map) (icicle-restore-other-keymap-keys) (remove-hook 'minibuffer-setup-hook 'icicle-minibuffer-setup) (remove-hook 'minibuffer-exit-hook 'icicle-cancel-Help-redirection) (remove-hook 'minibuffer-exit-hook 'icicle-restore-region-face) (remove-hook 'icicle-post-command-hook 'icicle-activate-mark) (remove-hook 'pre-command-hook 'icicle-top-level-prep) (remove-hook 'pre-command-hook 'icicle-run-icicle-pre-command-hook t) (remove-hook 'post-command-hook 'icicle-run-icicle-post-command-hook t) (remove-hook 'completion-setup-hook 'icicle-set-calling-cmd) (remove-hook 'kill-emacs-hook 'icicle-command-abbrev-save) (remove-hook 'comint-mode-hook 'icicle-comint-hook-fn) (remove-hook 'compilation-mode-hook 'icicle-compilation-hook-fn) (remove-hook 'compilation-minor-mode-hook 'icicle-compilation-hook-fn) (remove-hook 'temp-buffer-show-hook 'icicle-fit-completions-window) (icicle-restore-std-completion-fns) (icicle-restore-standard-commands) (icicle-restore-standard-options) (when (ad-find-some-advice 'describe-face 'before 'icicle-respect-WYSIWYG) (ad-disable-advice 'describe-face 'before 'icicle-respect-WYSIWYG)) (when (fboundp 'minibuffer-depth-indicate-mode) (minibuffer-depth-indicate-mode -99)) (remove-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history) (when (> emacs-major-version 22) (ad-disable-advice 'call-interactively 'after 'icicle-save-to-history) (ad-activate 'call-interactively)) (dolist (fn icicle-inhibit-advice-functions) (let ((info (memq fn icicle-advice-info-list))) (when (and (fboundp fn) info) (ad-set-advice-info fn info) (when (ad-is-active fn) (ad-activate fn))))))) (unless (eq icicle-guess-commands-in-path 'load) (setq icicle-shell-command-candidates-cache nil)) (message "Turning %s Icicle mode..." (if icicle-mode "ON" "OFF")) (icicle-define-minibuffer-maps icicle-mode) (run-hooks 'icicle-mode-hook) (message "Turning %s Icicle mode...done" (if icicle-mode "ON" "OFF")))))

;;;***

;;;### (autoloads (icicle-WYSIWYG-Completions-flag icicle-word-completion-keys
;;;;;;  icicle-use-candidates-only-once-flag icicle-use-anything-candidates-flag
;;;;;;  icicle-use-C-for-actions-flag icicle-use-~-for-home-dir-flag
;;;;;;  icicle-update-input-hook icicle-unpropertize-completion-result-flag
;;;;;;  icicle-type-actions-alist icicle-transform-function icicle-touche-pas-aux-menus-flag
;;;;;;  icicle-top-level-when-sole-completion-flag icicle-top-level-when-sole-completion-delay
;;;;;;  icicle-top-level-key-bindings icicle-yank-function icicle-thing-at-point-functions
;;;;;;  icicle-test-for-remote-files-flag icicle-TAB-shows-candidates-flag
;;;;;;  icicle-TAB-completion-methods icicle-swank-timeout icicle-swank-prefix-length
;;;;;;  icicle-S-TAB-completion-methods-alist icicle-special-candidate-regexp
;;;;;;  icicle-buffer-configs icicle-sort-comparer icicle-show-multi-completion-flag
;;;;;;  icicle-show-Completions-initially-flag icicle-shell-command-candidates-cache
;;;;;;  icicle-search-whole-word-flag icicle-search-ring-max icicle-search-replace-whole-candidate-flag
;;;;;;  icicle-search-replace-literally-flag icicle-search-replace-common-match-flag
;;;;;;  icicle-search-hook icicle-search-highlight-threshold icicle-search-highlight-context-levels-flag
;;;;;;  icicle-search-highlight-all-current-flag icicle-search-from-isearch-keys
;;;;;;  icicle-search-cleanup-flag icicle-saved-completion-sets icicle-require-match-flag
;;;;;;  icicle-region-background icicle-regexp-search-ring-max icicle-regexp-quote-flag
;;;;;;  icicle-redefine-standard-commands-flag icicle-read+insert-file-name-keys
;;;;;;  icicle-quote-shell-file-name-flag icicle-previous-candidate-keys
;;;;;;  icicle-prefix-cycle-previous-help-keys icicle-prefix-cycle-previous-alt-action-keys
;;;;;;  icicle-prefix-cycle-previous-action-keys icicle-prefix-cycle-previous-keys
;;;;;;  icicle-prefix-cycle-next-help-keys icicle-prefix-cycle-next-alt-action-keys
;;;;;;  icicle-prefix-cycle-next-action-keys icicle-prefix-cycle-next-keys
;;;;;;  icicle-prefix-complete-no-display-keys icicle-prefix-complete-keys
;;;;;;  icicle-pp-eval-expression-print-level icicle-pp-eval-expression-print-length
;;;;;;  icicle-option-type-prefix-arg-list icicle-no-match-hook icicle-modal-cycle-up-help-keys
;;;;;;  icicle-modal-cycle-up-alt-action-keys icicle-modal-cycle-up-action-keys
;;;;;;  icicle-modal-cycle-up-keys icicle-modal-cycle-down-help-keys
;;;;;;  icicle-modal-cycle-down-alt-action-keys icicle-modal-cycle-down-action-keys
;;;;;;  icicle-modal-cycle-down-keys icicle-minibuffer-setup-hook
;;;;;;  icicle-menu-items-to-history-flag icicle-max-candidates icicle-list-nth-parts-join-string
;;;;;;  icicle-list-join-string icicle-list-end-string icicle-levenshtein-distance
;;;;;;  icicle-keymaps-for-key-completion icicle-key-descriptions-use-<>-flag
;;;;;;  icicle-key-complete-keys icicle-isearch-complete-keys icicle-inter-candidates-min-spaces
;;;;;;  icicle-input-string icicle-inhibit-ding-flag icicle-inhibit-advice-functions
;;;;;;  icicle-incremental-completion-threshold icicle-incremental-completion-flag
;;;;;;  icicle-incremental-completion-delay icicle-ignore-space-prefix-flag
;;;;;;  icicle-ignored-directories icicle-highlight-lighter-flag
;;;;;;  icicle-highlight-input-initial-whitespace-flag icicle-highlight-input-completion-failure-threshold
;;;;;;  icicle-highlight-input-completion-failure-delay icicle-highlight-input-completion-failure
;;;;;;  icicle-highlight-historical-candidates-flag icicle-hide-common-match-in-Completions-flag
;;;;;;  icicle-help-in-mode-line-flag icicle-guess-commands-in-path
;;;;;;  icicle-filesets-as-saved-completion-sets-flag icicle-files-ido-like-flag
;;;;;;  icicle-file-sort icicle-file-require-match-flag icicle-file-predicate
;;;;;;  icicle-file-no-match-regexp icicle-file-match-regexp icicle-file-extras
;;;;;;  icicle-expand-input-to-common-match-flag icicle-dot-string
;;;;;;  icicle-dot-show-regexp-flag icicle-deletion-action-flag icicle-define-alias-commands-flag
;;;;;;  icicle-default-value icicle-default-thing-insertion icicle-default-cycling-mode
;;;;;;  icicle-cycle-into-subdirs-flag icicle-customize-save-variable-function
;;;;;;  icicle-customize-save-flag icicle-Completions-window-max-height
;;;;;;  icicle-Completions-frame-at-right-flag icicle-completions-format
;;;;;;  icicle-Completions-display-min-input-chars icicle-completion-history-max-length
;;;;;;  icicle-completing-read+insert-keys icicle-complete-keys-self-insert-flag
;;;;;;  icicle-complete-key-anyway-flag icicle-command-abbrev-priority-flag
;;;;;;  icicle-command-abbrev-match-all-parts-flag icicle-command-abbrev-alist
;;;;;;  icicle-comint-dynamic-complete-replacements icicle-color-themes
;;;;;;  icicle-C-l-uses-completion-flag icicle-change-sort-order-completion-flag
;;;;;;  icicle-change-region-background-flag icicle-point-position-in-candidate
;;;;;;  icicle-mark-position-in-candidate icicle-candidate-width-factor
;;;;;;  icicle-buffers-ido-like-flag icicle-buffer-sort icicle-buffer-require-match-flag
;;;;;;  icicle-buffer-predicate icicle-buffer-no-match-regexp icicle-buffer-match-regexp
;;;;;;  icicle-buffer-ignore-space-prefix-flag icicle-buffer-extras
;;;;;;  icicle-bookmark-refresh-cache-flag icicle-bookmark-name-length-max
;;;;;;  icicle-apropos-cycle-previous-help-keys icicle-apropos-cycle-previous-alt-action-keys
;;;;;;  icicle-apropos-cycle-previous-action-keys icicle-apropos-cycle-previous-keys
;;;;;;  icicle-apropos-cycle-next-help-keys icicle-apropos-cycle-next-alt-action-keys
;;;;;;  icicle-apropos-cycle-next-action-keys icicle-apropos-cycle-next-keys
;;;;;;  icicle-apropos-complete-no-display-keys icicle-apropos-complete-keys
;;;;;;  icicle-anything-transform-candidates-flag icicle-alternative-sort-comparer
;;;;;;  icicle-alternative-actions-alist icicle-add-proxy-candidates-flag
;;;;;;  icicle-act-before-cycle-flag) "icicles-opt" "icicles-opt.el"
;;;;;;  (19991 46054))
;;; Generated autoloads from icicles-opt.el

(defvar icicle-act-before-cycle-flag nil "\
*Non-nil means act on current candidate, then cycle to next/previous.
Otherwise (nil), cycle to the next or previous candidate, and then act
on it.

This affects keys such as the following:

 `C-down',   `C-wheel-down',   `C-next',   `C-end',
 `C-M-down', `C-M-wheel-down', `C-M-next', `C-M-end',
 `C-S-down', `C-S-wheel-down', `C-S-next', `C-S-end'.

Note: A few Icicles commands ignore this setting, in order to \"do the
right thing\".")

(custom-autoload 'icicle-act-before-cycle-flag "icicles-opt" t)

(defvar icicle-add-proxy-candidates-flag nil "\
*Non-nil means to include proxy candidates whenever possible.
A proxy candidate is a special candidate (shown in *Completions* using
face `icicle-special-candidate') whose name is a placeholder for the
real candidate.  The proxy candidate typically stands for some value
obtained from the cursor position or by some action such as clicking
the mouse.  Example candidates include a color or file name, named by
proxy candidates such as `*copied foreground*' or `*file at point*'.

You can toggle this option at any time from the minibuffer using
`\\<minibuffer-local-completion-map>\\[icicle-toggle-proxy-candidates]'.  However, for commands that provide many proxy candidates, if
the flag is off initially when input is read, then you must re-invoke
the completing command for the new value to take effect.  (This is for
performance reasons.)")

(custom-autoload 'icicle-add-proxy-candidates-flag "icicles-opt" t)

(defvar icicle-alternative-actions-alist nil "\
*Alist of Emacs commands and alternative action functions.
This always overrides any alternative action defined by
`icicle-candidate-alt-action-fn'.

Each alist element has the form (COMMAND . FUNCTION), where COMMAND is
a command (a symbol) that reads input and FUNCTION is the
alternative-action function it uses.  To disable alternative action
for a given command, use `ignore' as the FUNCTION.

This option has no effect on `icicle-all-candidates-list-alt-action',
that is, `M-|', but it does affect `C-|'.")

(custom-autoload 'icicle-alternative-actions-alist "icicles-opt" t)

(defvar icicle-alternative-sort-comparer 'icicle-historical-alphabetic-p "\
*An alternative sort function, in place of `icicle-sort-comparer'.
You can swap this with `icicle-sort-comparer' at any time by using
`icicle-toggle-alternative-sorting' (\\<minibuffer-local-completion-map>`\\[icicle-toggle-alternative-sorting]' in the minibuffer).")

(custom-autoload 'icicle-alternative-sort-comparer "icicles-opt" t)

(defvar icicle-anything-transform-candidates-flag nil "\
*Non-nil means `icicle-anything' transforms completion candidates.
Function `anything-transform-candidates' is used for the transforming.

The advantage of a nil value is that `icicle-anything' then acts as a
multi-command: you can act on multiple candidates, or apply multiple
actions for the same candidate, within a single invocation of
`icicle-anything' (or related commands).

The advantage of a non-nil value is that some of the displayed
Anything candidates might be more readable.

This option has no effect if library `anything.el' cannot be loaded.")

(custom-autoload 'icicle-anything-transform-candidates-flag "icicles-opt" t)

(defvar icicle-apropos-complete-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use for `icicle-apropos-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-apropos-complete-keys "icicles-opt" t)

(defvar icicle-apropos-complete-no-display-keys '([C-M-S-tab] [C-M-S-iso-lefttab]) "\
*Key sequences to use for `icicle-apropos-complete-no-display'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `C-M-S-tab' and `C-M-S-iso-lefttab'.")

(custom-autoload 'icicle-apropos-complete-no-display-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-keys '([next]) "\
*Key sequences for apropos completion to cycle to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-next-action-keys'.")

(custom-autoload 'icicle-apropos-cycle-next-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-action-keys '([C-next]) "\
*Keys for apropos completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-next-keys'.")

(custom-autoload 'icicle-apropos-cycle-next-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-alt-action-keys '([C-S-next]) "\
*Keys for apropos completion to cycle next and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-next-alt-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-next-help-keys '([(control meta next)]) "\
*Keys for apropos completion to cycle next and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-next-help-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-keys '([prior]) "\
*Key sequences for apropos completion to cycle to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-previous-action-keys'.")

(custom-autoload 'icicle-apropos-cycle-previous-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-action-keys '([C-prior]) "\
*Keys for apropos completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-previous-keys'.")

(custom-autoload 'icicle-apropos-cycle-previous-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-alt-action-keys '([C-S-prior]) "\
*Keys for apropos completion to cycle previous and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-previous-alt-action-keys "icicles-opt" t)

(defvar icicle-apropos-cycle-previous-help-keys '([(control meta prior)]) "\
*Keys for apropos completion to cycle previous and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-apropos-cycle-previous-help-keys "icicles-opt" t)

(defvar icicle-bookmark-name-length-max 70 "\
*Maximum number of characters used to name a bookmark.
When `icicle-bookmark-cmd' is used with a non-negative numeric prefix
arg, the name of the bookmark that is set has at most this many chars.")

(custom-autoload 'icicle-bookmark-name-length-max "icicles-opt" t)

(defvar icicle-bookmark-refresh-cache-flag t "\
*t means `icicle-bookmark' refreshes the bookmark-list cache.
Use nil to speed up `icicle-bookmark(-other-window)' if you have a lot
of bookmarks, at the cost of having the bookmark list possibly not be
up to date.  Use t if you want to be sure the list is refreshed.

If nil, the list of bookmarks is updated only if you use `C-u'.
If t, the list is always updated unless you use `C-u'.

This affects only commands such as `icicle-bookmark' that use the full
bookmark list.  It does not affect more specific Icicles bookmark
commands such as `\\[icicle-bookmark-dired-other-window]' or the use
of a negative prefix arg with
`\\[icicle-bookmark-cmd]'.

Regardless of the option value, the cache is refreshed whenever you
use `S-delete' to delete a candidate bookmark.")

(custom-autoload 'icicle-bookmark-refresh-cache-flag "icicles-opt" t)

(defvar icicle-buffer-extras nil "\
*List of additional buffer-name candidates added to the normal list.
List elements are strings.")

(custom-autoload 'icicle-buffer-extras "icicles-opt" t)

(defvar icicle-buffer-ignore-space-prefix-flag t "\
*Override `icicle-ignore-space-prefix-flag' for `icicle-buffer*'.
Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-buffer-ignore-space-prefix-flag "icicles-opt" t)

(defvar icicle-buffer-match-regexp nil "\
*nil or a regexp that buffer-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-buffer-no-match-regexp'.")

(custom-autoload 'icicle-buffer-match-regexp "icicles-opt" t)

(defvar icicle-buffer-no-match-regexp nil "\
*nil or a regexp that buffer-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-buffer-match-regexp'.")

(custom-autoload 'icicle-buffer-no-match-regexp "icicles-opt" t)

(defvar icicle-buffer-predicate nil "\
*nil or a predicate that buffer-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only buffers that
are associated with files:

  (lambda (bufname) (buffer-file-name (get-buffer bufname)))

This predicate is applied after matching against user input.  It thus
corresponds to `icicle-must-pass-after-match-predicate', not to
`icicle-must-pass-predicate'.")

(custom-autoload 'icicle-buffer-predicate "icicles-opt" t)

(defvar icicle-buffer-require-match-flag nil "\
*Override `icicle-require-match-flag' for `icicle-buffer*' commands.
Controls the REQUIRE-MATCH arg to `completing-read' and `read-file-name'.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-buffer-require-match-flag "icicles-opt" t)

(defvar icicle-buffer-sort 'icicle-buffer-sort-*\.\.\.*-last "\
*A sort function for buffer names, or nil.
Examples of sort functions are `icicle-buffer-sort-*...*-last' and
`string<'.  If nil, then buffer names are not sorted.  Option
`icicle-sort-comparer' is bound to `icicle-buffer-sort' by command
`icicle-buffer'.")

(custom-autoload 'icicle-buffer-sort "icicles-opt" t)

(defvar icicle-buffers-ido-like-flag nil "\
t means `icicle-buffer' and similar commands act more Ido-like.
Specifically, those commands then bind these options to t:
 `icicle-show-Completions-initially-flag'
 `icicle-top-level-when-sole-completion-flag'
 `icicle-default-value'")

(custom-autoload 'icicle-buffers-ido-like-flag "icicles-opt" t)

(defvar icicle-candidate-width-factor 80 "\
*Percentage of widest candidate width to use for calculating columns.
The number of columns of candidates displayed in *Completions* is no
more than the window width divided by this percentage of the maximum
candidate width.

Increasing this toward 100 spreads columns out. Decreasing it
compresses columns together.  The higher the value, the more
candidates will form well-defined columns, but the likelier that
horizontal space will be wasted between them.  The lower the value,
the more candidates will not line up in columns, but the less
horizontal space will be wasted between them.

When most candidates are almost as wide as the widest candidate, a
high value works well.  When most candidates are much shorter than the
widest candidate, a low value works well.

If you use Do Re Mi (library `doremi.el'), then you can modify this
option incrementally during completion, seeing the effect as it
changes.  Use `C-x w' from the minibuffer, then use the `right' and
`left' arrow keys or the mouse wheel to increment and decrement the
value.  WYSIWYG.

See also option `icicle-inter-candidates-min-spaces' and (starting
with Emacs 23) option `icicle-Completions-text-scale-decrease'.")

(custom-autoload 'icicle-candidate-width-factor "icicles-opt" t)

(defvar icicle-mark-position-in-candidate 'input-end "\
*Position of mark when you cycle through completion candidates.
This is the mark position in the minibuffer.
Possible values are those for `icicle-point-position-in-candidate'.")

(custom-autoload 'icicle-mark-position-in-candidate "icicles-opt" t)

(defvar icicle-point-position-in-candidate 'root-end "\
*Position of cursor when you cycle through completion candidates.
This is the cursor position in the minibuffer.
Possible values are:
 `input-start': beginning of the minibuffer input
 `input-end':   end of the minibuffer input
 `root-start':  beginning of the completion root
 `root-end':    end of the completion root
When input is expected to be a file name, `input-start' is just after
the directory, which is added automatically during completion cycling.
See also `icicle-mark-position-in-candidate'.")

(custom-autoload 'icicle-point-position-in-candidate "icicles-opt" t)

(defvar icicle-change-region-background-flag (not (eq icicle-point-position-in-candidate icicle-mark-position-in-candidate)) "\
*Non-nil means use color `icicle-region-background' during input.
See `icicle-region-background'.  If you load library `hexrgb.el'
before Icicles, then `icicle-region-background' will be a slightly
different hue from your normal background color.  This makes
minibuffer input easier to read than if your normal `region' face were
used.  This has an effect only during minibuffer input.  A non-nil
value for this option is particularly useful if you use
delete-selection mode.")

(custom-autoload 'icicle-change-region-background-flag "icicles-opt" t)

(defvar icicle-change-sort-order-completion-flag nil "\
*Non-nil means `icicle-change-sort-order' uses completion, by default.
Otherwise, it cycles among the possible sort orders.  You can override
the behavior by using `C-u' with `icicle-change-sort-order'.")

(custom-autoload 'icicle-change-sort-order-completion-flag "icicles-opt" t)

(defvar icicle-C-l-uses-completion-flag nil "\
*Non-nil means \\<minibuffer-local-completion-map>`\\[icicle-retrieve-previous-input]' uses completion for choosing completion history
entries, by default.  Otherwise, it cycles among the possible previous
inputs.  You can override the behavior by using `C-u' with `\\[icicle-retrieve-previous-input]'.")

(custom-autoload 'icicle-C-l-uses-completion-flag "icicles-opt" t)

(defvar icicle-color-themes nil "\
*List of color themes to cycle through using `M-x icicle-color-theme'.
Note: Starting with Color Theme version 6.6.0, you will need to put
library `color-theme-library.el', as well as library `color-theme.el',
in your `load-path'.")

(custom-autoload 'icicle-color-themes "icicles-opt" t)

(defvar icicle-comint-dynamic-complete-replacements '((comint-dynamic-complete-filename 'icicle-comint-dynamic-complete-filename) (shell-dynamic-complete-command 'icicle-shell-dynamic-complete-command) (shell-dynamic-complete-environment-variable 'icicle-shell-dynamic-complete-environment-variable) (shell-dynamic-complete-filename 'icicle-shell-dynamic-complete-filename) (ess-complete-filename 'icicle-ess-complete-filename) (ess-complete-object-name 'icicle-ess-complete-object-name)) "\
*List of function replacements for `comint-dynamic-complete-functions'.
Instead of using `comint-dynamic-complete-functions' as is, command
`icicle-comint-dynamic-complete' replaces functions in that list
according to the value of this option.

Each option list element is itself a list of two elements.  The first
is a function to replace (a symbol), and the second is the replacement
function (a sexp that evaluates to a function).  For example, this
list element says to replace completion function `foo' by completion
function `my-foo': (foo 'my-foo).

You can use this option to provide Icicles completion for various
modes that inherit from Comint mode or otherwise use
`comint-dynamic-complete'.")

(custom-autoload 'icicle-comint-dynamic-complete-replacements "icicles-opt" t)

(defvar icicle-command-abbrev-alist nil "\
*Alist of command abbreviations and commands, with frequency of use.
Each element has the form (COMMAND ABBREV N), where ABBREV is an
abbreviation of COMMAND and N is the number of times COMMAND has been
invoked via ABBREV.  Both COMMAND and ABBREV are symbols.")

(custom-autoload 'icicle-command-abbrev-alist "icicles-opt" t)

(defvar icicle-command-abbrev-match-all-parts-flag nil "\
*Non-nil means `icicle-command-abbrev' matches each command-name part.
Otherwise, an abbrev need match only a prefix of the command name.")

(custom-autoload 'icicle-command-abbrev-match-all-parts-flag "icicles-opt" t)

(defvar icicle-command-abbrev-priority-flag nil "\
*nil means commands take precedence over abbreviations for `\\<icicle-mode-map>\\[icicle-command-abbrev]'.")

(custom-autoload 'icicle-command-abbrev-priority-flag "icicles-opt" t)

(defvar icicle-complete-key-anyway-flag nil "\
*Non-nil means bind `S-TAB' for key completion even if already
bound.  If nil, then each of the keys in `icicle-key-complete-keys' is
bound to `icicle-complete-keys' in each keymap of
`icicle-keymaps-for-key-completion' only if `S-TAB' is not already
bound in the keymap.

Note: the keys in `icicle-key-complete-keys' are always bound to
`icicle-complete-keys' in `icicle-mode-map'.  This option affects only
the binding of those keys in `icicle-keymaps-for-key-completion'.")

(custom-autoload 'icicle-complete-key-anyway-flag "icicles-opt" t)

(defvar icicle-complete-keys-self-insert-flag nil "\
*Non-nil means `icicle-complete-keys' includes self-inserting keys.
That means keys bound to `self-insert-command'.")

(custom-autoload 'icicle-complete-keys-self-insert-flag "icicles-opt" t)

(defvar icicle-completing-read+insert-keys '([(control meta shift 99)]) "\
*Key sequences to invoke `icicle-completing-read+insert'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Such a key has no effect unless
`icicle-completing-read+insert-candidates' is non-nil.")

(custom-autoload 'icicle-completing-read+insert-keys "icicles-opt" t)

(defvar icicle-completion-history-max-length (if icicle-C-l-uses-completion-flag 1000 100) "\
*Maximum number of inputs to save in the completion history.
This is the history that you access using \\<minibuffer-local-completion-map>`\\[icicle-retrieve-previous-input]' and `\\[icicle-retrieve-next-input]'.")

(custom-autoload 'icicle-completion-history-max-length "icicles-opt" t)

(defvar icicle-Completions-display-min-input-chars 0 "\
**Completions* window is removed if fewer chars than this are input.
You might want to set this to, say 1 or 2, to avoid display of a large
set of candidates during incremental completion.  The default value of
0 causes this option to have no effect: *Completions* is never removed
based only on the number of input characters.")

(custom-autoload 'icicle-Completions-display-min-input-chars "icicles-opt" t)

(defvar icicle-completions-format (if (boundp 'completions-format) completions-format 'horizontal) "\
*Layout of completion candidates in buffer *Completions*.
`vertical' means display down columns first, then to the right.
`horizontal' or nil means display across rows first, then down.

A `vertical' value is overridden (ignored) when multi-line
multi-completions are used.  For clarity, the layout for such
multi-completions is always horizontal.")

(custom-autoload 'icicle-completions-format "icicles-opt" t)

(defvar icicle-Completions-frame-at-right-flag t "\
*Non-nil means move *Completions* frame to right edge of display.
This is done by `icicle-candidate-action'.
It only happens if *Completions* is alone in its frame.
This can be useful to make *Completions* more visible.")

(custom-autoload 'icicle-Completions-frame-at-right-flag "icicles-opt" t)

(when (fboundp 'text-scale-decrease) (defcustom icicle-Completions-text-scale-decrease 0.66 "*Initial height decrease for text in buffer `*Completions*'.\nA value of 0.0 means the height is not decreased at all.\nThis is used as the argument to function `text-scale-decrease'.\nIf you use library `doremi-frm.el', you can use `C-x -' to\nincrementally resize the text during completion.\n\nSee also options `icicle-candidate-width-factor' and\n`icicle-inter-candidates-min-spaces'." :type 'number :group 'Icicles-Completions-Display))

(defvar icicle-Completions-window-max-height 30 "\
*Maximum height of *Completions* window, in lines.
The window is fit to the buffer size, with this as maximum height.
Not used if *Completions* is a special buffer with its own frame.
Not used in Emacs releases prior to 21.")

(custom-autoload 'icicle-Completions-window-max-height "icicles-opt" t)

(defvar icicle-customize-save-flag t "\
*Non-nil means save some updated Icicles options when you quit Emacs.
That is, add some functions to `kill-emacs-hook' that call
`customize-save-variable'.  Currently, this includes only function
`icicle-command-abbrev-save', which saves updated option
`icicle-command-abbrev-alist'.")

(custom-autoload 'icicle-customize-save-flag "icicles-opt" t)

(defvar icicle-customize-save-variable-function 'customize-save-variable "\
*Function used to save user option changes.
I RECOMMEND that you do NOT change this.

The option value is a function that has the same signature as
`customize-save-variable' (perhaps with additional arguments after VAR
and VAL, the variable to save and its new value.

If you do not want changes that Icicles commands make to certain user
options to be saved automatically, you can set this to the function
\(symbol) `ignore'.  If you want to use your own function to somehow
save the current value, you can set this to your function.")

(custom-autoload 'icicle-customize-save-variable-function "icicles-opt" t)

(defvar icicle-cycle-into-subdirs-flag nil "\
*Non-nil means minibuffer-input cycling explores subdirectories.
If this is non-nil, then you might want to use a function such as
`icicle-dirs-last-p' for option `icicle-sort-comparer', to prevent
cycling into subdirectories depth first.  Command
`icicle-sort-by-directories-last' does that.")

(custom-autoload 'icicle-cycle-into-subdirs-flag "icicles-opt" t)

(defvar icicle-default-cycling-mode 'prefix "\
*Default completion mode for per-mode cycling.
When you hit a completion key (`TAB' or `S-TAB'), it sets the current
completion mode (prefix or apropos, respectively).  That determines
the kind of completion to be used by the per-mode cycling keys.

This option controls which completion mode to use if you cycle using a
per-mode key (e.g. `down') *before* hitting a completion key.

 - `prefix'  means cycle prefix completions
 - `apropos' means cycle apropos completions
 - Any other non-nil value means cycle inputs from the input history
 - nil means do not cycle - you must first hit a completion key

The per-mode cycling keys are the values of
`icicle-modal-cycle-up-keys' (backward) and
`icicle-modal-cycle-down-keys' (forward).  By default, these are keys
`up' and `down' as well as the mouse wheel.

For example, if the value is `prefix' (the default) then you can
immediately cycle prefix completions using `up', `down', or the mouse
wheel, without first hitting `TAB'.

Once you have used `TAB' or `S-TAB', the only way to traverse the
history is using `M-p' and `M-n' (they always traverse the history).

This option affects only cycling with the per-mode keys.  You can
always use the mode-specific cycling keys instead to cycle according
to a particular mode.  The mode-specific keys are (by default):

 - `end'  and `home'  for prefix completion
 - `next' and `prior' for apropos completion

\(By default there is no conflict between the cycling keys that are
mode-specific and those that are per-mode.  But if you customize them
in such a way that you set a key to both, the mode-specific use takes
priority.)

After you change the value of this option, toggle Icicle mode off,
then on again, for the change to take effect in the same session.")

(custom-autoload 'icicle-default-cycling-mode "icicles-opt" t)

(defvar icicle-default-thing-insertion 'alternatives "\
*Behavior of successive `\\<minibuffer-local-map>\\[icicle-insert-string-at-point]'.
If `alternatives', then the next function in the `car' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.
If `more-of-the-same', then the function that is the `cdr' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.")

(custom-autoload 'icicle-default-thing-insertion "icicles-opt" t)

(defvar icicle-default-value t "\
*How to treat the default value when reading minibuffer input.

When the default value argument to functions such as
`completing-read', `read-file-name', `read-from-minibuffer', and
`read-string' is non-nil and the initial-input argument is nil or
\"\", the default value can be added to the prompt as a hint or
inserted into the minibuffer as the initial input.

Adding it to the prompt is the default behavior and corresponds to the
behavior of vanilla Emacs.

Inserting the default value in the minibuffer as the initial input has
the advantage of not requiring you to use `M-n' to retrieve it.  It
has the disadvantage of making you use `M-p' (or do something else) to
get rid of the default value in the minibuffer if you do not want to
use or edit it.  If you often want to use or edit the default value,
then set `icicle-default-value' to non-nil and non-t.  If you rarely
do so, then set it to nil or t.

If inserted in the minibuffer, the value of this option also
determines whether or not the inserted text is preselected and where
the cursor is left: at the beginning or end of the text.

These are the possible option values:

  nil               - Do not insert default value or add it to prompt.
  t                 - Add default value to prompt.  Do not insert it.
  `insert-start'    - Insert default value and leave cursor at start.
  `insert-end'      - Insert default value and leave cursor at end.
  `preselect-start' - Insert and preselect default value;
                      leave cursor at beginning.
  `preselect-end'   - Insert and preselect default value;
                      leave cursor at end.

My own preference is `insert-end'.

Preselection can be useful in Delete Selection mode or PC Selection
mode.  It makes it easy to replace the value by typing characters, or
delete it by hitting `C-d' or `DEL' (backspace).  However, all of the
initial input is lost if you type or hit `C-d' or `DEL'.  That is
inconvenient if you want to keep most of it and edit it only slightly.")

(custom-autoload 'icicle-default-value "icicles-opt" t)

(defvar icicle-define-alias-commands-flag t "\
*Non-nil means define some commands that do not begin with `icicle-'.
For convenience, a few top-level commands are defined, typically as
aliases for commands with longer names.  For example, command `toggle'
is defined as an alias for command `icicle-toggle-option'.  In any
case, no such command is ever defined by Icicles if a function with
the same name is already defined.")

(custom-autoload 'icicle-define-alias-commands-flag "icicles-opt" t)

(defvar icicle-deletion-action-flag t "\
*Non-nil means `S-delete' during completion deletes the current object.
More precisely, it deletes the object named by the current completion
candidate, if a deletion action is defined for the current command.
If no deletion action is defined, then the value of this option has no
effect.

If you are worried about inadvertently deleting an object by
accidentally hitting `S-delete', you can customize this to nil to
inhibit `S-delete' object deletion during completion.")

(custom-autoload 'icicle-deletion-action-flag "icicles-opt" t)

(defvar icicle-dot-show-regexp-flag nil "\
*Non-nil means show `icicle-anychar-regexp' explicitly for `.'.
Otherwise, display it as a highlighted `.' only.
This has no effect for Emacs versions prior to 21: acts as if non-nil.")

(custom-autoload 'icicle-dot-show-regexp-flag "icicles-opt" t)

(defvar icicle-dot-string "." "\
*String inserted by `icicle-insert-dot-command'.
It is either \".\" or the value of `icicle-anychar-regexp'.
You can toggle this at any time using command `icicle-toggle-dot',
bound to \\<minibuffer-local-completion-map>`\\[icicle-toggle-dot]' during completion.")

(custom-autoload 'icicle-dot-string "icicles-opt" nil)

(defvar icicle-expand-input-to-common-match-flag t "\
*Non-nil means `S-TAB' expands input, still matching all candidates.
The expansion replaces your input in the minibuffer.

Your expanded input is typically the longest substring common to all
completion candidates and that matches your (complete) input pattern.

If you want to edit your original input, use \\<minibuffer-local-completion-map>`\\[icicle-retrieve-previous-input]'.

For apropos completion, your input is, in general, a regexp.  Setting
this option to nil will let you always work with a regexp in the
minibuffer for apropos completion - your regexp is then never replaced
by the expanded common match.

You can toggle this option at any time from the minibuffer using
`C-;'.")

(custom-autoload 'icicle-expand-input-to-common-match-flag "icicles-opt" t)

(defvar icicle-file-extras nil "\
*List of additional file-name candidates added to the normal list.
List elements are strings.")

(custom-autoload 'icicle-file-extras "icicles-opt" t)

(defvar icicle-file-match-regexp nil "\
*nil or a regexp that file-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-file-no-match-regexp'.")

(custom-autoload 'icicle-file-match-regexp "icicles-opt" t)

(defvar icicle-file-no-match-regexp nil "\
*nil or a regexp that file-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-file-match-regexp'.")

(custom-autoload 'icicle-file-no-match-regexp "icicles-opt" t)

(defvar icicle-file-predicate nil "\
*nil or a predicate that file-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only names of files
with more than 5000 bytes:

  (lambda (fil) (> (nth 5 (file-attributes file)) 5000))

This predicate is applied after matching against user input.  It thus
corresponds to `icicle-must-pass-after-match-predicate', not to
`icicle-must-pass-predicate'.")

(custom-autoload 'icicle-file-predicate "icicles-opt" t)

(defvar icicle-file-require-match-flag nil "\
*Override `icicle-require-match-flag' for file-name completion.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-file-require-match-flag "icicles-opt" t)

(defvar icicle-file-sort nil "\
*A sort function for file names, or nil.
Examples of sort functions are `icicle-dirs-last-p' and
`icicle-last-modified-first-p'.  If nil, then file names are not
sorted.")

(custom-autoload 'icicle-file-sort "icicles-opt" t)

(defvar icicle-files-ido-like-flag nil "\
t means `icicle-file' and similar commands act more Ido-like.
Specifically, those commands then bind these options to t:
 `icicle-show-Completions-initially-flag'
 `icicle-top-level-when-sole-completion-flag'
 `icicle-default-value'")

(custom-autoload 'icicle-files-ido-like-flag "icicles-opt" t)

(defvar icicle-filesets-as-saved-completion-sets-flag t "\
*Non-nil means you can use filesets to save candidates persistently.
This means that you can save file-name candidates in a persistent
Icicles saved completion set (cache file) or in in an Emacs fileset.
It also means that an Icicles persistent completion set can contain
filesets, in addition to file names: any number of filesets, and
filesets of different type.  Available only for Emacs 22 and later,
and you must load library `filesets.el'.")

(custom-autoload 'icicle-filesets-as-saved-completion-sets-flag "icicles-opt" t)

(defvar icicle-guess-commands-in-path nil "\
*Non-nil means all shell commands are available for completion.
This is used in Icicle mode whenever a shell-command is read.

If non-nil, then all executable files (or all files, if option
`shell-completion-execonly' is nil) in your search path are included
among the completion candidates, in addition to any commands that are
guessed as being appropriate for the target files (e.g. marked files
in Dired).

If non-nil and if option `icicle-shell-command-candidates-cache' is
nil, then the list of commands is computed once and cached as the
value of `icicle-shell-command-candidates-cache'.  The particular
non-nil value of `icicle-guess-commands-in-path' determines when the
cache is filled, as follows:

- If the value is `load', then the cache is filled when Icicles is
  first loaded, and it is saved persistently.

- If the value is `first-use', then the cache is filled when you first
  complete a shell command, and the computed list is not saved
  persistently.

If the value is not `load', then whenever you enter Icicle mode the
cache is emptied.

If your environment changes and you want to update the cached list,
you can use command `icicle-recompute-shell-command-candidates'.  With
a prefix argument, that command also saves the cache persistently.")

(custom-autoload 'icicle-guess-commands-in-path "icicles-opt" t)

(defvar icicle-help-in-mode-line-flag t "\
*Non-nil means show help in the mode-line for individual completions.
If buffer *Completions* is displayed, then use its mode-line.
Otherwise, use the mode-line of the current buffer.

The help is shown when you cycle among completion candidates and when
your input is completed (entirely) to a candidate.

Face `icicle-mode-line-help' is used for the help.")

(custom-autoload 'icicle-help-in-mode-line-flag "icicles-opt" t)

(defvar icicle-hide-common-match-in-Completions-flag nil "\
*Non-nil means hide the common match for your input in *Completions*.
The common match is elided using ellipsis (`...').
You can use `C-M-.' during completion to toggle this option.

 The common match used here is governed by option
`icicle-expand-input-to-common-match-flag'.")

(custom-autoload 'icicle-hide-common-match-in-Completions-flag "icicles-opt" t)

(defvar icicle-highlight-historical-candidates-flag t "\
*Non-nil means highlight *Completions* candidates that have been used.
This is done using face `icicle-historical-candidate'.
Historical candidates are those that you have entered (using `RET' or
`S-RET') previously.  You can toggle this option from the minibuffer
at any time using `C-pause'.")

(custom-autoload 'icicle-highlight-historical-candidates-flag "icicles-opt" t)

(defvar icicle-highlight-input-completion-failure 'implicit-strict "\
*Non-nil means highlight the part of your input that does not complete.
This is done using face `icicle-input-completion-fail' or
`icicle-input-completion-fail-lax'.

You can use `\\<minibuffer-local-completion-map>\\[icicle-goto/kill-failed-input]' to go to the start of the highlighted part.
Repeat to kill it.

This highlighting can have a negative impact on performance, because
it can mean recomputing completion candidates multiple times, in order
to determine the longest part that completes.  For this reason, you
can fine tune when you want this highlighting to occur.  The values of
this option and options
`icicle-highlight-input-completion-failure-delay' and
`icicle-highlight-input-completion-failure-threshold' determine when
the highlighting can take place.

In particular, highlighting the non-matching part of remote file names
can be slow.  Two values of this option allow remote file name
highlighting: `always' and `explicit-remote'.  The other values do not
highlight remote file names.  You probably do not want to use a value
of `always'.

If the value is nil, then highlighting never occurs.  If the value is
`explicit-strict', `explicit', or `explicit-remote', then highlighting
occurs only upon demand: when you hit `TAB' or `S-TAB' to request
completion.  If the value is `implicit-strict', `implicit', or
`always', then highlighting occurs also when you update your input
during incremental completion.

If the value is `implicit-strict' or `implicit', then highlighting
occurs not only upon demand but also during incremental completion if
`icicle-incremental-completion-flag' is non-nil.  Remember that you
can toggle incremental completion, using `C-#' in the minibuffer.

I use a value of `implicit' myself, but the default value is
`implicit-strict' because, depending on your setup and use cases,
`implicit' can impact performance for file-name completion (which is
lax, not strict).  I suggest you try `implicit' to see - this feature
is especially useful for file names.

Summary of choices for when to highlight:

nil               Never
`explicit-strict' When you hit `TAB'/`S-TAB' for strict completion
`explicit'        When you hit `TAB'/`S-TAB'
`explicit-remote' When you hit `TAB'/`S-TAB', including remote files
`implicit-strict' During strict completion
`implicit'        During lax or strict completion
`always'          Always, even for names of remote files

After highlighting, you can use `C-M-l' to move the cursor to the
start of the mismatch, for editing there.  You can use a second
`C-M-l' to kill (delete) the mismatch up to the next input line (if
any).  You can repeat `C-M-l' to kill additional input lines.

See also:
* `icicle-highlight-input-completion-failure-delay'
* `icicle-highlight-input-completion-failure-threshold'")

(custom-autoload 'icicle-highlight-input-completion-failure "icicles-opt" t)

(defvar icicle-highlight-input-completion-failure-delay 0.7 "\
*Seconds to wait before highlighting non-completing part of your input.
Zero means there is no wait.")

(custom-autoload 'icicle-highlight-input-completion-failure-delay "icicles-opt" t)

(defvar icicle-highlight-input-completion-failure-threshold 1000 "\
*More candidates means do not highlight non-completing part of input.
See also `icicle-highlight-input-completion-failure'.")

(custom-autoload 'icicle-highlight-input-completion-failure-threshold "icicles-opt" t)

(defvar icicle-highlight-input-initial-whitespace-flag t "\
*Non-nil means highlight initial whitespace in your input.
This is done using face `icicle-whitespace-highlight'.
Purpose: Otherwise, you might not notice that you accidentally typed
some whitespace at the beginning of your input, so you might not
understand the set of matching candidates (or lack thereof).

Note: Highlighting input completion failure (see option
`icicle-highlight-input-completion-failure') subsumes
initial-whitespace highlighting.  This means that if no completion
candidate starts with whitespace, and if Icicles is highlighting input
completion failure, then only that highlighting is shown.")

(custom-autoload 'icicle-highlight-input-initial-whitespace-flag "icicles-opt" t)

(defvar icicle-highlight-lighter-flag t "\
*Non-nil means highlight the `Icy' mode-line lighter during completion.
See the Icicles doc, section `Nutshell View of Icicles', subsection
`Completion Status Indicators' for more information.")

(custom-autoload 'icicle-highlight-lighter-flag "icicles-opt" t)

(defvar icicle-ignored-directories (and (boundp 'vc-directory-exclusion-list) vc-directory-exclusion-list) "\
Directories ignored by `icicle-locate-file'.")

(custom-autoload 'icicle-ignored-directories "icicles-opt" t)

(defvar icicle-ignore-space-prefix-flag nil "\
*Non-nil means ignore completion candidates that start with a space.
However, such candidates are not ignored for prefix completion when
the input also starts with a space.  You can toggle this option from
the minibuffer using `M-_'.
Note: Some Icicles functionalities ignore the value of this option.")

(custom-autoload 'icicle-ignore-space-prefix-flag "icicles-opt" t)

(defvar icicle-incremental-completion-delay 0.7 "\
*Number of seconds to wait before updating *Completions* incrementally.
There is no wait if the number of completion candidates is less than
or equal to `icicle-incremental-completion-threshold'.
See also `icicle-incremental-completion-flag'.")

(custom-autoload 'icicle-incremental-completion-delay "icicles-opt" t)

(defvar icicle-incremental-completion-flag t "\
*Non-nil means update *Completions* buffer incrementally, as you type.
nil means do not update *Completions* buffer incrementally, as you type.
t means do nothing if *Completions* is not already displayed.
Non-nil and non-t means display *Completions* and update it.
You can toggle this between t and nil from the minibuffer at any time
using `C-#'.

Note: Incremental completion is effectively turned off when a remote
file name is read, that is, whenever your file-name input matches a
remote-file syntax.

See also `icicle-incremental-completion-delay' and
`icicle-incremental-completion-threshold'.")

(custom-autoload 'icicle-incremental-completion-flag "icicles-opt" t)

(defvar icicle-incremental-completion-threshold 1000 "\
*More candidates means apply `icicle-incremental-completion-delay'.
See also `icicle-incremental-completion-flag' and
`icicle-incremental-completion-delay'.
This threshold is also used to decide when to display the message
 \"Displaying completion candidates...\".")

(custom-autoload 'icicle-incremental-completion-threshold "icicles-opt" t)

(defvar icicle-inhibit-advice-functions '(choose-completion choose-completion-string completing-read completion-setup-function dired-smart-shell-command display-completion-list exit-minibuffer face-valid-attribute-values minibuffer-complete-and-exit mouse-choose-completion next-history-element read-face-name read-file-name read-number shell-command shell-command-on-region switch-to-completions completing-read-multiple) "\
Functions that Icicles redefines, and for which advice is deactivated.
Icicle mode deactivates all advice for such functions.  The advice is
reactivated when you leave Icicle mode.")

(custom-autoload 'icicle-inhibit-advice-functions "icicles-opt" t)

(defvar icicle-inhibit-ding-flag nil "\
*Non-nil means Icicles never uses an audible bell (ding).
If nil, Icicles sometimes signals you with a sound.")

(custom-autoload 'icicle-inhibit-ding-flag "icicles-opt" t)

(defvar icicle-input-string ".*" "\
*String to insert in minibuffer via `\\<minibuffer-local-completion-map>\\[icicle-insert-string-from-variable]'.
Typically, this is a regexp or a portion of a regexp.")

(custom-autoload 'icicle-input-string "icicles-opt" t)

(defvar icicle-inter-candidates-min-spaces 1 "\
*Minimum number of spaces between candidates displayed in *Completions*.
If you use Do Re Mi (library `doremi.el'), then you can modify this
option incrementally during completion, seeing the effect as it
changes.  Use `\\<minibuffer-local-completion-map>\\[icicle-doremi-inter-candidates-min-spaces+]' from the minibuffer, then use the `up' and
`down' arrow keys or the mouse wheel to increment and decrement the
value.  WYSIWYG.

See also option `icicle-candidate-width-factor' and (starting with
Emacs 23) option `icicle-Completions-text-scale-decrease'.")

(custom-autoload 'icicle-inter-candidates-min-spaces "icicles-opt" t)

(defvar icicle-isearch-complete-keys '([C-M-tab] [M-tab] "\211" [escape tab] "\357") "\
*Key sequences to use for `icicle-isearch-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.

The default value includes `M-TAB', which replaces the vanilla binding
of `isearch-complete'.

It also includes `ESC TAB' and `C-M-TAB', because some operating
systems intercept `M-TAB' for their own use.  (Note: For MS Windows,
you can use (w32-register-hot-key [M-tab]) to allow Emacs to use
`M-TAB'.)

It also includes `M-o', in keeping with the Icicles use of `M-o'
during minibuffer completion.")

(custom-autoload 'icicle-isearch-complete-keys "icicles-opt" t)

(defvar icicle-key-complete-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use for `icicle-complete-key'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-key-complete-keys "icicles-opt" t)

(defvar icicle-key-descriptions-use-<>-flag nil "\
*Non-nil means Icicles key descriptions should use angle brackets (<>).
For example, non-nil gives `<mode-line>'; nil gives `mode-line'.

This does not affect Emacs key descriptions outside of
Icicles (e.g. `C-h k' or `C-h w').

This has no effect for versions of Emacs prior to 21, because
they never use angle brackets.")

(custom-autoload 'icicle-key-descriptions-use-<>-flag "icicles-opt" t)

(defvar icicle-keymaps-for-key-completion '(bookmark-bmenu-mode-map bmkp-jump-map bmkp-jump-other-window-map calendar-mode-map dired-mode-map facemenu-keymap jde-mode-map jde-jdb-mode-map senator-mode-map srecode-mode-map synonyms-mode-map vc-dired-mode-map) "\
*List of keymaps in which to bind `S-TAB' to `icicle-complete-keys'.
List elements are symbols that are bound to keymaps.

Each keymap should have at least one prefix key.  `S-TAB' is bound in
each keymap, so that you can use it to complete the prefix keys.

If one of the keymaps is not defined when Icicle mode is entered, then
it is ignored.  If you later define it, then just exit and reenter
Icicle mode, to bind `S-TAB' in the newly defined map.  For example,
use `M-x icy-mode' twice after entering Calendar mode, to be able to
complete `calendar-mode' prefix keys such as `A'.

Do not add `global-map' or any keymaps, such as `ctl-x-map', that are
accessible from the global keymap to the list - they are already
treated, by default.

Do not add any of the translation keymaps, `function-key-map',
`key-translation-map', or `iso-transl-ctl-x-8-map' to the list - that
will not work.")

(custom-autoload 'icicle-keymaps-for-key-completion "icicles-opt" t)

(when (boundp 'kmacro-ring) (defcustom icicle-kmacro-ring-max (if (boundp 'most-positive-fixnum) most-positive-fixnum 67108863) "*Icicles version of `kmacro-ring-max'." :type 'integer :group 'Icicles-Miscellaneous))

(defvar icicle-levenshtein-distance 1 "\
*Levenshtein distance allowed for strings to be considered as matching.
Icicles matching function `icicle-levenshtein-match' considers a
string to match another if the first string is within this distance of
some substring of the second.
This option is used only if you have library `levenshtein.el'.")

(custom-autoload 'icicle-levenshtein-distance "icicles-opt" t)

(defvar icicle-list-end-string "\n\n" "\
*String appended to a completion candidate that is a list of strings.
When a completion candidate is a list of strings, they are joined
pairwise using `icicle-list-join-string', and `icicle-list-end-string'
is appended to the joined strings.  The result is what is displayed as
a completion candidate in buffer *Completions*, and that is what is
matched by your minibuffer input.

The purpose of `icicle-list-end-string' is to allow some separation
between the displayed completion candidates.  Candidates that are
provided to input-reading functions such as `completing-read' as lists
of strings are often displayed using multiple lines of text.  If
`icicle-list-end-string' is \"\", then the candidates appear run
together, with no visual separation.

It is important to remember that `icicle-list-end-string' is part of
each completion candidate in such circumstances.  This matters if you
use a regexp that ends in `$', matching the end of the candidate.")

(custom-autoload 'icicle-list-end-string "icicles-opt" t)

(defvar icicle-list-join-string (let ((strg (copy-sequence "\n"))) (when (> emacs-major-version 21) (set-text-properties 0 1 '(display "") strg)) strg) "\
*String joining items in a completion that is a list of strings.
When a completion candidate is a list of strings, this string is used
to join the strings in the list, for display and matching purposes.
When completing input, you type regexps that match the strings,
separating them pairwise by the value of `icicle-list-join-string'.
Actually, what you enter is interpreted as a single regexp to be
matched against the joined strings.  Typically, the candidate list
contains two strings: a name and its doc string.

A good value for this option is a string that:
 1) does not normally occur in doc strings,
 2) visually separates the two strings it joins, and
 3) is not too difficult or too long to type.

The default value is \"^G
\", that is, control-g followed by
control-j (newline):
 1) ^G does not normally occur in doc strings
 2) a newline visually separates the multiple component strings, which
    helps readability in buffer *Completions*
 3) you can type the value using `C-q C-g C-q C-j'.

For readability (in Emacs 22 and later), the default value has a
`display' property that makes it appear as simply a newline in
*Completions* - the `^G' is hidden.  you can also make the default
value appear this way in your minibuffer input also, by using `\\<minibuffer-local-completion-map>\\[icicle-insert-list-join-string].'

If you like the default value of `^G^J', but you prefer that the `^G'
not be hidden, then just customize this option.  In Customize, use
`Show initial Lisp expression' after clicking the `State' button, to
be able to edit the default value.  Remove the `set-text-properties'
expression, which sets text property `display' to \"\".")

(custom-autoload 'icicle-list-join-string "icicles-opt" t)

(defvar icicle-list-nth-parts-join-string " " "\
*String joining candidate parts split by `icicle-list-use-nth-parts'.
This has an effect on multi-completion candidates only, and only if
the current command uses `icicle-list-use-nth-parts'.")

(custom-autoload 'icicle-list-nth-parts-join-string "icicles-opt" t)

(defvar icicle-max-candidates nil "\
Non-nil means truncate completion candidates to at most this many.
If you use library `doremi.el' then you can use `C-x #' during
completion to increment or decrement the option value using the
vertical arrow keys or the mouse wheel.  A numeric prefix argument for
`C-x #' sets the increment size.  A plain prefix argument (`C-u')
resets `icicle-max-candidates' to nil, meaning no truncation.")

(custom-autoload 'icicle-max-candidates "icicles-opt" t)

(defvar icicle-menu-items-to-history-flag t "\
Non-nil means to add menu-item commands to the command history.
This history is `extended-command-history'.

After you change the value of this option, toggle Icicle mode off,
then on again, for the change to take effect in the same session.")

(custom-autoload 'icicle-menu-items-to-history-flag "icicles-opt" t)

(defvar icicle-minibuffer-setup-hook nil "\
*Functions run at the end of minibuffer setup for Icicle mode.")

(custom-autoload 'icicle-minibuffer-setup-hook "icicles-opt" t)

(defvar icicle-modal-cycle-down-keys (if (boundp 'mouse-wheel-down-event) (list [down] (vector nil mouse-wheel-up-event) (vector mouse-wheel-up-event)) '([down])) "\
*Key sequences to use for modal cycling to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-down-action-keys'.")

(custom-autoload 'icicle-modal-cycle-down-keys "icicles-opt" t)

(defvar icicle-modal-cycle-down-action-keys (if (boundp 'mouse-wheel-up-event) (list [C-down] (vector nil (list 'control mouse-wheel-up-event)) (vector (list 'control mouse-wheel-up-event))) '([C-down])) "\
*Keys for modal completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-down-keys'.")

(custom-autoload 'icicle-modal-cycle-down-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-down-alt-action-keys (if (boundp 'mouse-wheel-up-event) (list [C-S-down] (vector nil (list 'control 'shift mouse-wheel-up-event)) (vector (list 'control 'shift mouse-wheel-up-event))) '([C-S-down])) "\
*Keys for modal completion to cycle next and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-down-alt-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-down-help-keys (if (boundp 'mouse-wheel-up-event) (list [(control meta down)] (vector nil (list 'control 'meta mouse-wheel-up-event)) (vector (list 'control 'meta mouse-wheel-up-event))) '([(control meta down)])) "\
*Keys for modal completion to cycle next and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-down-help-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-keys (if (boundp 'mouse-wheel-down-event) (list [up] (vector nil mouse-wheel-down-event) (vector mouse-wheel-down-event)) '([up])) "\
*Key sequences to use for modal cycling to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-up-action-keys'.")

(custom-autoload 'icicle-modal-cycle-up-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-action-keys (if (boundp 'mouse-wheel-down-event) (list [C-up] (vector nil (list 'control mouse-wheel-down-event)) (vector (list 'control mouse-wheel-down-event))) '([C-up])) "\
*Keys for modal completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-up-keys'.")

(custom-autoload 'icicle-modal-cycle-up-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-alt-action-keys (if (boundp 'mouse-wheel-down-event) (list [C-S-up] (vector nil (list 'control 'shift mouse-wheel-down-event)) (vector (list 'control 'shift mouse-wheel-down-event))) '([C-S-up])) "\
*Keys for modal completion to cycle previous and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-up-alt-action-keys "icicles-opt" t)

(defvar icicle-modal-cycle-up-help-keys (if (boundp 'mouse-wheel-down-event) (list [(control meta up)] (vector nil (list 'control 'meta mouse-wheel-down-event)) (vector (list 'control 'meta mouse-wheel-down-event))) '([(control meta up)])) "\
*Keys for modal completion to cycle previous and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-modal-cycle-up-help-keys "icicles-opt" t)

(defvar icicle-no-match-hook nil "\
*List of hook functions run during completion when there are no matches.")

(custom-autoload 'icicle-no-match-hook "icicles-opt" t)

(defvar icicle-option-type-prefix-arg-list '(direct inherit inherit-or-value direct-or-value inherit-or-regexp direct-or-regexp) "\
*Symbols controlling prefix args for `icicle-describe-option-of-type'.
A list of six symbols taken from this list:

  direct            inherit             inherit-or-value
  direct-or-value   inherit-or-regexp   direct-or-regexp

Choose the order you like.  The list members map, in order left to
right, to these prefix argument keys:

 `C-u C-u'           `C-0'            `C-u'
 `C-9' (positive)    no prefix arg    `C--' (negative)

For the meanings of the symbols, see the doc string of
`icicle-describe-option-of-type', which describes the default
prefix-argument bindings for the command.")

(custom-autoload 'icicle-option-type-prefix-arg-list "icicles-opt" t)

(when (> emacs-major-version 22) (defcustom icicle-populate-interactive-history-flag nil "*Non-nil means populate `icicle-interactive-history'.\nThat means add commands invoked interactively to that history, for use\nduring completion by `C-M-pause'.\n\nAfter you change the value of this option, toggle Icicle mode off,\nthen on again, for the change to take effect in the same session.\n\nBe aware that this history can become quite long.\n\nFurthermore, there is an Emacs bug (#3984) that causes interactiveness\ntests (`interactive-p' and `called-interactively-p') to fail, whenever\n`call-interactively' is advised (which is how Icicles implements this\nfeature)." :type 'boolean :group 'Icicles-Miscellaneous))

(defvar icicle-pp-eval-expression-print-length nil "\
*Value for `print-length' while printing value in `pp-eval-expression'.
A value of nil means no limit.")

(custom-autoload 'icicle-pp-eval-expression-print-length "icicles-opt" t)

(defvar icicle-pp-eval-expression-print-level nil "\
*Value for `print-level' while printing value in `pp-eval-expression'.
A value of nil means no limit.")

(custom-autoload 'icicle-pp-eval-expression-print-level "icicles-opt" t)

(defvar icicle-prefix-complete-keys '([tab] [(control 105)]) "\
*Key sequences to use for `icicle-prefix-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-complete-keys "icicles-opt" t)

(defvar icicle-prefix-complete-no-display-keys '([(control meta tab)]) "\
*Key sequences to use for `icicle-prefix-complete-no-display'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-complete-no-display-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-keys '([end]) "\
*Key sequences for prefix completion to cycle to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-next-action-keys'.")

(custom-autoload 'icicle-prefix-cycle-next-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-action-keys '([C-end]) "\
*Keys for prefix completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-next-keys'.")

(custom-autoload 'icicle-prefix-cycle-next-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-alt-action-keys '([C-S-end]) "\
*Keys for prefix completion to cycle next and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-next-alt-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-next-help-keys '([(control meta end)]) "\
*Keys for prefix completion to cycle next and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-next-help-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-keys '([home]) "\
*Key sequences for prefix completion to cycle to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-previous-action-keys'.")

(custom-autoload 'icicle-prefix-cycle-previous-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-action-keys '([C-home]) "\
*Keys for prefix completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-previous-keys'.")

(custom-autoload 'icicle-prefix-cycle-previous-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-alt-action-keys '([C-S-home]) "\
*Keys for prefix completion to cycle previous and perform alt action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-previous-alt-action-keys "icicles-opt" t)

(defvar icicle-prefix-cycle-previous-help-keys '([(control meta home)]) "\
*Keys for prefix completion to cycle previous and show candidate help.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-prefix-cycle-previous-help-keys "icicles-opt" t)

(defvar icicle-previous-candidate-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use for `icicle-move-to-previous-completion'.
In buffer *Completions*, this moves backward among candidates.

A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-previous-candidate-keys "icicles-opt" t)

(defvar icicle-quote-shell-file-name-flag t "\
Non-nil means to double-quote the file name that starts a shell command.
This is used by `icicle-read-shell-command-completing'.

If this is nil, then Emacs commands such as `M-!' will not quote a
shell-command file name such as `c:/Program Files/My Dir/mycmd.exe'.
In that case, a shell such as `bash' fails for a shell command such as
`c:/Program Files/My Dir/mycmd.exe arg1 arg2 &', because it interprets
only `c:/Program' as the shell command.  That is, it interprets the
space characters in the file name as separators.  If this is non-nil,
then input such as `c:/Program Files/My Dir/mycmd.exe arg1 arg2 &' is
passed to the shell as
`\"c:/Program Files/My Dir/mycmd.exe\" arg1 arg2 &'.

See the doc string of `icicle-quote-file-name-part-of-cmd' for
information about the characters that, like SPC, lead to quoting.")

(custom-autoload 'icicle-quote-shell-file-name-flag "icicles-opt" t)

(defvar icicle-read+insert-file-name-keys '([(control meta shift 102)]) "\
*Key sequences to invoke `icicle-read+insert-file-name'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.")

(custom-autoload 'icicle-read+insert-file-name-keys "icicles-opt" t)

(defvar icicle-redefine-standard-commands-flag t "\
*Non-nil means Icicle mode redefines some standard Emacs commands.")

(custom-autoload 'icicle-redefine-standard-commands-flag "icicles-opt" t)

(defvar icicle-regexp-quote-flag nil "\
*Non-nil means special characters in regexps are escaped.
This means that no characters are recognized as special: they match
themselves.  This turns apropos completion into simple substring
completion.  It also turns Icicles searching into literal searching.
You can toggle this option from the minibuffer at any
time using `C-`'.")

(custom-autoload 'icicle-regexp-quote-flag "icicles-opt" t)

(defvar icicle-regexp-search-ring-max (if (boundp 'most-positive-fixnum) (/ most-positive-fixnum 10) 13421772) "\
*Icicles version of `regexp-search-ring-max'.")

(custom-autoload 'icicle-regexp-search-ring-max "icicles-opt" t)

(defvar icicle-region-background (if (featurep 'hexrgb) (let* ((bg (or (and (boundp '1on1-active-minibuffer-frame-background) 1on1-active-minibuffer-frame-background) (let ((frame-bg (cdr (assq 'background-color (frame-parameters))))) (when (member frame-bg '(nil unspecified "unspecified-bg")) (setq frame-bg (if (eq frame-background-mode 'dark) "Black" "White"))) (and frame-bg (x-color-defined-p frame-bg) frame-bg)) (face-background 'region))) (sat (condition-case nil (hexrgb-saturation bg) (error nil)))) (if sat (if (hexrgb-approx-equal sat 0.0) (icicle-increment-color-value bg (if (eq frame-background-mode 'dark) 20 -10)) (icicle-increment-color-hue bg 24)) (face-background 'region))) (face-background 'region)) "\
*Background color to use for the region during minibuffer cycling.
This has no effect if `icicle-change-region-background-flag' is nil.
If you do not define this explicitly, and if you have loaded library
`hexrgb.el' (recommended), then this color will be slightly
different from your frame background.  This still lets you notice the
region, but it makes the region less conspicuous, so you can more
easily read your minibuffer input.")

(custom-autoload 'icicle-region-background "icicles-opt" t)

(defvar icicle-require-match-flag nil "\
*Control REQUIRE-MATCH arg to `completing-read' and `read-file-name'.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.")

(custom-autoload 'icicle-require-match-flag "icicles-opt" t)

(defvar icicle-saved-completion-sets nil "\
*Completion sets available for `icicle-candidate-set-retrieve'.
The form is ((SET-NAME . CACHE-FILE-NAME)...), where SET-NAME is the
name of a set of completion candidates and CACHE-FILE-NAME is the
absolute name of the cache file that contains those candidates.
You normally do not customize this directly, statically.
Instead, you add or remove sets using commands
`icicle-add/update-saved-completion-set' and
`icicle-remove-saved-completion-set'.")

(custom-autoload 'icicle-saved-completion-sets "icicles-opt" t)

(defvar icicle-search-cleanup-flag t "\
*Controls whether to remove highlighting after a search.
If this is nil, highlighting can be removed manually with
`\\[icicle-search-highlight-cleanup]'.")

(custom-autoload 'icicle-search-cleanup-flag "icicles-opt" t)

(defvar icicle-search-from-isearch-keys '([S-tab] [S-iso-lefttab]) "\
*Key sequences to use to start `icicle-search' from Isearch.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.")

(custom-autoload 'icicle-search-from-isearch-keys "icicles-opt" t)

(defvar icicle-search-highlight-all-current-flag nil "\
*Non-nil means highlight input match in each context search hit.
Setting this to non-nil can impact performance negatively, because the
highlighting is updated with each input change.  You can toggle this
option from the minibuffer during `C-c`' search using `C-^'.")

(custom-autoload 'icicle-search-highlight-all-current-flag "icicles-opt" t)

(defvar icicle-search-highlight-context-levels-flag t "\
*Non-nil means highlight 1-8 context levels, within the search context.
Level highlighting is done only when this is non-nil and a subgroup is
not used as the search context, that is, the context corresponds to
the entire search regexp.")

(custom-autoload 'icicle-search-highlight-context-levels-flag "icicles-opt" t)

(defvar icicle-search-highlight-threshold 100000 "\
*Max number of context search hits to highlight at once.
This highlighting uses face `icicle-search-main-regexp-others'.")

(custom-autoload 'icicle-search-highlight-threshold "icicles-opt" t)

(defvar icicle-search-hook nil "\
*List of hook functions run by `icicle-search' (see `run-hooks').")

(custom-autoload 'icicle-search-hook "icicles-opt" t)

(defvar icicle-search-replace-common-match-flag t "\
*Non-nil means to replace the expanded common match of your input.
This has no effect if either
`icicle-search-highlight-all-current-flag' or
`icicle-expand-input-to-common-match-flag' is nil.
You can toggle those options from the minibuffer using `C-^' and
`C-|', respectively.  You can toggle
`icicle-search-replace-common-match-flag' using `M-;'.")

(custom-autoload 'icicle-search-replace-common-match-flag "icicles-opt" t)

(defvar icicle-search-replace-literally-flag nil "\
*Non-nil means to treat replacement text literally.
Otherwise (nil), interpret `\\' specially in replacement text, as in
the LITERAL argument to `replace-match'.

You can use `M-`' to toggle this at any time during Icicles search.")

(custom-autoload 'icicle-search-replace-literally-flag "icicles-opt" t)

(defvar icicle-search-replace-whole-candidate-flag t "\
*Non-nil means replacement during search replaces the entire search hit.
Otherwise (nil), replace only what matches your current input.

You can use `C-,' to toggle this at any time during Icicles search.")

(custom-autoload 'icicle-search-replace-whole-candidate-flag "icicles-opt" t)

(defvar icicle-search-ring-max (if (boundp 'most-positive-fixnum) (/ most-positive-fixnum 10) 13421772) "\
*Icicles version of `search-ring-max'.")

(custom-autoload 'icicle-search-ring-max "icicles-opt" t)

(defvar icicle-search-whole-word-flag nil "\
*Non-nil means that `icicle-search' looks for a whole word.
You can use `M-q' to toggle this at any time during Icicles search.")

(custom-autoload 'icicle-search-whole-word-flag "icicles-opt" t)

(defvar icicle-shell-command-candidates-cache (and (eq icicle-guess-commands-in-path 'load) (icicle-compute-shell-command-candidates)) "\
Cache for shell command candidates.
You typically do not need to customize this option.
It is an option mainly to persist its value.
See `icicle-guess-commands-in-path'.")

(custom-autoload 'icicle-shell-command-candidates-cache "icicles-opt" t)

(if (and (fboundp 'defvaralias) (boundp 'completion-show-help)) (defvaralias 'icicle-show-Completions-help-flag 'completion-show-help) (defcustom icicle-show-Completions-help-flag t "*Non-nil means display help lines at the top of buffer *Completions*." :type 'boolean :group 'Icicles-Completions-Display))

(defvar icicle-show-Completions-initially-flag nil "\
*Non-nil means to show buffer *Completions* even without user input.
nil means that *Completions* is shown upon demand, via `TAB' or
`S-TAB'.

For an alternative but similar behavior to using non-nil for
`icicle-show-Completions-initially-flag', you can set option
`icicle-incremental-completion-flag' to a value that is neither nil
nor t.  That displays buffer *Completions* as soon as you type or
delete input, but not initially.")

(custom-autoload 'icicle-show-Completions-initially-flag "icicles-opt" t)

(defvar icicle-show-multi-completion-flag t "\
*Non-nil means to show completion candidates as multi-completions.
This has an effect only where multi-completion is available.
Also, some commands, such as `icicle-locate-file', use a prefix arg to
determine whether to show multi-completions.  Such commands generally
ignore this option.

A typical example of showing multi-completions is adding buffer names
to candidates to show which buffer they are associated with.  Some
commands, such as `icicle-search', append the name of the associated
buffer, highlighted, to the normal completion candidate.  This lets
you easily see which buffer the candidate applies to.  Also, the
buffer name is part of the candidate, so you can match against it.

Note: Even when the option value is nil, you can use `C-M-mouse-2' and
so on to see information about a candidate.  This information
typically includes whatever a non-nil value of the option would have
shown.

You can toggle this option from the minibuffer using `M-m'.  The new
value takes effect after you exit the minibuffer (i.e., for the next
command).")

(custom-autoload 'icicle-show-multi-completion-flag "icicles-opt" t)

(defvar icicle-sort-comparer 'icicle-case-string-less-p "\
*Predicate or predicates for sorting (comparing) two items.
Used in particular to sort completion candidates.  In that case, this
determines the order of candidates when cycling and their order in
buffer *Completions*.

When `icicle-cycle-into-subdirs-flag' is non-nil, you might want to
use a function such as `icicle-dirs-last-p' for this option, to
prevent cycling into subdirectories depth first.  Command
`icicle-sort-by-directories-last' does that.

You can cycle completion sort orders at any time using `C-,' in the
minibuffer.

Although this is a user option, it may be changed by program
locally, for use in particular contexts.  In particular, you can bind
this to nil in an Emacs-Lisp function, to inhibit sorting in that
context.

Various sorting commands change the value of this option dynamically
\(but they do not save the changed value).

The value must be one of the following:

* nil, meaning do not sort

* a predicate that takes two items as args

* a list of the form ((PRED...) FINAL-PRED), where each PRED and
  FINAL-PRED are binary predicates

If the value is a list of predicates, then each PRED is tried in turn
until one returns a non-nil value.  In that case, the result is the
car of that value.  If no non-nil value is returned by any PRED, then
FINAL-PRED is used and its value is the result.

Each PRED should return `(t)' for true, `(nil)' for false, or nil for
undecided.  A nil value means that the next PRED decides (or
FINAL-PRED, if there is no next PRED).

Thus, a PRED is a special kind of predicate that indicates either a
boolean value (as a singleton list) or \"I cannot decide - let the
next guy else decide\".  (Essentially, each PRED is a hook function
that is run using `run-hook-with-args-until-success'.)

Examples:

 nil           - No sorting.

 string-lessp  - Single predicate that returns nil or non-nil.

 ((p1 p2))     - Two predicates `p1' and `p2', which each return
                 (t) for true, (nil) for false, or nil for undecided.

 ((p1 p2) string-lessp)
               - Same as previous, except if both `p1' and `p2' return
                 nil, then the return value of `string-lessp' is used.

Note that these two values are generally equivalent, in terms of their
effect (*):

 ((p1 p2))
 ((p1) p2-plain) where p2-plain is (icicle-make-plain-predicate p2)

Likewise, these three values generally act equivalently:

 ((p1))
 (() p1-plain)
 p1-plain        where p1-plain is (icicle-make-plain-predicate p1)

The PRED form lets you easily combine predicates: use `p1' unless it
cannot decide, in which case try `p2', and so on.  The value ((p2 p1))
tries the predicates in the opposite order: first `p2', then `p1' if
`p2' returns nil.

Using a single predicate or FINAL-PRED makes it easy to reuse an
existing predicate that returns nil or non-nil.

You can also convert a PRED-type predicate (which returns (t), (nil),
or nil) into an ordinary predicate, by using function
`icicle-make-plain-predicate'.  That lets you reuse elsewhere, as
ordinary predicates, any PRED-type predicates you define.

Note: As a convention, predefined Icicles PRED-type predicate names
have the suffix `-cp' (for \"component predicate\") instead of `-p'.")

(custom-autoload 'icicle-sort-comparer "icicles-opt" t)

(defvar icicle-buffer-configs `(("All" nil nil nil nil ,icicle-sort-comparer) ("Files" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname))) nil ,icicle-sort-comparer) ("Files and Scratch" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname))) ("*scratch*") ,icicle-sort-comparer) ("All, *...* Buffers Last" nil nil nil nil icicle-buffer-sort-*\.\.\.*-last)) "\
*List of option configurations available for `icicle-buffer-config'.
The form is (CONFIG...), where CONFIG is a list of these items:

 - Configuration name                    (string)
 - `icicle-buffer-match-regexp' value    (regexp string)
 - `icicle-buffer-no-match-regexp' value (regexp string)
 - `icicle-buffer-predicate' value       (function)
 - `icicle-buffer-extras' value          (list of strings)
 - `icicle-buffer-sort' value            (function)

A configuration describes which buffer names are displayed during
completion and their order.")

(custom-autoload 'icicle-buffer-configs "icicles-opt" t)

(defvar icicle-special-candidate-regexp nil "\
*Regexp to match special completion candidates, or nil to do nothing.
The candidates are highlighted in buffer *Completions* using face
`icicle-special-candidate'.")

(custom-autoload 'icicle-special-candidate-regexp "icicles-opt" t)

(defvar icicle-S-TAB-completion-methods-alist `(("apropos" . string-match) ("scatter" . icicle-scatter-match) ,@(and (require 'fuzzy nil t) '(("Jaro-Winkler" . fuzzy-match))) ,@(and (require 'levenshtein nil t) '(("Levenshtein" . icicle-levenshtein-match) ("Levenshtein strict" . icicle-levenshtein-strict-match)))) "\
*Alist of completion methods used by `S-TAB'.
Each element has the form (NAME . FUNCTION), where NAME is a string
name and FUNCTION is the completion match function.  NAME is used in
messages to indicate the type of completion matching.

By default, `S-TAB' is the key for this completion. The actual keys
used are the value of option `icicle-apropos-complete-keys'.

See also option `icicle-TAB-completion-methods'.")

(custom-autoload 'icicle-S-TAB-completion-methods-alist "icicles-opt" t)

(defvar icicle-swank-prefix-length 1 "\
*Length (chars) of symbol prefix that much match, for swank completion.")

(custom-autoload 'icicle-swank-prefix-length "icicles-opt" t)

(defvar icicle-swank-timeout 3000 "\
*Number of msec before swank (fuzzy symbol) completion gives up.")

(custom-autoload 'icicle-swank-timeout "icicles-opt" t)

(defvar icicle-TAB-completion-methods (let ((methods nil)) (when (require 'el-swank-fuzzy nil t) (push 'swank methods)) (when (require 'fuzzy-match nil t) (push 'fuzzy methods)) (when (boundp 'completion-styles) (push 'vanilla methods)) (push 'basic methods) methods) "\
*List of completion methods to use for `\\<minibuffer-local-completion-map>\\[icicle-prefix-complete]'.
The first method in the list is the default method.

The available methods can include these:

1. `basic'
2. `vanilla' (provided you have Emacs 23 or later)
3. `fuzzy'   (provided you have library `fuzzy-match.el')
4. `swank'   (provided you have library `el-swank-fuzzy.el')

1. Basic completion means ordinary prefix completion. It is the
`basic' completion style of Emacs 23 or later, and it is essentially
the completion style prior to Emacs 23 (Emacs 22 completion was
slightly different - see Emacs 23 option `custom-styles' for more
info).

2. Vanilla completion respects option `completion-styles' (new in
Emacs 23), so that `TAB' behaves similarly in Icicles to what it does
in vanilla Emacs.  The vanilla method also completes environment
variables during file-name completion and in shell commands.  The
non-vanilla methods do not complete environment variables, but the
variables are expanded to their values when you hit `RET'.

3. Fuzzy completion is a form of prefix completion in which matching
finds the candidates that have the most characters in common with your
input, in the same order, and with a minimum of non-matching
characters.  It can skip over non-matching characters, as long as the
number of characters skipped in the candidate is less that those
following them that match.  After the matching candidates are found,
they are sorted by skip length and then candidate length.

Fuzzy completion is described in detail in the commentary of library
`fuzzy-match.el'.  There is no fuzzy completion of file names - fuzzy
completion is the same as basic for file names.  Fuzzy completion is
always case-sensitive.

4. Swank completion in Icicles is the same as fuzzy completion, except
regarding symbols.  That is, swank completion per se applies only to
symbols.  Symbols are completed using the algorithm of library
`el-swank-fuzzy.el'.

Icicles options `icicle-swank-timeout' and
`icicle-swank-prefix-length' give you some control over the behavior.
When the `TAB' completion method is `swank', you can use `C-x 1'
\(`icicle-doremi-increment-swank-timeout+') and `C-x 2'
\(`icicle-doremi-increment-swank-prefix-length+') in the minibuffer to
increment these options on the fly using the arrow keys `up' and
`down'.

Swank symbol completion uses heuristics that relate to supposedly
typical patterns found in symbol names.  It also uses a timeout that
can limit the number of matches.  It is generally quite a bit slower
than fuzzy completion, and it sometimes does not provide all
candidates that you might think should match, even when all of your
input is a prefix (or even when it is already complete!).  If swank
completion produces no match when you think it should, remember that
you can use `\\[icicle-next-TAB-completion-method]' on the fly to change the completion method.


If you do not customize `icicle-TAB-completion-methods', then the
default value (that is, the available `TAB' completion methods) will
reflect your current Emacs version and whether you have loaded
libraries `fuzzy-match.el' and `el-swank-fuzzy.el'.

By default, `TAB' is the key for this completion. The actual keys
used are the value of option `icicle-prefix-complete-keys'.

See also option `icicle-S-TAB-completion-methods-alist'.")

(custom-autoload 'icicle-TAB-completion-methods "icicles-opt" t)

(defvar icicle-TAB-shows-candidates-flag t "\
*Non-nil means that `TAB' always shows completion candidates.
Otherwise (nil), follow the standard Emacs behavior of completing to
the longest common prefix, and only displaying the candidates after a
second `TAB'.

Actually, the concerned keys are those defined by option
`icicle-prefix-complete-keys', not necessarily `TAB'.")

(custom-autoload 'icicle-TAB-shows-candidates-flag "icicles-opt" t)

(defvar icicle-test-for-remote-files-flag t "\
*Non-nil means Icicles tests for remote file names.
A value of nil turns off all handling of remote file names by Tramp,
including file-name completion.

The testing due to a non-nil value takes a little time, but the test
result saves time with Tramp handling, and it is used to avoid some
other costly operations when a file is determined to be remote.  These
operations are (a) incremental completion and (b) highlighting of the
part of your current input that does not complete.

Use a nil value only when you are sure that the file names you are
completing are local.  The effect will be a slight speed increase for
operations (a) and (b) for local files.

In addition, a nil value has the effect of ignoring the restriction of
input mismatch highlighting to strict completion.  That is, it treats
an `icicle-highlight-input-completion-failure' value of
`explicit-strict' or `implicit-strict' as if it were `implicit'.  The
assumption here is that you use these highlighting values only to
avoid the cost of remote file name completion.

You can toggle this option from the minibuffer using `C-^' (except
during Icicles search).")

(custom-autoload 'icicle-test-for-remote-files-flag "icicles-opt" nil)

(defvar icicle-thing-at-point-functions (progn (or (require 'ffap- nil t) (require 'ffap nil t)) (cons `(,(if (fboundp 'symbol-name-nearest-point) 'symbol-name-nearest-point (lambda nil (symbol-name (symbol-at-point)))) ,(if (fboundp 'region-or-word-nearest-point) 'region-or-word-nearest-point (lambda nil (thing-at-point 'word))) ,@(and (fboundp 'ffap-guesser) '(ffap-guesser)) thing-at-point-url-at-point) 'forward-word)) "\
*Functions that return a string at or near the cursor when you use `M-.'.
A cons cell whose car and cdr may each be empty.

The car of the cons cell is a list of functions that grab different
kinds of strings at or near point.  By default, there are four
functions, which grab 1) whatever `ffap-guesser' finds, 2) the symbol
or file name, 3) the word, 4) the URL at point.  Any number of
functions can be used.  They are used in sequence by command
`icicle-insert-string-at-point' (bound to `M-.').

The cdr of the cons cell is nil or a function that advances point one
text thing.  Each time command `icicle-insert-string-at-point' is
called successively, this is called to grab more things of text (of
the same kind).  By default, successive words are grabbed.

If either the car or cdr is empty, then the other alone determines the
behavior of `icicle-insert-string-at-point'.  Otherwise, option
`icicle-default-thing-insertion' determines whether the car or cdr is
used by `icicle-insert-string-at-point'.  `C-u' with no number
reverses the meaning of `icicle-default-thing-insertion'.")

(custom-autoload 'icicle-thing-at-point-functions "icicles-opt" t)

(defvar icicle-yank-function 'yank "\
*Yank function.  A function that takes a prefix argument.  This
should be a command that is bound to whatever key you use to yank
text, whether in Icicle mode or not.  In Icicle mode, command
`icicle-yank-maybe-completing' calls this function, except when
`icicle-yank-maybe-completing' is called from the minibuffer or called
with a negative prefix argument.  `icicle-yank-maybe-completing'
passes the raw prefix argument to `icicle-yank-function'.

By default (see option `icicle-top-level-key-bindings'), the command
that is the value of this option is remapped to
`icicle-yank-maybe-completing' the first time you enter Icicle mode.
If you customize `icicle-yank-function', then, to take advantage of
this default remapping behavior, you will need to save your
customization and then restart Emacs.

Alternatively, you can customize both `icicle-yank-function' and the
corresponding entry in `icicle-top-level-key-bindings', and then
toggle Icicle mode off and then back on.")

(custom-autoload 'icicle-yank-function "icicles-opt" t)

(defvar icicle-top-level-key-bindings `((,(kbd "<pause>") icicle-switch-to/from-minibuffer t) (,(kbd "C-c `") icicle-search-generic t) (,(kbd "C-c $") icicle-search-word t) (,(kbd "C-c ^") icicle-search-keywords t) (,(kbd "C-c '") icicle-occur t) (,(kbd "C-c =") icicle-imenu t) (,(kbd "C-c \"") icicle-search-text-property t) (,(kbd "C-c /") icicle-complete-thesaurus-entry t) (,(kbd "C-x M-e") icicle-execute-named-keyboard-macro t) (,(kbd "C-x SPC") icicle-command-abbrev t) (,(kbd "C-x 5 o") icicle-select-frame t) (,(kbd "C-h C-o") icicle-describe-option-of-type t) ,@(and (require 'kmacro nil t) `((,(kbd "S-<f4>") icicle-kmacro t))) (abort-recursive-edit icicle-abort-recursive-edit t) (bookmark-jump icicle-bookmark t) (bookmark-jump-other-window icicle-bookmark-other-window t) (bookmark-set icicle-bookmark-cmd t) (minibuffer-keyboard-quit icicle-abort-recursive-edit (fboundp 'minibuffer-keyboard-quit)) (delete-window icicle-delete-window t) (delete-windows-for icicle-delete-window t) (dired icicle-dired t) (dired-other-window icicle-dired-other-window t) (exchange-point-and-mark icicle-exchange-point-and-mark t) (execute-extended-command icicle-execute-extended-command t) (find-file icicle-file t) (find-file-other-window icicle-file-other-window t) (find-file-read-only icicle-find-file-read-only t) (find-file-read-only-other-window icicle-find-file-read-only-other-window t) (insert-buffer icicle-insert-buffer t) (kill-buffer icicle-kill-buffer t) (kill-buffer-and-its-windows icicle-kill-buffer t) (other-window icicle-other-window-or-frame t) (other-window-or-frame icicle-other-window-or-frame t) (pop-global-mark icicle-goto-global-marker-or-pop-global-mark t) (set-mark-command icicle-goto-marker-or-set-mark-command t) (switch-to-buffer icicle-buffer t) (switch-to-buffer-other-window icicle-buffer-other-window t) (where-is icicle-where-is t) (,icicle-yank-function icicle-yank-maybe-completing t) (bmkp-bookmark-list-jump icicle-bookmark-bookmark-list (featurep 'bookmark+)) (bmkp-desktop-jump icicle-bookmark-desktop (featurep 'bookmark+)) (bmkp-dired-jump icicle-bookmark-dired (featurep 'bookmark+)) (bmkp-dired-jump-other-window icicle-bookmark-dired-other-window (featurep 'bookmark+)) (bmkp-file-jump icicle-bookmark-file (featurep 'bookmark+)) (bmkp-file-jump-other-window icicle-bookmark-file-other-window (featurep 'bookmark+)) (bmkp-gnus-jump icicle-bookmark-gnus (featurep 'bookmark+)) (bmkp-gnus-jump-other-window icicle-bookmark-gnus-other-window (featurep 'bookmark+)) (bmkp-info-jump icicle-bookmark-info (featurep 'bookmark+)) (bmkp-info-jump-other-window icicle-bookmark-info-other-window (featurep 'bookmark+)) (bmkp-local-file-jump icicle-bookmark-local-file (featurep 'bookmark+)) (bmkp-local-file-jump-other-window icicle-bookmark-local-file-other-window (featurep 'bookmark+)) (bmkp-man-jump icicle-bookmark-man (featurep 'bookmark+)) (bmkp-man-jump-other-window icicle-bookmark-man-other-window (featurep 'bookmark+)) (bmkp-non-file-jump icicle-bookmark-non-file (featurep 'bookmark+)) (bmkp-non-file-jump-other-window icicle-bookmark-non-file-other-window (featurep 'bookmark+)) (bmkp-region-jump icicle-bookmark-region (featurep 'bookmark+)) (bmkp-region-jump-other-window icicle-bookmark-region-other-window (featurep 'bookmark+)) (bmkp-remote-file-jump icicle-bookmark-remote-file (featurep 'bookmark+)) (bmkp-remote-file-jump-other-window icicle-bookmark-remote-file-other-window (featurep 'bookmark+)) (bmkp-specific-buffers-jump icicle-bookmark-specific-buffers (featurep 'bookmark+)) (bmkp-specific-buffers-jump-other-window icicle-bookmark-specific-buffers-other-window (featurep 'bookmark+)) (bmkp-specific-files-jump icicle-bookmark-specific-files (featurep 'bookmark+)) (bmkp-specific-files-jump-other-window icicle-bookmark-specific-files-other-window (featurep 'bookmark+)) (bmkp-this-buffer-jump icicle-bookmark-this-buffer (featurep 'bookmark+)) (bmkp-this-buffer-jump-other-window icicle-bookmark-this-buffer-other-window (featurep 'bookmark+)) (bmkp-all-tags-jump icicle-bookmark-all-tags (featurep 'bookmark+)) (bmkp-all-tags-jump-other-window icicle-bookmark-all-tags-other-window (featurep 'bookmark+)) (bmkp-all-tags-jump icicle-bookmark-all-tags-regexp (featurep 'bookmark+)) (bmkp-all-tags-regexp-jump-other-window icicle-bookmark-all-tags-regexp-other-window (featurep 'bookmark+)) (bmkp-some-tags-jump icicle-bookmark-some-tags (featurep 'bookmark+)) (bmkp-some-tags-jump-other-window icicle-bookmark-some-tags-other-window (featurep 'bookmark+)) (bmkp-some-tags-jump icicle-bookmark-some-tags-regexp (featurep 'bookmark+)) (bmkp-some-tags-regexp-jump-other-window icicle-bookmark-some-tags-regexp-other-window (featurep 'bookmark+)) (bmkp-url-jump icicle-bookmark-url (featurep 'bookmark+)) (bmkp-url-jump-other-window icicle-bookmark-url-other-window (featurep 'bookmark+)) (bmkp-w3m-jump icicle-bookmark-w3m (featurep 'bookmark+)) (bmkp-w3m-jump-other-window icicle-bookmark-w3m-other-window (featurep 'bookmark+)) (find-tag icicle-find-tag (fboundp 'command-remapping)) (find-tag-other-window icicle-find-first-tag-other-window t) (pop-tag-mark icicle-pop-tag-mark (fboundp 'command-remapping)) (eval-expression icicle-pp-eval-expression (fboundp 'command-remapping)) (pp-eval-expression icicle-pp-eval-expression (fboundp 'command-remapping)) (,(kbd "ESC M-x") lacarte-execute-command (fboundp 'lacarte-execute-command)) (,(kbd "M-`") lacarte-execute-menu-command (fboundp 'lacarte-execute-menu-command)) (,(kbd "<f10>") lacarte-execute-menu-command (fboundp 'lacarte-execute-menu-command))) "\
*List of top-level commands to bind in Icicle mode.
Each list element is of custom type `icicle-key-definition' and has
the form (KEY COMMAND CONDITION).

KEY is either a key sequence (string or vector) to bind COMMAND to or
a command to remap to COMMAND.
COMMAND is bound according to the value of KEY, unless the result of
evaluating CONDITION is nil.

In Customize, to specify a key sequence, choose `Key' in the `Value
Menu', then enter a key description such as that returned by `C-h k'.
For convenience, you can use insert each key in the key description by
hitting `C-q' then the key.  For example, to enter the key description
`C-c M-k' you can use `C-q C-c C-q M-k'.

If you customize this option, then you must exit and re-enter Icicle
mode to ensure that the change takes effect.  This is really necessary
only if your changes would undefine a key.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.")

(custom-autoload 'icicle-top-level-key-bindings "icicles-opt" nil)

(defvar icicle-top-level-when-sole-completion-delay 0.7 "\
*Number of secs to wait to return to top level if only one completion.
This has no effect if `icicle-top-level-when-sole-completion-flag' is
nil.  Editing the completion (typing or deleting a character) before
the delay expires prevents its automatic acceptance.

Do not set this to 0.0.  Set it to slightly more than zero if you want
instant action.")

(custom-autoload 'icicle-top-level-when-sole-completion-delay "icicles-opt" t)

(defvar icicle-top-level-when-sole-completion-flag nil "\
*Non-nil means to return to top level if only one matching completion.
The sole completion is accepted.")

(custom-autoload 'icicle-top-level-when-sole-completion-flag "icicles-opt" t)

(defvar icicle-touche-pas-aux-menus-flag nil "\
*Non-nil means do not add items to menus except Minibuf and Icicles.
This value is used only when Icicles mode is initially established, so
changing this has no effect after Icicles has been loaded.  However,
you can change it and save the new value so it will be used next time.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.")

(custom-autoload 'icicle-touche-pas-aux-menus-flag "icicles-opt" t)

(defvar icicle-transform-function nil "\
*Function used to transform the list of completion candidates.
This is applied to the list of initial candidates.
If this is nil, then no transformation takes place.

You can toggle this option at any time from the minibuffer using
`C-$,'.

NOTE: Although this is a user option, you probably do *NOT* want to
customize it.  Icicles commands already \"do the right thing\" when it
comes to candidate transformation.  The value of this option may be
changed by program locally, for use in particular contexts.  For
example, when you use `C-c C-`' (`icicle-search-generic') in a
*shell* buffer, Icicles uses this variable with a value of
`icicle-remove-duplicates', to remove duplicate shell commands from
your input history list.

Emacs-Lisp programmers can use this variable to transform the list of
candidates in any way they like.  A typical use is to remove
duplicates, by binding it to `icicle-remove-duplicates' or
`icicle-remove-dups-if-extras'.")

(custom-autoload 'icicle-transform-function "icicles-opt" t)

(defvar icicle-type-actions-alist '(("buffer" (lambda (b) (with-current-buffer b (ps-print-buffer))) 1-window-frames-on another-buffer browse-url-of-buffer buffer-disable-undo buffer-enable-undo buffer-file-name buffer-local-variables buffer-modified-p buffer-name buffer-size bury-buffer choose-grep-buffer current-line-string delete-1-window-frames-on delete-windows-for delete-windows-on delete/iconify-windows-on describe-buffer-bindings diff-buffer-with-file display-buffer display-buffer-other-frame echo-in-buffer eval-buffer fontify-buffer generate-new-buffer get-buffer get-buffer-process get-buffer-window get-buffer-window-list grepp-choose-grep-buffer ibuffer-jump-to-buffer icicle-char-properties-in-buffer icicle-delete-window icicle-delete-windows-on icicle-help-line-buffer icicle-kill-a-buffer insert-buffer insert-buffer-substring insert-buffer-substring-as-yank insert-buffer-substring-no-properties kill-buffer kill-buffer-and-its-windows kill-buffer-if-not-modified last-buffer multi-window-frames-on other-buffer pop-to-buffer pr-interface remove-windows-on replace-buffer-in-windows smiley-buffer switch-to-buffer switch-to-buffer-other-frame switch-to-buffer-other-window view-buffer view-buffer-other-frame view-buffer-other-window) ("color" color-defined-p color-gray-p color-supported-p color-values colors doremi-set-background-color doremi-set-foreground-color eyedrop-color-message facemenu-set-background facemenu-set-foreground hexrgb-blue hexrgb-color-name-to-hex hexrgb-complement hexrgb-green hexrgb-hex-to-color-values hexrgb-hue hexrgb-red hexrgb-saturation hexrgb-value icicle-color-help icicle-color-name-w-bg palette-brightness-scale palette-color-message palette-complement-or-alternative palette-hex-info palette-hsv-info palette-rgb-info palette-swatch ps-e-color-values ps-e-x-color-values set-background-color set-border-color set-cursor-color set-foreground-color set-mouse-color tty-color-canonicalize tty-color-desc tty-color-standard-values tty-color-translate tty-color-values x-color-defined-p x-color-values) ("command" command-remapping define-prefix-command describe-command disable-command doremi-push-frame-config-for-command enable-command Info-find-emacs-command-nodes Info-goto-emacs-command-node) ("face" color-theme-spec custom-facep customize-face customize-face-other-window custom-theme-recalc-face describe-face face-all-attributes face-attr-construct face-background face-background-20+ face-background-pixmap face-bold-p face-default-spec face-differs-from-default-p face-doc-string face-documentation face-font face-foreground face-foreground-20+ face-id face-inverse-video-p face-italic-p face-nontrivial-p face-spec-reset-face face-stipple face-underline-p face-user-default-spec facemenu-add-face facemenu-add-new-face facemenu-set-face find-face-definition hlt-choose-default-face hlt-show-default-face hlt-unhighlight-region-for-face icicle-customize-face icicle-customize-face-other-window invert-face make-face make-face-bold make-face-bold-italic make-face-italic make-face-unbold make-face-unitalic moccur-face-check modify-face ps-face-attributes read-all-face-attributes read-face-font) ("file" abbreviate-file-name ange-ftp-chase-symlinks ange-ftp-file-modtime apropos-library auto-coding-alist-lookup bookmark-file-or-variation-thereof bookmark-load browse-url-of-file byte-compile-file check-declare-file comint-append-output-to-file comint-quote-filename comint-substitute-in-file-name comint-unquote-filename comint-write-output compilation-get-file-structure cookie-insert create-file-buffer delete-file describe-file dired-delete-file diredp-mouse-diff dired-show-file-type dir-locals-find-file dir-locals-read-from-file do-after-load-evaluation ebnf-eps-file ebnf-print-file ebnf-spool-file ebnf-syntax-file ediff-backup epa-decrypt-file epa-import-keys epa-verify-file eval-next-after-load ffap-file-remote-p ffap-locate-file file-attributes file-cache-add-file file-chase-links file-dependents file-directory-p file-executable-p file-exists-p file-loadhist-lookup file-local-copy file-modes file-name-nondirectory file-newest-backup file-nlinks file-ownership-preserved-p file-provides file-readable-p file-regular-p file-relative-name file-remote-p file-requires file-symlink-p file-system-info file-truename file-writable-p find-alternate-file find-alternate-file-other-window find-buffer-visiting finder-commentary find-file find-file-at-point find-file-binary find-file-literally find-file-noselect find-file-other-frame find-file-other-window find-file-read-only find-file-read-only-other-frame find-file-read-only-other-window find-file-text get-file-buffer gnus-audio-play gnus-convert-png-to-face hexl-find-file highlight-compare-with-file icicle-add-file-to-fileset icicle-delete-file-or-directory icicle-describe-file icicle-file-remote-p icicle-help-line-file icicle-search-file icicle-shell-command-on-file image-type-from-file-header image-type-from-file-name Info-find-file Info-index-nodes info-lookup-file Info-toc-nodes info-xref-check insert-file insert-file-literally insert-image-file list-tags lm-commentary lm-creation-date lm-keywords lm-keywords-list lm-last-modified-date lm-summary lm-synopsis lm-verify lm-version load load-file load-history-regexp make-backup-file-name move-file-to-trash open-dribble-file open-termscript play-sound-file pr-ps-file-preview pr-ps-file-print pr-ps-file-ps-print pr-ps-file-using-ghostscript recentf-add-file recentf-push recentf-remove-if-non-kept recover-file rmail-input rmail-output set-file-times set-visited-file-name substitute-in-file-name system-move-file-to-trash untranslated-canonical-name untranslated-file-p url-basepath vc-backend vc-delete-automatic-version-backups vc-file-clearprops vc-insert-file vc-make-version-backup vc-name vc-state vc-working-revision view-file view-file-other-frame view-file-other-window visit-tags-table w32-browser w32-long-file-name w32-short-file-name w32explore woman-find-file write-file xml-parse-file) ("frame" current-window-configuration delete-frame delete-other-frames thumfr-dethumbify-frame doremi-undo-last-frame-color-change thumfr-fisheye fit-frame fit-frame-maximize-frame fit-frame-minimize-frame fit-frame-restore-frame frame-char-height frame-char-width frame-current-scroll-bars frame-extra-pixels-height frame-extra-pixels-width frame-face-alist frame-first-window frame-focus frame-height frame-iconified-p frame-parameters frame-pixel-height frame-pixel-width frame-root-window frame-selected-window frame-set-background-mode frame-terminal frame-visible-p frame-width get-a-frame get-frame-name hide-frame icicle-select-frame-by-name iconify-frame lower-frame make-frame-invisible make-frame-visible maximize-frame maximize-frame-horizontally maximize-frame-vertically menu-bar-open minimize-frame next-frame thumfr-only-raise-frame previous-frame raise-frame really-iconify-frame redirect-frame-focus redraw-frame restore-frame restore-frame-horizontally restore-frame-vertically select-frame select-frame-set-input-focus set-frame-name show-frame thumfr-thumbify-frame thumfr-thumbify-other-frames thumfr-thumbnail-frame-p thumfr-toggle-thumbnail-frame toggle-max-frame toggle-max-frame-horizontally toggle-max-frame-vertically toggle-zoom-frame tty-color-alist tty-color-clear w32-focus-frame window-list window-system window-tree x-focus-frame zoom-frm-in zoom-frm-out zoom-frm-unzoom) ("function" cancel-function-timers describe-function elp-instrument-function find-function find-function-other-frame find-function-other-window symbol-function trace-function trace-function-background) ("option" custom-note-var-changed customize-option customize-option-other-window describe-option icicle-binary-option-p tell-customize-var-has-changed) ("process" accept-process-output anything-kill-async-process clone-process continue-process delete-process get-process interrupt-process kill-process process-buffer process-coding-system process-command process-contact process-exit-status process-filter process-filter-multibyte-p process-id process-inherit-coding-system-flag process-kill-without-query process-mark process-name process-plist process-query-on-exit-flag process-running-child-p process-send-eof process-sentinel process-status process-tty-name process-type quit-process set-process-coding-system stop-process tooltip-process-prompt-regexp tq-create) ("symbol" apropos-describe-plist apropos-macrop apropos-score-symbol byte-compile-const-symbol-p custom-guess-type custom-unlispify-tag-name custom-variable-type default-boundp default-value describe-minor-mode-from-symbol fmakunbound icicle-help-on-candidate-symbol info-lookup-symbol makunbound symbol-file symbol-function symbol-plist symbol-value) ("variable" custom-type custom-variable-documentation custom-variable-p custom-variable-type describe-variable find-variable find-variable-noselect find-variable-other-frame find-variable-other-window help-custom-type icicle-custom-type kill-local-variable local-variable-if-set-p local-variable-p make-local-variable make-variable-buffer-local make-variable-frame-local symbol-value user-variable-p variable-binding-locus) ("window" balance-windows browse-kill-ring-fit-window compilation-set-window-height delete-other-windows delete-other-windows-vertically delete-window delete/iconify-window fit-frame-max-window-size fit-window-to-buffer mouse-drag-vertical-line-rightward-window mouse-drag-window-above next-window previous-window remove-window select-window shrink-window-if-larger-than-buffer split-window truncated-partial-width-window-p window--display-buffer-1 window--even-window-heights window--try-to-split-window window-body-height window-buffer window-buffer-height window-current-scroll-bars window-dedicated-p window-display-table window-edges window-end window-fixed-size-p window-frame window-fringes window-full-width-p window-height window-hscroll window-inside-edges window-inside-pixel-edges window-margins window-minibuffer-p window-parameters window-pixel-edges window-point window-safely-shrinkable-p window-scroll-bars window-start window-text-height window-vscroll window-width)) "\
*Alist of Emacs object types and associated actions.
Each element has the form (TYPE FUNCTION...), where TYPE names an
object type, and each FUNCTION accepts an object of type TYPE as its
only required argument

A FUNCTION here can be a symbol or a lambda form.  You can use a
symbol that is not yet `fboundp', that is, one that does not yet have
a function definition.  Any symbols that do not have function
definitions when this option is used are simply filtered out.

However, just because a function is defined at runtime does not mean
that it will work.  For example, function `buffer-size' is included in
the default value for type `buffer', but in Emacs 20 `buffer-size'
accepts no arguments, so applying it to a buffer name raises an error.

\[Note: If you have suggestions or corrections for the default value,
send them in, using `\\[icicle-send-bug-report]'.  The initial list
was drawn up quickly by looking at functions with the type in their
name and that accept a value of that type as only required argument.
There is no doubt that the default value could be improved.]")

(custom-autoload 'icicle-type-actions-alist "icicles-opt" t)

(defvar icicle-unpropertize-completion-result-flag nil "\
*Non-nil means strip text properties from the completion result.
Set this option to non-nil only if you need to ensure, for some other
library, that the string returned by `completing-read' and (starting
with Emacs 23) `read-file-name' has no text properties.

Typically, you will not use a non-nil value.  Internal text properties
added by Icicles are always removed anyway.  A non-nil value lets you
also remove properties such as `face'.")

(custom-autoload 'icicle-unpropertize-completion-result-flag "icicles-opt" t)

(defvar icicle-update-input-hook nil "\
*Functions run when minibuffer input is updated (typing or deleting).")

(custom-autoload 'icicle-update-input-hook "icicles-opt" t)

(defvar icicle-use-~-for-home-dir-flag t "\
*Non-nil means abbreviate your home directory using `~'.
You can toggle this option from the minibuffer at any time using
`M-~'.")

(custom-autoload 'icicle-use-~-for-home-dir-flag "icicles-opt" t)

(defvar icicle-use-C-for-actions-flag t "\
*Non-nil means use modifier `C-' (Control) for multi-command actions.
If nil, then you need no `C-' modifier for actions, and, instead, you
need a `C-' modifier for ordinary candidate cycling.

It is not strictly correct to speak in terms of the `C-' modifier -
that is only the default behavior.  The actual keys concerned are
those defined by these options:

 `icicle-modal-cycle-down-action-keys'
 `icicle-modal-cycle-up-action-keys'
 `icicle-apropos-cycle-next-action-keys'
 `icicle-apropos-cycle-previous-action-keys'
 `icicle-prefix-cycle-next-action-keys'
 `icicle-prefix-cycle-previous-action-keys'

You can toggle this option from the minibuffer at any time using
`M-g'.")

(custom-autoload 'icicle-use-C-for-actions-flag "icicles-opt" t)

(defvar icicle-use-anything-candidates-flag t "\
*Non-nil means Icicles can include Anything candidates for completion.
When non-nil, Anything actions are used for candidate alternate
actions in some Icicles commands, and Anything types and actions are
used by command `icicle-object-action' (aka `a' and `what-which-how').

This option has no effect if library `anything.el' cannot be loaded.")

(custom-autoload 'icicle-use-anything-candidates-flag "icicles-opt" t)

(defvar icicle-use-candidates-only-once-flag nil "\
*Non-nil means remove each candidate from the set after using it.
When you use a multi-command and act on a candidate (for example, with
`C-RET'), the candidate is removed from those available if this is
non-nil.  If this is nil, then the candidate is not removed, so you
can act on it again.

You can customize this option if you prefer the non-nil behavior all
of the time.  However, most users will not want to do that.

If you write Emacs-Lisp code, you can bind this to non-nil during
completion in contexts where it makes little sense for users to act on
the same candidate more than once.  That way, users cannot choose it
again, and they are not distracted seeing it as a candidate.

See also non-option variable `icicle-use-candidates-only-once-alt-p'.")

(custom-autoload 'icicle-use-candidates-only-once-flag "icicles-opt" t)

(defvar icicle-word-completion-keys '([(meta 32)]) "\
*Key sequences to use for minibuffer prefix word completion.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Because file names, in particular, can contain spaces, some people
prefer such a key sequence to be non-printable, such as `M-SPC'.  This
is the default value in Icicles.

But because the spacebar is such a convenient key to hit, other people
prefer to use `SPC' for word completion, and to insert a space some
other way.  The usual way to do that is via `C-q SPC', but command
`icicle-insert-a-space' is provided for convenience.  You can bind
this to `M-SPC', for instance, in `minibuffer-local-completion-map',
`minibuffer-local-completion-map', and
`minibuffer-local-must-match-map'.")

(custom-autoload 'icicle-word-completion-keys "icicles-opt" t)

(defvar icicle-WYSIWYG-Completions-flag "MMMM" "\
*Non-nil means show candidates in *Completions* using WYSIWYG.
This has an effect only for completion of faces and colors.

The particular non-nil value determines the appearance:
* If t, the candidate is shown with its text properties.
* If a string, the string is propertized and then appended to the
  candidate,  to serve as a color swatch.

Some commands might override a string value with different text.  This
is the case for `icicle-read-color', for instance: the color swatch
text is always the color's RGB code.

Note that, starting with Emacs 22, if this option is non-nil, then
command `describe-face' does not use `completing-read-multiple', since
that (non-Icicles) function does not support WYSIWYG candidates.")

(custom-autoload 'icicle-WYSIWYG-Completions-flag "icicles-opt" t)

;;;***

;;;### (autoloads nil nil ("icicles-chg.el" "icicles-doc1.el" "icicles-doc2.el"
;;;;;;  "icicles-mac.el" "icicles-pkg.el" "icicles-var.el" "icicles.el"
;;;;;;  "synonyms.el") (19991 46054 924930))

;;;***

(provide 'icicles-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; icicles-autoloads.el ends here
