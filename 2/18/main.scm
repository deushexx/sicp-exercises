(define (reverse l)
  (if (null? (cdr l))
      (car l)
      (cons (reverse (cdr l))
            (car l))))

(display (reverse (list 1 4 9 16 25)))
// FIXME
