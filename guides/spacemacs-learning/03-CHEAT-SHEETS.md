# Spacemacs Cheat Sheets

**Print these and keep on your desk during each week**

---

## 📄 Week 1 Cheat Sheet: Vim Basics

```
┌─────────────────────────────────────────┐
│      VIM FUNDAMENTALS - WEEK 1          │
└─────────────────────────────────────────┘

MODES
─────
i       Enter INSERT mode (type normally)
ESC     Return to NORMAL mode
fd      Quick ESC alternative

NAVIGATION (hjkl)
─────────────────
h       Left  ←
j       Down  ↓  
k       Up    ↑
l       Right →

WORD MOVEMENT
─────────────
w       Next word
b       Back word
e       End of word

LINE MOVEMENT
─────────────
0       Beginning of line
$       End of line
^       First non-space char

EDITING
───────
x       Delete character
dd      Delete line
yy      Copy (yank) line
p       Paste
u       Undo

VISUAL MODE
───────────
v       Visual (character)
V       Visual (line)
y       Yank selection
d       Delete selection

SURVIVAL
────────
:w      Save
:q      Quit
:wq     Save & quit
```

---

## 📄 Week 2 Cheat Sheet: Spacemacs

```
┌─────────────────────────────────────────┐
│    SPACEMACS ESSENTIALS - WEEK 2        │
└─────────────────────────────────────────┘

DISCOVERY
─────────
SPC          Open menu (then explore!)
SPC SPC      Execute command by name

FILES (SPC f)
─────────────
SPC f f      Find file
SPC f s      Save file
SPC f r      Recent files
SPC f t      File tree

BUFFERS (SPC b)
───────────────
SPC b b      Switch buffer
SPC TAB      Previous buffer
SPC b k      Kill buffer
SPC b d      Kill other buffers

WINDOWS (SPC w)
───────────────
SPC w /      Split vertical |
SPC w -      Split horizontal ─
SPC w d      Delete window
SPC w w      Cycle windows

PROJECTS (SPC p)
────────────────
SPC p f      Find in project
SPC p p      Switch project
SPC p t      Toggle impl/test

SEARCH
──────
/            Search forward
n            Next match
N            Previous match
SPC s s      Enhanced search
SPC s p      Search in project

GIT
───
SPC g s      Magit status
SPC g b      Git blame
```

---

## 📄 Week 3 Cheat Sheet: R Development

```
┌─────────────────────────────────────────┐
│    R DEVELOPMENT - WEEK 3               │
└─────────────────────────────────────────┘

ESS BASICS (SPC m or ,)
───────────────────────
SPC m s      Start R REPL
, s          (shortcut for above)

EVALUATE CODE
─────────────
, e e        Eval function/region
, e l        Eval line
, e b        Eval buffer
, h h        R help

YOUR CUSTOM BINDINGS
────────────────────
, r r        Insert roxygen
, u r        usethis::use_r()
, u t        usethis::use_test()
, u p        usethis::use_package_doc()

S7 HELPERS
──────────
, s c        S7 class skeleton
, s m        S7 method skeleton
, s g        S7 generic skeleton

WORKFLOW
────────
1. SPC p f       Find R file
2. Write code
3. , r r         Document
4. SPC f s       Save
5. , e e         Eval in R
6. , u t         Create test
7. Write test
8. Run & iterate

REMEMBER
────────
, = SPC m (saves typing!)
```

---

## 📄 Week 4 Cheat Sheet: Advanced

```
┌─────────────────────────────────────────┐
│    ADVANCED FEATURES - WEEK 4           │
└─────────────────────────────────────────┘

TEXT OBJECTS
────────────
ci"     Change inside "quotes"
ci(     Change inside (parens)
ci{     Change inside {braces}
di<     Delete inside <brackets>
ca"     Change around "quotes"
da(     Delete around (parens)

Example in R:
  my_func("hello")
         ^
  Press ci" → type → new text inside quotes

MACROS
──────
qa      Start recording macro 'a'
q       Stop recording
@a      Play macro 'a'
@@      Repeat last macro

Example: Add semicolons to 10 lines
1. qa          (start recording)
2. $a;<ESC>j   (go to end, add ;, move down)
3. q           (stop)
4. 9@@         (repeat 9 times)

MARKS
─────
ma      Set mark 'a'
'a      Jump to mark 'a'

GIT (Magit)
───────────
SPC g s      Status
s            Stage file
u            Unstage
c c          Commit
P p          Push
F p          Pull

HELP SYSTEM
───────────
SPC h d k    Describe key
SPC h d f    Describe function
SPC h d v    Describe variable

CUSTOMIZATION
─────────────
Edit: ~/.spacemacs
SPC f e d    Open config
SPC f e R    Reload config
```

---

## 📄 Emergency Card (Keep Always)

```
┌─────────────────────────────────────────┐
│         EMERGENCY REFERENCE             │
└─────────────────────────────────────────┘

STUCK? CANCEL EVERYTHING
────────────────────────
C-g C-g C-g    (Hold Ctrl, press g 3x)
ESC ESC ESC    (Press Escape 3 times)

HOW DO I...
───────────
Save?           SPC f s  or  :w
Quit?           SPC q q  or  :q
Undo?           u  (in normal mode)
Search?         /  then type
Go back?        ESC (to normal mode)

MODES
─────
Normal mode    ESC or fd
Insert mode    i
Visual mode    v

GET HELP
────────
SPC h d k      What does this key do?
SPC SPC        Find any command
SPC ?          Show all keybindings

MOUSE STILL WORKS
─────────────────
(But try not to use it!)
```

---

## 🎯 Daily Practice Routine

```
┌─────────────────────────────────────────┐
│      15-MINUTE DAILY ROUTINE            │
└─────────────────────────────────────────┘

WARM-UP (3 min)
───────────────
□ Navigate 50 lines with hjkl
□ Delete 5 lines with dd
□ Copy/paste 3 functions

TECHNIQUE (5 min)
─────────────────
□ Practice new command 20x
□ Combine with previous commands
□ Time yourself

APPLICATION (7 min)
───────────────────
□ Edit real R code
□ Force keyboard-only
□ Note what's awkward
□ Look up solution

REVIEW
──────
□ What got easier today?
□ What's still hard?
□ Tomorrow's focus?
```

---

## 💡 Motivation

```
┌─────────────────────────────────────────┐
│         LEARNING TIMELINE               │
└─────────────────────────────────────────┘

Day 1-3:  😫 "This is impossible!"
          Normal. Everyone feels this.

Day 4-7:  😐 "Still frustrating..."
          Muscle memory forming.

Week 2:   🤔 "Getting there..."
          Some things feel natural.

Week 3:   😊 "This is actually nice!"
          Productivity returning.

Week 4:   🚀 "Faster than before!"
          Mastery approaching.

Month 2:  ⚡ "Can't imagine going back!"
          New baseline achieved.

REMEMBER: Week 1 is the worst.
          Week 2 is still hard.
          Week 3 is the breakthrough.
          Week 4 is the reward.

YOU'VE GOT THIS! 💪
```
