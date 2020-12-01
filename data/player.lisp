(:source "player.json"
 :animations
  (
   (STAND                :start   0 :end   8 :loop-to 0   :next STAND)
   (IDLE                 :start   8 :end  42 :loop-to 8   :next STAND)
   (RUN                  :start  42 :end  58 :loop-to 42  :next RUN)
   (JUMP                 :start  58 :end  61 :loop-to 58  :next FALL)
   (FALL                 :start  63 :end  67 :loop-to 63  :next FALL)
   (SLIDE                :start  67 :end  73 :loop-to 72  :next SLIDE)
   (CLIMB                :start  73 :end  85 :loop-to 73  :next CLIMB)
   (CRAWL                :start  85 :end  93 :loop-to 85  :next CRAWL)
   (DASH                 :start  93 :end 102 :loop-to 98  :next DASH)
   (EVADE-LEFT           :start 102 :end 113 :loop-to 102 :next STAND)
   (EVADE-RIGHT          :start 113 :end 124 :loop-to 113 :next STAND)
   (PULL-GUN             :start 124 :end 136 :loop-to 135 :next SHOOT)
   (SHOOT                :start 136 :end 140 :loop-to 136 :next SHOOT)
   (PULL-SWORD           :start 140 :end 146 :loop-to 145 :next STAND)
   (LIGHT-GROUND         :start 146 :end 188 :loop-to 112 :next LIGHT-GROUND)
   (LIGHT-GROUND-1       :start 146 :end 154 :loop-to 123 :next LIGHT-GROUND-1-RELEASE)
   (LIGHT-GROUND-1-RELEASE :start 154 :end 162 :loop-to 122 :next STAND)
   (LIGHT-GROUND-2       :start 162 :end 169 :loop-to 133 :next LIGHT-GROUND-2-RELEASE)
   (LIGHT-GROUND-2-RELEASE :start 169 :end 172 :loop-to 132 :next STAND)
   (LIGHT-GROUND-3       :start 172 :end 188 :loop-to 176 :next STAND)
   (HEAVY-GROUND         :start 188 :end 234 :loop-to 151 :next HEAVY-GROUND)
   (HEAVY-GROUND-1       :start 188 :end 197 :loop-to 167 :next HEAVY-GROUND-1-RELEASE)
   (HEAVY-GROUND-1-RELEASE :start 197 :end 202 :loop-to 166 :next STAND)
   (HEAVY-GROUND-2       :start 202 :end 210 :loop-to 196 :next STAND)
   (HEAVY-GROUND-2-RELEASE :start 210 :end 215 :loop-to 176 :next HEAVY-GROUND-2-RELEASE)
   (HEAVY-GROUND-3       :start 215 :end 234 :loop-to 181 :next STAND)
   (LIGHT-UP             :start 234 :end 243 :loop-to 200 :next STAND)
   (HEAVY-UP             :start 243 :end 253 :loop-to 244 :next STAND)
   (LIGHT-AERIAL-1       :start 253 :end 260 :loop-to 254 :next LIGHT-AERIAL-1-RELEASE)
   (LIGHT-AERIAL-1-RELEASE :start 260 :end 262 :loop-to 261 :next STAND)
   (LIGHT-AERIAL-2       :start 262 :end 269 :loop-to 263 :next LIGHT-AERIAL-2-RELEASE)
   (LIGHT-AERIAL-2-RELEASE :start 269 :end 271 :loop-to 270 :next STAND)
   (LIGHT-AERIAL-3       :start 271 :end 280 :loop-to 272 :next STAND)
   (HEAVY-AERIAL-1       :start 280 :end 292 :loop-to 281 :next HEAVY-AERIAL-1-RELEASE)
   (HEAVY-AERIAL-1-RELEASE :start 292 :end 294 :loop-to 293 :next STAND)
   (HEAVY-AERIAL-2       :start 294 :end 304 :loop-to 295 :next HEAVY-AERIAL-2-RELEASE)
   (HEAVY-AERIAL-2-RELEASE :start 304 :end 306 :loop-to 305 :next STAND)
   (HEAVY-AERIAL-3       :start 306 :end 318 :loop-to 313 :next HEAVY-AERIAL-3)
   (HEAVY-AERIAL-3-RELEASE :start 318 :end 322 :loop-to 318 :next STAND)
   (LIGHT-AERIAL-DOWN    :start 322 :end 331 :loop-to 346 :next STAND)
   (HEAVY-AERIAL-DOWN    :start 331 :end 361 :loop-to 355 :next STAND)
   (ENTER                :start 361 :end 370 :loop-to 385 :next ENTER)
   (EXIT                 :start 370 :end 379 :loop-to 394 :next STAND)
   (DIE                  :start 379 :end 390 :loop-to 413 :next STAND)
   (HARD-HIT             :start 379 :end 390 :loop-to 403 :next STAND)
   (LIGHT-HIT            :start 390 :end 398 :loop-to 414 :next STAND)
   (T-POSE               :start 398 :end 399 :loop-to 398 :next T-POSE))
 :frames
  (
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  2.0  0.0  0.0) :offset ( 0.0  0.0)) ;   1
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   2
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   3
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   4
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   5
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   6
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   7
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   8
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;   9
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  10
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  11
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  12
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  13
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  14
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  15
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  16
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  17
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  18
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  19
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  20
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  21
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  22
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  23
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  24
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  25
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  26
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  27
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  28
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  29
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  30
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  31
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  32
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  33
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  34
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  35
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  36
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  37
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  38
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  39
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  40
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  41
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  42
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  43
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  44
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  45
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect STEP       :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  46
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  47
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  48
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  49
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  50
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  51
 (:damage 0   :stun-time 0.0 :flags #b0111 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  52
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  53
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect STEP       :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  54
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  55
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  56
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  57
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  58
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  59
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  60
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  61
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  62
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  63
 (:damage 0   :stun-time 0.0 :flags #b0100 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  64
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  65
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  66
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  67
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  68
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  69
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  70
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  71
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  72
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  73
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  74
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  75
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  76
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  77
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  78
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  79
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  80
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  81
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  82
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  83
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  84
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  85
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  86
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  87
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  88
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  89
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  90
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  91
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  92
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  93
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  94
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  95
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  96
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  97
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  98
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ;  99
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 100
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 101
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 102
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.81  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 103
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration (-2.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 104
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration (-20.  0.0) :multiplier (0.91  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 105
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration (-3.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 106
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 107
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.99  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 108
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.98  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 109
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.9  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 110
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 111
 (:damage 0   :stun-time 0.0 :flags #b0110 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 112
 (:damage 0   :stun-time 0.0 :flags #b0111 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 113
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration (10.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 114
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 115
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 116
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 117
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 118
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 119
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 120
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.95  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 121
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 122
 (:damage 0   :stun-time 0.0 :flags #b0110 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 123
 (:damage 0   :stun-time 0.0 :flags #b0111 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 124
 (:damage 0   :stun-time 0.0 :flags #b0000 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 125
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 126
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 127
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 128
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 129
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 130
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 131
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 132
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 133
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 134
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 135
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 136
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 137
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 138
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 139
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 140
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 141
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 142
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 143
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 144
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 145
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 146
 (:damage 0   :stun-time 0.0 :flags #b0011 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.92  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 147
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 148
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 149
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration (10.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (15.3  2.1 26.2 11.6) :offset ( 0.0  0.0)) ; 150
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.2  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-0.2  2.2 32.6 10.4) :offset ( 0.0  0.0)) ; 151
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-8.0 -0.6 20.6  8.4) :offset ( 0.0  0.0)) ; 152
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-13. -2.0 17.6  8.6) :offset ( 0.0  0.0)) ; 153
 (:damage 5   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 0.0  0.0) :hurtbox (-19. -0.2 13.6  7.2) :offset ( 0.0  0.0)) ; 154
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox (37.0 -28.  0.0  0.0) :offset ( 0.0  0.0)) ; 155
 (:damage 0   :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.6  1.0) :knockback ( 0.0  0.0) :hurtbox (-0.5  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 156
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-9.0 11.2  8.0 10.3) :offset ( 0.0  0.0)) ; 157
 (:damage 5   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (7.02 10.5  8.5  8.0) :offset ( 0.0  0.0)) ; 158
 (:damage 5   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (3.52 -5.8  6.0 8.75) :offset ( 0.0  0.0)) ; 159
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 160
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 161
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 162
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 163
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-1.7  3.5 0.75  0.0) :offset ( 0.0  0.0)) ; 164
 (:damage 10  :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 5.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (11.6 8.49 17.8 20.7) :offset ( 0.0  0.0)) ; 165
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (3.75 23.0 20.3 10.3) :offset ( 0.0  0.0)) ; 166
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox (-3.0 21.3 9.25 9.92) :offset ( 0.0  0.0)) ; 167
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox (-10. 16.5  0.0  0.5) :offset ( 0.0  0.0)) ; 168
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (46.5 10.0  0.0  0.0) :offset ( 0.0  0.0)) ; 169
 (:damage 0   :stun-time 0.0 :flags #b0000 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.5  1.0) :knockback ( 0.0  0.0) :hurtbox (70.5  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 170
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 171
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 172
 (:damage 0   :stun-time 0.0 :flags #b1111 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 173
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.5  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 174
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (9.43 6.14 10.1 3.19) :offset ( 0.0  0.0)) ; 175
 (:damage 15  :stun-time 0.7 :flags #b1001 :effect NIL        :acceleration (20.0  0.0) :multiplier ( 2.0  1.0) :knockback ( 2.2  1.0) :hurtbox (24.8  6.3 15.0 6.05) :offset ( 0.0  0.0)) ; 176
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 5.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 0.0  0.0) :hurtbox (27.1 1.09 17.2 12.6) :offset ( 0.0  0.0)) ; 177
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 2.0  0.0) :multiplier ( 0.9  1.0) :knockback ( 0.0  0.0) :hurtbox (31.4 3.95 20.3 15.1) :offset ( 0.0  0.0)) ; 178
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 1.0  0.0) :multiplier ( 0.9  1.0) :knockback ( 0.0  0.0) :hurtbox (31.5  1.6 21.8 15.8) :offset ( 0.0  0.0)) ; 179
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.5  0.0) :multiplier ( 0.9  1.0) :knockback ( 0.0  0.0) :hurtbox (31.5  2.6 21.0 16.0) :offset ( 0.0  0.0)) ; 180
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.5  0.0) :multiplier (0.99  1.0) :knockback ( 0.0  0.0) :hurtbox (28.8  3.6 22.6 15.0) :offset ( 0.0  0.0)) ; 181
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.5  0.0) :multiplier (0.99  1.0) :knockback ( 0.0  0.0) :hurtbox (31.5  4.4 21.0 17.8) :offset ( 0.0  0.0)) ; 182
 (:damage 15  :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.5  0.0) :multiplier (0.99  1.0) :knockback ( 0.0  0.0) :hurtbox (30.9  2.2 23.4 15.2) :offset ( 0.0  0.0)) ; 183
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.5  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (32.7  1.2 20.6 15.4) :offset ( 0.0  0.0)) ; 184
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (33.0  2.4 18.8 16.2) :offset ( 0.0  0.0)) ; 185
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.91  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 186
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.71  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 187
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 188
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 189
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-82. -15.  0.0 .167) :offset ( 0.0  0.0)) ; 190
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 191
 (:damage 15  :stun-time 0.2 :flags #b0011 :effect GROUND-HIT :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0  2.0) :hurtbox ( 7.2 10.8 44.0 29.4) :offset ( 0.0  0.0)) ; 192
 (:damage 15  :stun-time 0.2 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0  2.0) :hurtbox (21.8 9.99 30.8 26.0) :offset ( 0.0  0.0)) ; 193
 (:damage 0   :stun-time 0.2 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 194
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 195
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 196
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 197
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 198
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 2.5 -7.0  0.0  0.0) :offset ( 0.0  0.0)) ; 199
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (22.0 -8.0  0.0  0.0) :offset ( 0.0  0.0)) ; 200
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (43.0 -8.0  0.0  0.0) :offset ( 0.0  0.0)) ; 201
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (33.0 -2.0  0.0  0.0) :offset ( 0.0  0.0)) ; 202
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 203
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration (16.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 204
 (:damage 20  :stun-time 0.2 :flags #b0001 :effect NIL        :acceleration ( 9.0  0.0) :multiplier (0.91  1.0) :knockback ( 3.0  2.0) :hurtbox (-7.2 15.4 25.6 24.4) :offset ( 0.0  0.0)) ; 205
 (:damage 20  :stun-time 0.3 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.8  1.0) :knockback ( 4.0  2.0) :hurtbox ( 9.4 21.8 38.6 20.4) :offset ( 0.0  0.0)) ; 206
 (:damage 20  :stun-time 0.3 :flags #b0001 :effect GROUND-HIT :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0  2.0) :hurtbox (13.8 12.7 39.5 29.0) :offset ( 0.0  0.0)) ; 207
 (:damage 20  :stun-time 0.2 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.71  1.0) :knockback ( 2.0  1.0) :hurtbox (35.5  6.0 17.8 21.0) :offset ( 0.0  0.0)) ; 208
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 209
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 210
 (:damage 0   :stun-time 0.0 :flags #b1101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 211
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 212
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 213
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 214
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-1.8 -5.8 .167 .167) :offset ( 0.0  0.0)) ; 215
 (:damage 0   :stun-time 0.0 :flags #b1000 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier ( 0.7  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 216
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 217
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 8.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-20.  1.6 21.0 11.8) :offset ( 0.0  0.0)) ; 218
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration (15.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-16.  5.8 25.4 14.0) :offset ( 0.0  0.0)) ; 219
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.98  1.0) :knockback ( 2.0  2.0) :hurtbox (11.0  6.4 34.6  9.8) :offset ( 0.0  0.0)) ; 220
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 2.0  2.0) :hurtbox (10.0  2.8 35.6 11.8) :offset ( 0.0  0.0)) ; 221
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-9.6 -0.4 30.0 10.6) :offset ( 0.0  0.0)) ; 222
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-15.  4.6 23.8 12.4) :offset ( 0.0  0.0)) ; 223
 (:damage 25  :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 3.0  2.0) :hurtbox (11.6  6.2 33.2  9.6) :offset ( 0.0  0.0)) ; 224
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 1.0  1.0) :hurtbox (12.2  3.6 34.2 13.0) :offset ( 0.0  0.0)) ; 225
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect SLASH      :acceleration ( 0.0  0.0) :multiplier (.981  1.0) :knockback ( 0.0  0.0) :hurtbox (-10.  1.2 32.6 10.6) :offset ( 0.0  0.0)) ; 226
 (:damage 25  :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (.981  1.0) :knockback ( 0.0  0.0) :hurtbox (-15.  4.2 25.2 11.2) :offset ( 0.0  0.0)) ; 227
 (:damage 25  :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (.981  1.0) :knockback ( 3.0  1.0) :hurtbox (12.2  3.2 34.2 11.4) :offset ( 0.0  0.0)) ; 228
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (.951  1.0) :knockback ( 3.0  1.0) :hurtbox (11.6  2.8 33.2 13.0) :offset ( 0.0  0.0)) ; 229
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (.951  1.0) :knockback ( 0.0  0.0) :hurtbox (-9.4  0.6 30.6 10.0) :offset ( 0.0  0.0)) ; 230
 (:damage 25  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-14.  4.4 25.2 11.0) :offset ( 0.0  0.0)) ; 231
 (:damage 30  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 1.0  1.0) :hurtbox ( 7.6  2.8 24.0 10.6) :offset ( 0.0  0.0)) ; 232
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 233
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 234
 (:damage 0   :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.71  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 235
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 236
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 4.5 28.5 12.8 12.5) :offset ( 0.0  0.0)) ; 237
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-1.2 29.8 14.8 14.0) :offset ( 0.0  0.0)) ; 238
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-5.8 28.2 13.5 12.8) :offset ( 0.0  0.0)) ; 239
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 240
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (9.33 7.33  0.0 .333) :offset ( 0.0  0.0)) ; 241
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 242
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 243
 (:damage 0   :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.71  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 244
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 245
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 246
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0 200.) :multiplier ( 1.0 0.71) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 247
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0 40.0) :multiplier ( 1.0  0.9) :knockback ( 1.0  5.5) :hurtbox (23.7 1.33 14.7 19.7) :offset ( 0.0  0.0)) ; 248
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  8.0) :multiplier ( 1.0 .981) :knockback ( 1.0  5.5) :hurtbox (21.7 8.66 16.0 25.7) :offset ( 0.0  0.0)) ; 249
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0 .708) :knockback ( 1.0  5.5) :hurtbox ( 3.5 15.0 34.8 29.0) :offset ( 0.0  0.0)) ; 250
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 1.0  5.5) :hurtbox (-2.0 14.5 35.3 28.2) :offset ( 2.0  0.0)) ; 251
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 1.0  5.5) :hurtbox (-21. 12.8 17.5 30.0) :offset ( 0.0  0.0)) ; 252
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 253
 (:damage 0   :stun-time 0.0 :flags #b0100 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.81  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 254
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 255
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (25.6  9.0 23.2  9.0) :offset ( 0.0  0.0)) ; 256
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (24.9 1.67 21.2 15.3) :offset ( 0.0 -5.0)) ; 257
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (11.2 -7.3 29.5 17.3) :offset ( 0.0 -10.)) ; 258
 (:damage 5   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (-4.9 -3.2 19.7 10.5) :offset ( 0.0  0.0)) ; 259
 (:damage 5   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (-13. -2.5 14.7 9.17) :offset ( 0.0  0.0)) ; 260
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0 0.81) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 261
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 262
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 263
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 264
 (:damage 8   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (27.6  2.5 21.5 14.2) :offset ( 0.0  0.0)) ; 265
 (:damage 8   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (11.9  1.5 38.5 14.8) :offset ( 0.0  0.0)) ; 266
 (:damage 8   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (26.6 .167 39.8 15.8) :offset ( 0.0  0.0)) ; 267
 (:damage 8   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (41.4  1.0 27.3 15.3) :offset ( 0.0  0.0)) ; 268
 (:damage 8   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (53.7 -0.5 16.0 13.2) :offset ( 0.0  0.0)) ; 269
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 270
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 271
 (:damage 0   :stun-time 0.0 :flags #b1001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 272
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 273
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.13  0.0) :hurtbox (24.6  9.5 16.5 4.83) :offset ( 0.0  0.0)) ; 274
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.13  0.0) :hurtbox (39.9 9.83 32.2  6.5) :offset ( 0.0  0.0)) ; 275
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.13  0.0) :hurtbox (49.7 7.45 35.0 11.7) :offset ( 7.0  0.0)) ; 276
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.13  0.0) :hurtbox (52.0 9.45 40.0 13.3) :offset (16.0  0.0)) ; 277
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.13  0.0) :hurtbox (52.5 9.45 39.8 12.0) :offset (16.0  0.0)) ; 278
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.13  0.0) :hurtbox (35.7 9.67 31.0  9.0) :offset ( 0.0  0.0)) ; 279
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (15.2 11.0 20.2 4.17) :offset ( 0.0  0.0)) ; 280
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.71  0.4) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 281
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.4) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 282
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 283
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 284
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.05 0.05) :hurtbox (-7.4 22.8 22.5 15.8) :offset ( 0.0  0.0)) ; 285
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.5  0.5) :hurtbox (9.29 -2.6 24.3 33.3) :offset ( 0.0 -23.)) ; 286
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback (0.05 0.05) :hurtbox (3.62 -4.2 27.7 28.3) :offset ( 0.0 -27.)) ; 287
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.5 0.05) :hurtbox (-2.5 -12. 32.5 18.8) :offset ( 0.0 -20.)) ; 288
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.5 0.05) :hurtbox (-18. -8.7 17.7 16.8) :offset ( 0.0 -17.)) ; 289
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.5 0.05) :hurtbox (-21. 1.61 16.2 11.2) :offset ( 0.0 -11.)) ; 290
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 291
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 292
 (:damage 0   :stun-time 0.0 :flags #b0000 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0 0.71) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 293
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0 0.81) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 294
 (:damage 0   :stun-time 0.0 :flags #b1010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.4) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 295
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 296
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 297
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (10.6 7.11 39.7 12.0) :offset ( 0.0  0.0)) ; 298
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (17.5 4.77 29.2 13.7) :offset ( 0.0  0.0)) ; 299
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (16.1 7.44 31.5 10.7) :offset ( 0.0  0.0)) ; 300
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (8.29 11.1 25.7 10.0) :offset ( 0.0  0.0)) ; 301
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox (-.04 11.4 16.0  9.0) :offset ( 0.0  0.0)) ; 302
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 303
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 304
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0 0.71) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 305
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0 0.81) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 306
 (:damage 0   :stun-time 0.0 :flags #b0000 :effect NIL        :acceleration ( 0.0 -1.0) :multiplier ( 1.0  0.0) :knockback ( 0.3  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 307
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 308
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  2.0) :multiplier ( 1.0  0.3) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0 -2.0)) ; 309
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0 -30.) :multiplier ( 1.0  0.8) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 310
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0 -25.) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (12.5 14.8 30.0 31.2) :offset ( 0.0  0.0)) ; 311
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0 -20.) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (25.0 14.2 18.3 30.0) :offset ( 0.0  0.0)) ; 312
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0 -5.0) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (23.7 8.38 20.3 25.5) :offset ( 0.0  0.0)) ; 313
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (23.8 15.2 23.5 24.0) :offset ( 0.0  0.0)) ; 314
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (25.4 4.33 18.7 20.3) :offset ( 0.0  0.0)) ; 315
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (23.1 7.66 20.0 24.3) :offset ( 0.0  0.0)) ; 316
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (24.2 8.49 18.5 22.8) :offset ( 0.0  0.0)) ; 317
 (:damage 20  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 5.0 -2.0) :hurtbox (24.7 10.8 18.3 26.5) :offset ( 0.0  0.0)) ; 318
 (:damage 0   :stun-time 0.0 :flags #b1001 :effect GROUND-HIT :acceleration ( 0.0  0.0) :multiplier (0.71 0.71) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 319
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 320
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 321
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 322
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.7  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 323
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 324
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0 -.11) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 325
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0 -.11) :hurtbox ( 2.5 -21. 14.8 20.0) :offset ( 0.0 -25.)) ; 326
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0 -.11) :hurtbox ( 4.0 -20. 12.7 21.3) :offset ( 0.0 -25.)) ; 327
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0 -.11) :hurtbox (.333 -14.  9.0 25.2) :offset ( 0.0 -25.)) ; 328
 (:damage 10  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0 -.11) :hurtbox (-.17 -14. 7.83 21.2) :offset ( 0.0 -25.)) ; 329
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0 -5.0)) ; 330
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 331
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier (0.71  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 332
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 333
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 334
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 335
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration (15.0 -20.) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (1.33 -2.0 17.7 19.2) :offset ( 0.0 -8.0)) ; 336
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 5.0 -10.) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-17. 16.5 27.0 29.0) :offset (-10.  0.0)) ; 337
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-15. 17.5 25.2 31.5) :offset (-10.  0.0)) ; 338
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-17. 16.4 27.2 32.7) :offset (-10.  0.0)) ; 339
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-17. 16.0 26.3 33.0) :offset (-10.  0.0)) ; 340
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-17. 17.7 25.3 30.7) :offset (-10.  0.0)) ; 341
 (:damage 15  :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox (-14. 20.7 23.8 31.0) :offset (-10.  0.0)) ; 342
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 1.0  0.0)) ; 343
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 344
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 345
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 346
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 347
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 348
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 349
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 0.0  0.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 350
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 351
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 352
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 353
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 354
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 355
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 356
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 357
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 358
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 359
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 360
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 361
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 362
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 363
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 364
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 365
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 366
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 367
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 368
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 369
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 370
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 371
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 372
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 373
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 374
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 375
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 376
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 377
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 378
 (:damage 0   :stun-time 0.0 :flags #b0001 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 379
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 380
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 381
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 382
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 383
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 384
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 385
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 386
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 387
 (:damage 0   :stun-time 0.0 :flags #b0110 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 388
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 389
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 390
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 391
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 392
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 393
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 394
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 395
 (:damage 0   :stun-time 0.0 :flags #b0010 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 396
 (:damage 0   :stun-time 0.0 :flags #b0110 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 397
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 398
 (:damage 0   :stun-time 0.0 :flags #b0101 :effect NIL        :acceleration ( 0.0  0.0) :multiplier ( 1.0  1.0) :knockback ( 0.0  0.0) :hurtbox ( 0.0  0.0  0.0  0.0) :offset ( 0.0  0.0)) ; 399
))
