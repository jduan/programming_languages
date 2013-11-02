
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (cond
    [(< high low) null]
    [else (cons low (sequence (+ low stride) high stride))]))

(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))

(define (list-nth-mod xs n)
  (cond
    [(< n 0) (error "list-nth-mod: negative number")]
    [(null? xs) (error "list-nth-mod: empty list")]
    [else (let [(i (remainder n (length xs)))]
            (cond
              [(zero? i) (first xs)]
              [else (list-nth-mod (rest xs) (sub1 i))]))]))

(define (stream-for-n-steps s n)
  (cond
    [(zero? n) null]
    [else (cons (car (s))
                (stream-for-n-steps (cdr (s)) (sub1 n)))]))

(define funny-number-stream
  (letrec [(funny-part (lambda (n)
                               (if (zero? (remainder n 5))
                                 (- 0 n)
                                 n)))
           (f (lambda (start)
                      (lambda ()
                              (cons (funny-part start) (f (add1 start))))))]
    (f 1)))

(define dan-then-dog
  (letrec [(f (lambda (start)
                      (lambda ()
                              (cons start (f (if (string=? start "dan.jpg")
                                                "dog.jpg" "dan.jpg"))))))]
    (f "dan.jpg")))

(define (stream-add-zero s)
  (lambda ()
          (let [(pair (s))]
            (cons
              (cons 0 (car pair))
              (stream-add-zero (cdr pair))))))

(define (cycle-lists xs ys)
  (define (cycle xs)
    (append (rest xs) (list (first xs))))
  (lambda ()
          (cons
            (cons (first xs) (first ys))
            (cycle-lists (cycle xs) (cycle ys)))))

(define (vector-assoc v vec)
  (define (vector-finder idx vec)
    (if
      (>= idx (vector-length vec))
      #f
      (let [(pair (vector-ref vec idx))]
        (if
          (and (pair? pair) (equal? v (car pair)))
          pair
          (vector-finder (add1 idx) vec)))))
  (vector-finder 0 vec))

(define (cached-assoc xs n)
  (define cache (make-vector n #f))
  (define next-pos 0)
  (lambda (v)
          (let [(cached-value (vector-assoc v cache))]
            (cond
              [cached-value cached-value]
              [else (begin
                      (vector-set! cache next-pos (assoc v xs))
                      (set! next-pos (remainder (add1 next-pos) n))
                      (assoc v xs))]))))

(define-syntax while-less
  (syntax-rules (do)
                [(while-less e1 do e2)
                 (letrec [(v1 e1)
                          (loop (lambda (thunk)
                                        (if (>= (thunk) v1) #t
                                          (loop thunk))))]
                   (loop (lambda () e2)))]))
