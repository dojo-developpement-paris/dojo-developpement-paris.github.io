(require :asdf)

(load "./src/hello.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(test hello-world
      (is (equal "Hello world" (hello nil))))

(test hello-foo
      (is (equal "Hello foo" (hello "foo"))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
