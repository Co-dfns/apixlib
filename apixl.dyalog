⍝ Image Dictionary: Image Manipulation for Co-dfns
⍝ Copyright (C) 2017 Aaron W. Hsu <arcfide@sacrideo.us>
⍝ 
⍝ This program is free software: you can redistribute it and/or modify
⍝ it under the terms of the GNU Affero General Public License as published by
⍝ the Free Software Foundation, either version 3 of the License, or
⍝ (at your option) any later version.
⍝ 
⍝ This program is distributed in the hope that it will be useful,
⍝ but WITHOUT ANY WARRANTY; without even the implied warranty of
⍝ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
⍝ GNU Affero General Public License for more details.
⍝ 
⍝ You should have received a copy of the GNU Affero General Public License
⍝ along with this program.  If not, see <http://www.gnu.org/licenses/>.

:Namespace apixl

⎕IO←0

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

⍝ view: [tmpname] view ffimg
⍝  View an image using [tmpname] as a temporary file
view←{⍺←'./.ffdict.ff' ⋄ _←⍵ store ⍺
  ⎕SH'lel -a -t "ffdict Preview" ''',⍺,''''}

⍝ fliph: ffimg ← fliph ffimg
⍝  Flip an image along its horizontal axis
fliph←{⊖⍵}

⍝ flipv: ffimg ← flipv ffimg
⍝  Flip an image along its vertical axis
flipv←{⌽[1]⍵}

⍝ rotcw90: ffimg ← rotcw90 ffimg
⍝  Rotate image 90 degrees clockwise
rotcw90←{1 0 2⍉⊖⍵}

⍝ rotccw90: ffimg ← rotccw90 ffimg
⍝  Rotate image 90 degrees counter-clockwise
rotccw90←{⊖1 0 2⍉⍵}

⍝ rot180: ffimg ← rot180 ffimg
⍝  Rotate image 180 degrees
rot180←{1 0 2⍉⊖1 0 2⍉⊖⍵}

⍝ inv: ffimg ← inv ffimg
⍝  Invert image
inv←{|⍵-⍤1⍨0,⍨3⍴65535}

⍝ opacity: ffimg ← val opacity img
⍝  Set the opacity of an image
opacity←{(3↑[2]⍵),0⌈65535⌊⌊65535×⍺}

⍝ blur: ffimg ← blur img
⍝  Gaussian blur an image
blur←{⍵[;;3],⍨⌊⊃+/,(0.0625×2*+/¨0=∘.,⍨¯1+⍳3)×¯1 0 1∘.⊖¯1 0 1⊖⍤2¨⊂3↑⍤1⊢⍵}

⍝ sharpen: ffimg ← blur img
⍝  Gaussian sharpen an image
sharpen←{⍵[;;3],⍨⌊⊃+/,(3 3⍴0 ¯1 0 ¯1 5 ¯1 0 ¯1 0)×¯1 0 1∘.⊖¯1 0 1⊖⍤2¨⊂3↑⍤1⊢⍵}

⍝ back: ffimg ← R G B back img
⍝  Replace alpha channel with background color
back←{65535,⍨⌊((1-a)∘.×⍺)+(a←⍵[;;3]÷65535)×⍤0 1⊢3↑⍤1⊢⍵}

:EndNamespace
