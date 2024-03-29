(define nil (list))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square x) (* x x))

(define (square-tree tree)
  (map (lambda (tree)
         (if (pair? tree)
           (square-tree tree)
           (square tree)))
       tree))

(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))
