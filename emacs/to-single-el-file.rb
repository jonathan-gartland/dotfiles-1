#!/bin/env ruby

require 'find'

def section_header(filepath)
  header_label = filepath.split('/')[-1].split('.')[0]
  "
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; #{header_label}
"
end

def section_footer
  "
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  "
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
              section_footer].join("\n"))
end

File.open('emacs-combined.el', 'w') do |file|
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
end
