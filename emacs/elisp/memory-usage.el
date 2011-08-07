;;; memory-usage.el --- Analyze the memory usage of Emacs in various ways

;; Copyright (C) 2002, 2004  Free Software Foundation, Inc.

;; Author: Stefan Monnier <address@bogus.example.com>
;; Keywords: maint

;;  minor mods by joakim verona

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; 

;;; Code:

(defun buffer-size-bytes (b)
  "Return total number of bytes in the buffer contents."
  (with-current-buffer b
    (save-restriction
      (widen)
      (- (position-bytes (point-max)) (position-bytes (point-min))))))

(defun buffer-gap-bytes (b)
  "Return total number of bytes in the buffer gap."
  (with-current-buffer b
    (gap-size)))

(defun buffer-total-bytes (b)
  "Return total number of ralloc bytes used by buffer."
  (with-current-buffer b
    (save-restriction
      (widen) 
      (+ (position-bytes (point-max))
         (- (position-bytes (point-min)))
         (gap-size)))))

;;;###autoload
(defun memory-usage ()
  "List all buffers and their memory usage."
  (interactive)
  (pop-to-buffer (get-buffer-create "*Buffer Details*"))
  (erase-buffer)
  (let* ((bufs (buffer-list))
         (num (length bufs))
         (gc-stats (garbage-collect))
         (conses (nth 0 gc-stats))
         (symbols (nth 1 gc-stats))
         (markers (nth 2 gc-stats))
         (strings (nth 3 gc-stats))
         (vectors (nth 4 gc-stats))
         (floats (nth 5 gc-stats))
         (intervals (nth 6 gc-stats))
         (lisptotal (+ (* 8 (+ (car conses) (cdr conses)))
                       (* 24 (+ (car symbols) (cdr symbols)))
                       (* 20 (+ (car markers) (cdr markers)))
                       strings
                       vectors
                       (* 12 (+ (car floats) (cdr floats)))
                       (* 28 (+ (car intervals) (cdr intervals)))))
         (buffertotalbytes (apply #'+ (mapcar #'buffer-total-bytes bufs)))
         )
    
    (insert (format "Garbage collection stats:\n%s\n\n =>" gc-stats))
    (insert (format "\t%d bytes in cons cells\n" (* 8 (+ (car conses) (cdr 
conses)))))
    (insert (format "\t%d bytes in symbols\n" (* 24 (+ (car symbols) (cdr 
symbols)))))
    (insert (format "\t%d bytes in markers\n" (* 20 (+ (car markers) (cdr 
markers)))))
    (insert (format "\t%d bytes of string chars\n" strings))
    (insert (format "\t%d bytes of vector slots\n" (* 4 vectors)))
    (insert (format "\t%d bytes in floats\n" (* 12 (+ (car floats) (cdr 
floats)))))
    (insert (format "\t%d bytes in intervals\n" (* 28 (+ (car intervals) (cdr 
intervals)))))

    (insert (format "\nTotal bytes in lisp objects (not counting string and 
vector headers): %d\n\n"
                    lisptotal))

    (insert (format "Buffer ralloc memory usage:\n%d buffers\n%d bytes total (%d in gaps)\n"
                    num
                    buffertotalbytes
                    (apply #'+ (mapcar #'buffer-gap-bytes bufs))))
    (insert (format "%10s\t%s\t%s\n\n" "Size" "Gap" "Name"))
    (insert (mapconcat
            (lambda (b)
               (format "%10d\t%s\t%s"
                       (buffer-size-bytes b)
                       (buffer-gap-bytes b)
                       (buffer-name b)))
             (sort bufs (lambda (b1 b2)
                          (> (buffer-size-bytes b1) (buffer-size-bytes b2))))
             "\n"))
    (insert "\n")
    (insert (format "total:%s" (+ lisptotal buffertotalbytes)))

    (insert "\n"))
  (goto-char (point-min)))

(provide 'memory-usage)
;; arch-tag: 04e012f0-3c59-4319-8d1a-e86204671ec5
;;; memory-usage.el ends here