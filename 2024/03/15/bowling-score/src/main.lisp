(require :asdf)

(load "./src/hello.lisp")

(princ
    (let ((name (cadr *posix-argv*)))
        (if (string= "" name)
            (hello nil)
            (hello name)
        )
    )
)

(terpri)
