:Namespace ffdict

⍝ load: ffimg ← load filename
⍝  Return farbfeld image from filename
load←{t←⍵ ⎕NTIE 0 64 ⋄ w h←2⊥⍉2 32⍴⎕NREAD t 11 8 8
  img⊣⎕NUNTIE t⊣img←h w 4⍴2⊥⍉(×/w h 4) 16⍴⎕NREAD t 11(×/w h 8) 16}

⍝ store: ffimg store filename
⍝  Saves a farbfeld image to the given filename, replacing it if necessary
magic←,⍉(8⍴2)⊤⎕UCS'farbfeld'
opentie←{22::⍵ ⎕NCREATE 0 ⋄ ⍵ ⎕NTIE 0 33}
store←{t←opentie ⍵ ⋄ _←magic ⎕NREPLACE t 0 11 ⋄ _←(⍉(32⍴2)⊤⌽2↑⍴⍺)⎕NREPLACE t 8 11
  _←(⍉(16⍴2)⊤,⍺)⎕NREPLACE t 16 11 ⋄ ⎕NUNTIE t}

⍝ fliph: ffimg ← fliph ffimg
⍝  Flip an image along its horizontal axis
fliph←{⊖⍵}

⍝ flipv: ffimg ← flipv ffimg
⍝  Flip an image along its vertical axis
flipv←{1 0 2⍉⊖1 0 2⍉⍵}

⍝ rotcw90: ffimg ← rotcw90 ffimg
⍝  Rotate image 90 degrees clockwise
rotcw90←{1 0 2⍉⊖⍵}

⍝ rotccw90: ffimg ← rotccw90 ffimg
⍝  Rotate image 90 degrees counter-clockwise
rotccw90←{⊖1 0 2⍉⍵}

⍝ rot180: ffimg ← rot180 ffimg
⍝  Rotate image 180 degrees
rot180←{1 0 2⍉⊖1 0 2⍉⊖⍵}

:EndNamespace
