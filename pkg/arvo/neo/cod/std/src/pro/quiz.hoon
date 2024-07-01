=<  quiz
|%
+$  quiz
  $:  fore=@t
      back=@t
      =mode
      =view
      flipped=?
      =learned
  ==
::
+$  mode  ?(%edit %both %preview %study)
+$  view  (unit show)
+$  show  (each (pair manx manx) tang)
+$  learned
  $:  ease=@rs
      interval=@dr
      box=@
  ==
+$  recall-grade  ?(%again %hard %good %easy)
--
