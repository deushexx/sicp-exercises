(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) 
                (symbols right)) (+ (weight left) (weight right))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) 
         (cons x set))
        (else 
         (cons (car set)
               (adjoin-set x (cdr set))))))

(define (successive-merge nodes)
  (if (null? (cdr nodes))
      (car nodes)
      (let ((merged (make-code-tree (car nodes)
                                    (cadr nodes)))
            (rest (cddr nodes)))
        (successive-merge (adjoin-set merged rest)))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set 
         (make-leaf (car pair)
                    (cadr pair))
         (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge 
   (make-leaf-set pairs)))

(display (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
