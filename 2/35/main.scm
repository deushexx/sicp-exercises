(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)) 

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (node)
                     (if (pair? node)
                       (count-leaves node)
                       1))
                   t)))

(define x (cons (list 1 2) (list 3 4)))
(display (count-leaves x))
