(define us-coins 
  (list 50 25 10 5 1))

(define uk-coins 
  (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (define (no-more? coin-values) (null? coin-values))
  (define (first-denomination coin-values) (car coin-values))
  (define (except-first-denomination coin-values) (cdr coin-values))
  (cond ((= amount 0) 
         1)
        ((or (< amount 0) 
             (no-more? coin-values)) 
         0)
        (else
         (+ (cc 
             amount
             (except-first-denomination 
              coin-values))
            (cc 
             (- amount
                (first-denomination 
                 coin-values))
             coin-values)))))

(display (cc 100 us-coins))

; the order of `coin-values` doesn't affect the result since they are stored
; in a list. Having them sorted is the same as having them scrambled
