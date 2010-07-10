(defpackage #:binary-data-tests
  (:use :cl :eos :flexi-streams :binary-data))

(in-package :binary-data-tests)

(defmacro out->seq (stream &body body)
  "All output of BODY goes to a vector."
  `(with-output-to-sequence (,stream)
     ,@body))

(in-suite* :binary-data-tests)

(test (write-little-endian-integer :suite :binary-data-tests)
  "Little endian integer written out for storage on a harddrive."
  (is (equalp #(10) (out->seq s (binary-data:write-little-endian-integer 10 s))))
  (is (equalp #(255 0) (out->seq s (binary-data:write-little-endian-integer 255 s 2))))
  (is (equalp #(0 1) (out->seq s (binary-data:write-little-endian-integer 256 s 2)))))

;;; END
