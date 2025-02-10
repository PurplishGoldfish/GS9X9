;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |GS9X9_1.0.0_(Gravity Simulator from the POV of a 5x10 Red Rectangle on a 90x90 Pixel Black Screen Version 1.0.0)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require picturing-programs)
(define (fs_gravityOnly t)
  (* (* 9.80665 t) (- 0 1)))
(define you
  (rectangle 5 10 "solid" "red"))
(define background
  (overlay/align "middle" "bottom" (rectangle 90 5 "solid" "gray") (square 90 "solid" "black")))
(define-struct game (x y x_velocity y_velocity falling_time falling?))
(define (is_falling? a)
  (cond [(<= (game-y a) 5)
         #false]
        [else
         #true]))
(define (changeGameState a)
  (cond [(or (game-falling? a) (> (game-y a) 5))
         (make-game (+ (game-x a) (game-x_velocity a)) (+ (game-y a) (game-y_velocity a)) (* 0.99 (game-x_velocity a)) (fs_gravityOnly (game-falling_time a)) (+ (game-falling_time a) 0.01) (is_falling? a))]
        [else
         (make-game (+ (game-x a) (game-x_velocity a)) 5 (* 0.35 (game-x_velocity a)) 0 0 (is_falling? a))]))
(define (draw-handler a)
  (place-image you (game-x a) (- 85 (game-y a)) background))
(define (key-handler a k)
  (cond [(key=? k "1") (make-game (game-x a) 10 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "2") (make-game (game-x a) 20 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "3") (make-game (game-x a) 30 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "4") (make-game (game-x a) 40 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "5") (make-game (game-x a) 50 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "6") (make-game (game-x a) 60 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "7") (make-game (game-x a) 70 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "8") (make-game (game-x a) 80 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "9") (make-game (game-x a) 90 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "0") (make-game (game-x a) 0 (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "q") (make-game 10 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "w") (make-game 20 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "e") (make-game 30 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "r") (make-game 40 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "t") (make-game 50 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "y") (make-game 60 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "u") (make-game 70 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "i") (make-game 80 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "o") (make-game 90 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "p") (make-game 0 (game-y a) (game-x_velocity a) (game-y_velocity a) 0 (game-falling? a))]
        [(key=? k "a") (make-game (game-x a) (game-y a) (- (game-x_velocity a) 1) (game-y_velocity a) (game-falling_time a) (game-falling? a))]
        [(key=? k "d") (make-game (game-x a) (game-y a) (+ (game-x_velocity a) 1) (game-y_velocity a) (game-falling_time a) (game-falling? a))]
        [else a]))
(big-bang (make-game 45 0 0 0 0 #false)
  (on-tick changeGameState 0.01)
  (on-key key-handler)
  (on-draw draw-handler))