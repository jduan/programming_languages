;; Programming Languages, Homework 5

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct ifgreater (e1 e2 e3 e4)    #:transparent) ;; if e1 > e2 then e3 else e4
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body)
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct aunit ()    #:transparent) ;; unit value -- good for ending a list
(struct isaunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0

;; a closure is not in "source" programs; it is what functions evaluate to
(struct closure (env fun) #:transparent)

;; Problem 1

(define (racketlist->mupllist xs)
  (cond
    [(empty? xs) (aunit)]
    [else (apair (first xs) (racketlist->mupllist (rest xs)))]))

(define (mupllist->racketlist e)
  (cond
    [(equal? (aunit) e) empty]
    [else (cons (apair-e1 e) (mupllist->racketlist (apair-e2 e)))]))

;; Problem 2

;; lookup a variable in an environment
;; Do NOT change this function
(define (envlookup env str)
  (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)]))

;; Do NOT change the two cases given to you.
;; DO add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though
;; "in real life" it would be a helper function of eval-exp.
;; env is a list of pairs
(define (eval-under-env e env)
  (cond [(var? e)
         (envlookup env (var-string e))]
        [(int? e) e]
        [(add? e)
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1)
                       (int-num v2)))
               (error "MUPL addition applied to non-number")))]
        [(ifgreater? e) (let* [(v1 (eval-under-env (ifgreater-e1 e) env))
                               (v2 (eval-under-env (ifgreater-e2 e) env))]
                          (if (and (int? v1)
                                   (int? v2))
                            (if (> (int-num v1) (int-num v2))
                              (ifgreater-e3 e)
                              (ifgreater-e4 e))
                            (error "ifgreater e1 and e2 must be numbers")))]
        [(fun? e) (closure env e)]
;(((call (closure '() (fun #f "x" (add (var "x") (int 7)))) (int 1))) (int 8) "call test")
        [(call? e) (let* [(fexp (call-funexp e))
                          (actual (eval-under-env (call-actual e) env))
                          (formal (fun-formal (closure-fun fexp)))
                          (body (fun-body (closure-fun fexp)))
                          (closure-env (closure-env fexp))
                          (new-env (cons (cons formal actual) closure-env))]
                     (eval-under-env body new-env))]
        [(mlet? e) (let* [(var-name (mlet-var e))
                          (sube (mlet-e e))
                          (subv (eval-under-env sube env))
                          (body (mlet-body e))
                          (new-env (cons (cons var-name subv) env))]
                     (eval-under-env body new-env))]
        [(apair? e) e]
        [(fst? e) (let [(pair (eval-under-env (fst-e e) env))]
                    (apair-e1 pair))]
        [(snd? e) (let [(pair (eval-under-env (snd-e e) env))]
                    (apair-e2 pair))]
        [(aunit? e) e]
        [(isaunit? e) (let [(value (eval-under-env (isaunit-e e) env))]
                        (if (equal? value (aunit))
                          (int 1)
                          (int 0)))]
        ;; CHANGE add more cases here
        [#t (error (format "bad MUPL expression: ~v" e))]))

;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))

;; Problem 3

(define (ifaunit e1 e2 e3)
  (if (aunit? e1) e2 e3))

(define (mlet* lstlst e2)
  (cond
    [(empty? lstlst) e2]
    [else (mlet (car (car lstlst)) (cdr (car lstlst))
                (mlet* (rest lstlst) e2))]))

(define (ifeq e1 e2 e3 e4)
  (if (= (int-num (eval-exp e1)) (int-num (eval-exp e2)))
    e3
    e4))

;; Problem 4

(define mupl-map "CHANGE")
;(define mupl-map
;  (closure '() (fun #f "_x"
;                    (closure '() (fun #g "_y"
;                                      (map (lambda (e) e)
;                                           e))))))
;(check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 7)))) (apair (int 1) (aunit))))
;              (apair (int 8) (aunit)) "mupl-map test")

(define mupl-mapAddN
  (mlet "map" mupl-map
        "CHANGE (notice map is now in MUPL scope)"))

;; Challenge Problem

(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function

;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e) "CHANGE")

;; Do NOT share code with eval-under-env because that will make
;; auto-grading and peer assessment more difficult, so
;; copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env) "CHANGE")

;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))
