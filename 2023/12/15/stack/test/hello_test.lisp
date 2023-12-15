(require :asdf)

(load "./src/hello.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)

(test empty-shouldbe-empty
    (is (check-empty (empty))))

(test pushing-on-empty-makes-it-not-empty
    (is (not (check-empty (stack-push 4807 (empty))))))

(test empty-stack-has-size-0
      (is (eql 0 (stack-size (empty)))))

(test after-one-push-stack-size-is-1
      (is (eql 1 (stack-size
                   (stack-push 42 (empty))))))

(test after-two-push-stack-size-is-2
      (is (eql 2 (stack-size
                   (stack-push 12
                      (stack-push 42 (empty)))))))

(test after-a-push-peek-gives-the-top-value
      (is (eql 23 (stack-peek
                    (stack-push 23 (empty)))))
      (is (eql 17 (stack-peek
                    (stack-push 17 (empty))))))

(test after-pop-stack-is-empty
      (is (check-empty 
            (cdr (stack-pop (stack-push 4807 (empty))))))
      (is (not (check-empty
                 (cdr (stack-pop (stack-push 42 (stack-push 23 (empty))))))))
      (is (eql 4806
               (car (stack-pop (stack-push 4806 (empty))))))
      )

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
