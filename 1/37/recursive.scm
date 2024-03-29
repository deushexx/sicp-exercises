(define (cont-frac n d k)
  (define (recurse i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (recurse (+ i 1))))))
  (recurse 1))

(define (1/φ k)
  (let ((one (lambda (i) 1.0)))
    (cont-frac one one k)))

(display (1/φ 5))
(newline)
(display (1/φ 10))
(newline)
(display (1/φ 11)) ; <- k = 11, accurate to 4 decimal places
(newline)
(display (1/φ 15))
(newline)
(display (1/φ 20))
(newline)
(display (1/φ 30))
(newline)
(display (1/φ 40))
(newline)
(display (1/φ 100))
