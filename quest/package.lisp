(defpackage #:org.shirakumo.fraf.kandria.quest
  (:use #:cl)
  (:shadow #:condition)
  (:local-nicknames
   (#:dialogue #:org.shirakumo.fraf.kandria.dialogue))
  (:export
   #:describable
   #:name
   #:title
   #:description
   #:active-p
   #:activate
   #:deactivate
   #:complete
   #:fail
   #:try
   #:find-named
   #:storyline
   #:quests
   #:known-quests
   #:find-quest
   #:quest
   #:status
   #:author
   #:storyline
   #:tasks
   #:on-activate
   #:active-tasks
   #:make-assembly
   #:compile-form
   #:find-task
   #:task
   #:quest
   #:causes
   #:triggers
   #:all-complete
   #:on-complete
   #:on-activate
   #:invariant
   #:condition
   #:find-trigger
   #:trigger
   #:task
   #:action
   #:interaction
   #:interactable
   #:dialogue))
