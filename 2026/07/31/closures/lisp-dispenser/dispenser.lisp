; dispenser.lisp

; a structure to dispense numbers matching a given predicate

(defstruct DISPENSER items predicate index done)

(defun new-dispenser (items)
  (MAKE-DISPENSER :items items :predicate nil :index 0 :done nil))

; iterate on item from pos, returning:
; (<pos> <item>) relative position and matching item
; nil if not found
(defun find-item (items pred pos)
  (cond ((null items) nil)
        ((funcall pred (first items)) (list pos (first items)))
        (t (find-item (rest items) pred (1+ pos)))))

; find the next item in the dispenser's list matching the current predicate
; sets the next position to continue the search
; sets done to t if not found
; returns matching item or nil
(defun find-next (disp)
  (let* ((index (DISPENSER-INDEX disp))
         (items (nthcdr index (DISPENSER-ITEMS disp)))
         (pred (DISPENSER-PREDICATE disp))
         (done (DISPENSER-DONE disp))
         (result (if done nil (find-item items pred 0))))
        (if result
          (progn
            (setf (DISPENSER-INDEX disp) (+ 1 (car result) index))
            (cadr result))
          (progn
            (setf (DISPENSER-DONE disp) t)
            nil))))

; find the first item in the dispenser's list matching the predicate
; sets the predicate
; returns matching item or nil
(defun first-item (disp pred)
  (progn
    (setf (DISPENSER-PREDICATE disp) pred)  
    (setf (DISPENSER-DONE disp) nil)
    (setf (DISPENSER-INDEX disp) 0)
    (find-next disp)))

(defun next-item (disp)
    (find-next disp))

