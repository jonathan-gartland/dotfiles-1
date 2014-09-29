#!/bin/env ruby

require 'find'

def section_header(filepath)
  header_label = filepath.split('/')[-1].split('.')[0]
  "\n* #{header_label}\n#+BEGIN_SRC emacs-lisp"
end

def section_footer(_filepath)
  "#+END_SRC\n"
end

def file_header
  "#+Title: skkemacs
#+Author: skk

* Options                                                  :noexport:ARCHIVE:
#+OPTIONS: todo:t html-style:nil
#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\" />
#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/steckemacs.css\" />
#+INFOJS_OPT: view:showall toc:t ftoc:t mouse:#555555 path:./js/org-info.js

#+BEGIN_SRC emacs-lisp :tangle no :results silent
(org-babel-tangle-file \"skkemacs.org\" \"skkemacs.el\" \"emacs-lisp\")
#+END_SRC"
end

def file_footer
  "#+HTML: <script type=\"text/javascript' src='https://code.jquery.com/jquery-2.1.1.min.js\"></script>
#+HTML: <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js\"></script>"
end

def clean_file(content)
  result = []
  content.each_line do |line|
    case line
    when /^\(mapc \'load \(directory-files \(expand-file-name "lisp"/
      result.push("; #{line}")
    when /^\(mapc \'load \(directory-files \(expand-file-name "lisp\/defuns"/
      result.push("; #{line}")
    else
      result.push(line)
    end
  end
  result.join
end

def read_and_write_file(file, filepath)
  content = File.read(filepath).rstrip
  content = clean_file(content)
  file.write([section_header(filepath),
              content,
              section_footer(filepath)].join("\n"))
end

File.open('skkemacs.org', 'w') do |file|

  file.write(file_header)

  Find.find('.') do |path|
    case path
    when /^(\.\/init\.el)$/
      read_and_write_file(file, Regexp.last_match[1])
    when %r{^(\.\/lisp\/\d*-.*\.el)$}
      read_and_write_file(file, Regexp.last_match[1])
    when %r{^(\.\/lisp\/defuns\/\w*\.el)$}
      read_and_write_file(file, Regexp.last_match[1])
    when %r{^(\.\/lisp\/hosts\/\w*\.el)$}
      read_and_write_file(file, Regexp.last_match[1])
    end
  end

  file.write(file_footer)
end
