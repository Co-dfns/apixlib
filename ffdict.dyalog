:Namespace ffdict

load←{t←⍵ ⎕NTIE 0 64 ⋄ w h←2⊥⍉2 32⍴⎕NREAD t 11 8 8
  img⊣⎕NUNTIE t⊣img←h w 4⍴2⊥⍉(×/w h 4) 16⍴⎕NREAD t 11(×/w h 8) 16}

magic←,⍉(8⍴2)⊤⎕UCS'farbfeld'
opentie←{22::⍵ ⎕NCREATE 0 ⋄ ⍵ ⎕NTIE 0 33}
store←{t←opentie ⍵ ⋄ (magic,(,⍉(32⍴2)⊤⌽2↑⍴⍺),,⍉(16⍴2)⊤,⍺)⎕NREPLACE t 0 11 ⋄ ⎕NUNTIE t}

:EndNamespace
